using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.IO;
using WebQuanAoThoiTrang.Areas.Admin.Filters;
using WebQuanAoThoiTrang.Models;
using System.Web.Services.Description;
using WebQuanAoThoiTrang.Areas.Admin.Data;

namespace WebQuanAoThoiTrang.Areas.Admin.Controllers
{
    [AdminAuthorization]
    public class QLSanPhamAdminController : Controller
    {
        // GET: Admin/QLSanPhamAdmin
        private ModelQuanAo _context = new ModelQuanAo();
        public ActionResult Index(string search, string sort)
        {
            var lstSP = (from s in _context.SanPhams
                         join ncc in _context.NhaCCs on s.IDNhaCungCap equals ncc.IDNhaCungCap into ncctemp
                         from ncc in ncctemp.DefaultIfEmpty()
                         orderby s.IDSanPham descending
                         select new SanPhamDisplayVM()
                         {
                             MaSP = s.IDSanPham,
                             TenSP = s.TenSanPham,
                             Gia = s.Gia,
                             TenNCC = ncc != null ? ncc.TenNhaCungCap : "",
                             HinhAnh = s.HinhAnh,
                             SoLuongTon = s.SoLuongTon
                         }).ToList();
            /*search*/
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower(); // Chuyển đổi từ khóa tìm kiếm thành chữ thường
                lstSP = lstSP.Where(s => (s.TenSP != null && s.TenSP.ToLower().Contains(search)) ||
                                         s.Gia.ToString().Contains(search) ||
                                         (s.TenNCC != null && s.TenNCC.ToLower().Contains(search)) ||
                                         s.SoLuongTon.ToString().Contains(search)).ToList();
            }
            ViewBag.Search = search;
            /*sort*/
            ViewBag.MaSPSort = sort == "MaSP" ? "MaSP_desc" : "MaSP";
            ViewBag.TenSPSort = sort == "TenSP" ? "TenSP_desc" : "TenSP";
            ViewBag.GiaSort = sort == "Gia" ? "Gia_desc" : "Gia";
            ViewBag.SoLuongTonSort = sort == "SoLuongTon" ? "SoLuongTon_desc" : "SoLuongTon";
            ViewBag.TenNCCSort = sort == "TenNCC" ? "TenNCC_desc" : "TenNCC";
            switch (sort)
            {
                case "MaSP":
                    lstSP = lstSP.OrderBy(s => s.MaSP).ToList();
                    break;
                case "MaSP_desc":
                    lstSP = lstSP.OrderByDescending(s => s.MaSP).ToList();
                    break;
                case "TenSP":
                    lstSP = lstSP.OrderBy(s => s.TenSP).ToList();
                    break;
                case "TenSP_desc":
                    lstSP = lstSP.OrderByDescending(s => s.TenSP).ToList();
                    break;
                case "Gia":
                    lstSP = lstSP.OrderBy(s => s.Gia).ToList();
                    break;
                case "Gia_desc":
                    lstSP = lstSP.OrderByDescending(s => s.Gia).ToList();
                    break;
                case "SoLuongTon":
                    lstSP = lstSP.OrderBy(s => s.SoLuongTon).ToList();
                    break;
                case "SoLuongTon_desc":
                    lstSP = lstSP.OrderByDescending(s => s.SoLuongTon).ToList();
                    break;
                case "TenNCC":
                    lstSP = lstSP.OrderBy(s => s.TenNCC).ToList();
                    break;
                case "TenNCC_desc":
                    lstSP = lstSP.OrderByDescending(s => s.TenNCC).ToList();
                    break;
            }
            ViewBag.message = lstSP.Count();
            return View(lstSP);
        }

        public ActionResult DetailSP(int id)
        {
            var item = _context.SanPhams.Where(x => x.IDSanPham == id).Select(t => new SanPhamVM()
            {
                IDSanPham = t.IDSanPham,
                TenSanPham = t.TenSanPham,
                Gia = t.Gia,
                MoTa = t.MoTa,
                SoLuongTon = t.SoLuongTon,
                HinhAnh = t.HinhAnh,
                IDNhaCungCap = t.IDNhaCungCap,
            }).FirstOrDefault();
            if (item != null)
            {
                var ncc = _context.NhaCCs.FirstOrDefault(n => n.IDNhaCungCap == item.IDNhaCungCap);
                ViewBag.TenNCC = ncc != null ? ncc.TenNhaCungCap : "Không xác định";
            }

            return View(item);
        }

        [HttpGet]
        public ActionResult AddSP()
        {
            var lstNCC = _context.NhaCCs.OrderBy(x => x.TenNhaCungCap).ToList();

            ViewBag.IDNhaCungCap = new SelectList(lstNCC, "IDNhaCungCap", "TenNhaCungCap");
            return View();

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddSP(SanPhamVM formData, HttpPostedFileBase fileUpload)
        {
            if (ModelState.IsValid)
            {
                var item = new SanPham();
                item.TenSanPham = formData.TenSanPham;
                item.Gia = formData.Gia;
                item.MoTa = formData.MoTa;
                item.SoLuongTon = formData.SoLuongTon;
                //item.AnhBia = "";
                item.IDNhaCungCap = formData.IDNhaCungCap;

                if (fileUpload != null && fileUpload.ContentLength > 0)
                {
                    //get filename
                    var fileName = System.IO.Path.GetFileName(fileUpload.FileName);
                    //get path
                    var path = Path.Combine(Server.MapPath("~/img/img_sp/"), fileName);

                    ////ktra image exist
                    //if (System.IO.File.Exists(path))
                    //{
                    //    ViewBag.mesage = "Ảnh này đã tồn tại!";
                    //}
                    //else
                    //{
                    fileUpload.SaveAs(path);
                    //lưu file name vào DB ảnh bìa
                    item.HinhAnh = fileName;
                    //}
                }

                _context.SanPhams.Add(item);
                _context.SaveChanges();// save to DB
                return RedirectToAction("Index", "QLSanPhamAdmin");
            }
            // Thiết lập lại ViewBag.NhaCungCapID khi form không hợp lệ
            var lstNCC = _context.NhaCCs.OrderBy(x => x.TenNhaCungCap).ToList();
            ViewBag.NhaCungCapID = new SelectList(lstNCC, "IDNhaCungCap", "TenNhaCungCap");
            return View(formData);

        }
        [HttpGet]
        public ActionResult DeleteSP(int id)
        {
            var item = _context.SanPhams.Where(x => x.IDSanPham == id).Select(x => new SanPhamVM()
            {
                IDSanPham = x.IDSanPham,
                TenSanPham = x.TenSanPham,
                Gia = x.Gia,
                MoTa = x.MoTa,
            }).FirstOrDefault();
            return View(item);
        }
        [HttpPost, ActionName("DeleteSP")]
        public ActionResult ConfirmDeleteSP(int id)
        {
            var item = _context.SanPhams.Where(x => x.IDSanPham == id).FirstOrDefault();
            if (item == null)
            {
                return RedirectToAction("Index", "QLSanPhamAdmin");
            }
            _context.SanPhams.Remove(item);

            _context.SaveChanges();

            return RedirectToAction("Index", "QLSanPhamAdmin");
        }

        [HttpGet]
        public ActionResult EditSP(int id)
        {
            var lstNCC = _context.NhaCCs.OrderBy(x => x.TenNhaCungCap).ToList();

            ViewBag.MaNCC = new SelectList(lstNCC, "IDNhaCungCap", "TenNhaCungCap");
            var sp = (from item in _context.SanPhams
                      where item.IDSanPham == id
                      select new SanPhamVM()
                      {
                          IDSanPham = item.IDSanPham,
                          TenSanPham = item.TenSanPham,
                          Gia = item.Gia,
                          MoTa = item.MoTa,
                          SoLuongTon = item.SoLuongTon,
                          HinhAnh = item.HinhAnh,
                          IDNhaCungCap = item.IDNhaCungCap,

                      }).FirstOrDefault();
            if (sp == null)
            {
                return RedirectToAction("Index", "QLSanPhamAdmin");
            }
            return View(sp);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditSP(SanPhamVM formData, HttpPostedFileBase fileUpload)
        {
            if (ModelState.IsValid)
            {
                var item = _context.SanPhams.Where(x => x.IDSanPham == formData.IDSanPham).FirstOrDefault();
                if (item == null)
                {
                    return RedirectToAction("Index", "QLSanPhamAdmin");
                }

                item.TenSanPham = formData.TenSanPham;
                item.Gia = formData.Gia;
                item.MoTa = formData.MoTa;
                item.SoLuongTon = formData.SoLuongTon;
                item.IDNhaCungCap = formData.IDNhaCungCap;

                if (fileUpload != null && fileUpload.ContentLength > 0)
                {
                    // Get filename
                    var fileName = System.IO.Path.GetFileName(fileUpload.FileName);
                    // Get path
                    var path = Path.Combine(Server.MapPath("~/img/img_sp/"), fileName);



                    // Check if old image exists and delete it
                    if (!string.IsNullOrEmpty(item.HinhAnh))
                    {
                        var oldImagePath = Path.Combine(Server.MapPath("~/img/img_sp/"), item.HinhAnh);
                        if (System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }
                    }

                    // Save new image
                    fileUpload.SaveAs(path);
                    // Update image name in the database
                    item.HinhAnh = fileName;

                }

                _context.Entry(item).State = EntityState.Modified;
                _context.SaveChanges(); // Save to DB
                return RedirectToAction("Index", "QLSanPhamAdmin");
            }
            var lstNCC = _context.NhaCCs.OrderBy(x => x.TenNhaCungCap).ToList();
            ViewBag.MaNCC = new SelectList(lstNCC, "NhaCungCapID", "TenNhaCungCap");
            return View(formData);
        }
    }
}
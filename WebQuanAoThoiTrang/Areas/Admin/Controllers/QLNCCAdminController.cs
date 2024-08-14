using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using WebQuanAoThoiTrang.Areas.Admin.Data;
using WebQuanAoThoiTrang.Areas.Admin.Filters;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Areas.Admin.Controllers
{
    [AdminAuthorization]
    public class QLNCCAdminController : Controller
    {
        // GET: Admin/QLNCCAdmin
        private ModelQuanAo _context = new ModelQuanAo();
        public ActionResult Index(string search, string sort)
        {
            var lstNcc = (from n in _context.NhaCCs
                          orderby n.IDNhaCungCap descending
                          select new NhaCungCapVM()
                          {
                              IDNhaCungCap = n.IDNhaCungCap,
                              TenNhaCungCap = n.TenNhaCungCap,
                              SoDienThoai = n.SoDienThoai,
                              DiaChi = n.DiaChi,
                              Email = n.Email,
                          }).ToList();
            /*search*/
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower(); // Chuyển đổi từ khóa tìm kiếm thành chữ thường
                lstNcc = lstNcc.Where(n => (n.TenNhaCungCap != null && n.TenNhaCungCap.ToLower().Contains(search)) ||
                                         n.DiaChi.ToString().ToLower().Contains(search) ||
                                         (n.SoDienThoai != null && n.SoDienThoai.ToLower().Contains(search)) ||
                                         n.Email.ToLower().Contains(search)).ToList();
            }
            ViewBag.Search = search;
            /*sort*/
            ViewBag.MaNccSort = string.IsNullOrEmpty(sort) ? "MaNcc_desc" : "";
            ViewBag.TenNccSort = sort == "TenNhaCungCap" ? "TenNcc_desc" : "TenNhaCungCap";
            ViewBag.SdtSort = sort == "SoDienThoai" ? "Sdt_desc" : "SoDienThoai";
            ViewBag.DiachiSort = sort == "DiaChi" ? "DiaChi_desc" : "DiaChi";
            ViewBag.EmailSort = sort == "Email" ? "Email_desc" : "Email";
            switch (sort)
            {
                case "MaSP_desc":
                    lstNcc = lstNcc.OrderByDescending(s => s.IDNhaCungCap).ToList();
                    break;
                case "TenNhaCungCap":
                    lstNcc = lstNcc.OrderBy(s => s.TenNhaCungCap).ToList();
                    break;
                case "TenNcc_desc":
                    lstNcc = lstNcc.OrderByDescending(s => s.TenNhaCungCap).ToList();
                    break;
                case "SoDienThoai":
                    lstNcc = lstNcc.OrderBy(s => s.SoDienThoai).ToList();
                    break;
                case "Sdt_desc":
                    lstNcc = lstNcc.OrderByDescending(s => s.SoDienThoai).ToList();
                    break;
                case "DiaChi":
                    lstNcc = lstNcc.OrderBy(s => s.DiaChi).ToList();
                    break;
                case "DiaChi_desc":
                    lstNcc = lstNcc.OrderByDescending(s => s.DiaChi).ToList();
                    break;
                case "Email":
                    lstNcc = lstNcc.OrderBy(s => s.Email).ToList();
                    break;
                case "Email_desc":
                    lstNcc = lstNcc.OrderByDescending(s => s.Email).ToList();
                    break;
            }
            ViewBag.message = lstNcc.Count();
            return View(lstNcc);
        }

        public ActionResult DetailNcc(int id)
        {
            var item = _context.NhaCCs.Where(x => x.IDNhaCungCap == id).Select(t => new NhaCungCapVM()
            {

                IDNhaCungCap = t.IDNhaCungCap,
                TenNhaCungCap = t.TenNhaCungCap,
                DiaChi = t.DiaChi,
                SoDienThoai = t.SoDienThoai,
                Email = t.Email,
            }).FirstOrDefault();


            return View(item);
        }

        [HttpGet]
        public ActionResult AddNcc()
        {

            return View();

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddNcc(NhaCungCapVM formData, HttpPostedFileBase fileUpload)
        {
            if (ModelState.IsValid)
            {
                var item = new NhaCC();
                item.TenNhaCungCap = formData.TenNhaCungCap;
                item.DiaChi = formData.DiaChi;
                item.SoDienThoai = formData.SoDienThoai;
                item.Email = formData.Email;


                _context.NhaCCs.Add(item);
                _context.SaveChanges();// save to DB
                return RedirectToAction("Index", "QLNCCAdmin");
            }
            // Nếu dữ liệu không hợp lệ, hiển thị lại view với các thông báo lỗi
            return View();
        }

        [HttpGet]
        public ActionResult DeleteNcc(int id)
        {
            var item = _context.NhaCCs.Where(x => x.IDNhaCungCap == id).Select(x => new NhaCungCapVM()
            {
                IDNhaCungCap = x.IDNhaCungCap,
                TenNhaCungCap = x.TenNhaCungCap,
                DiaChi = x.DiaChi,
                Email = x.Email,
            }).FirstOrDefault();
            return View(item);
        }
        [HttpPost, ActionName("DeleteNcc")]
        public ActionResult ConfirmDeleteNcc(int id)
        {
            var item = _context.NhaCCs.Where(x => x.IDNhaCungCap == id).FirstOrDefault();
            if (item == null)
            {
                return RedirectToAction("Index", "QLNCCAdmin");
            }
            _context.NhaCCs.Remove(item);

            _context.SaveChanges();

            return RedirectToAction("Index", "QLNCCAdmin");
        }

        // HttpGet method
        [HttpGet]
        public ActionResult EditNcc(int id)
        {
            var ncc = (from item in _context.NhaCCs
                       where item.IDNhaCungCap == id
                       select new NhaCungCapVM()
                       {
                           IDNhaCungCap = item.IDNhaCungCap,
                           TenNhaCungCap = item.TenNhaCungCap,
                           DiaChi = item.DiaChi,
                           SoDienThoai = item.SoDienThoai,
                           Email = item.Email,
                       }).FirstOrDefault();

            if (ncc == null)
            {
                return RedirectToAction("Index", "QLNCCAdmin");
            }

            return View(ncc);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditNcc(NhaCungCapVM formData)
        {
            if (ModelState.IsValid)
            {
                var item = _context.NhaCCs.Where(x => x.IDNhaCungCap == formData.IDNhaCungCap).FirstOrDefault();
                if (item == null)
                {
                    return RedirectToAction("Index", "QLNCCAdmin");
                }

                item.TenNhaCungCap = formData.TenNhaCungCap;
                item.DiaChi = formData.DiaChi;
                item.SoDienThoai = formData.SoDienThoai;
                item.Email = formData.Email;

                _context.SaveChanges(); // Save to DB
                return RedirectToAction("Index", "QLNCCAdmin");
            }

            return View(formData);
        }

    }
}
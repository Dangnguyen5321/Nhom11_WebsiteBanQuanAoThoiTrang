using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using WebQuanAoThoiTrang.Areas.Admin.Data;
using WebQuanAoThoiTrang.Areas.Admin.Filters;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Areas.Admin.Controllers
{
    [AdminAuthorization]
    public class QLTaiKhoanAdminController : Controller
    {
        // GET: Admin/QLTaiKhoanAdmin
        private ModelQuanAo _context = new ModelQuanAo();
        public ActionResult Index(string search, string sort)
        {

            var lstTaiKhoan = (from a in _context.TaiKhoans
                               orderby a.IDTaiKhoan descending
                               select new TaikhoanVM()
                               {
                                   IDTaiKhoan = a.IDTaiKhoan,
                                   TenTK = a.TenTK,
                                   Email = a.Email,
                                   VaiTro = a.VaiTro
                               }).ToList();

            /* search */
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                lstTaiKhoan = lstTaiKhoan.Where(a =>
                    (a.TenTK != null && a.TenTK.ToLower().Contains(search)) ||
                    (a.Email != null && a.Email.ToLower().Contains(search)) ||
                    (a.VaiTro != null && a.VaiTro.ToLower().Contains(search))).ToList();
            }
            ViewBag.Search = search;

            /* sort */
            ViewBag.MaTKSort = sort == "MaTK" ? "MaTK_desc" : "MaTK";
            ViewBag.TenTKSort = sort == "TenTK" ? "TenTK_desc" : "TenTK";
            ViewBag.EmailSort = sort == "Email" ? "Email_desc" : "Email";
            ViewBag.VaiTroSort = sort == "VaiTro" ? "VaiTro_desc" : "VaiTro";

            switch (sort)
            {
                case "MaTK":
                    lstTaiKhoan = lstTaiKhoan.OrderBy(a => a.IDTaiKhoan).ToList();
                    break;
                case "MaTK_desc":
                    lstTaiKhoan = lstTaiKhoan.OrderByDescending(a => a.IDTaiKhoan).ToList();
                    break;
                case "TenTK":
                    lstTaiKhoan = lstTaiKhoan.OrderBy(a => a.TenTK).ToList();
                    break;
                case "TenTK_desc":
                    lstTaiKhoan = lstTaiKhoan.OrderByDescending(a => a.TenTK).ToList();
                    break;
                case "Email":
                    lstTaiKhoan = lstTaiKhoan.OrderBy(a => a.Email).ToList();
                    break;
                case "Email_desc":
                    lstTaiKhoan = lstTaiKhoan.OrderByDescending(a => a.Email).ToList();
                    break;
                case "VaiTro":
                    lstTaiKhoan = lstTaiKhoan.OrderBy(a => a.VaiTro).ToList();
                    break;
                case "VaiTro_desc":
                    lstTaiKhoan = lstTaiKhoan.OrderByDescending(a => a.VaiTro).ToList();
                    break;
            }
            ViewBag.Message = lstTaiKhoan.Count();
            return View(lstTaiKhoan);
        }

        public ActionResult IndexKH(string search, string sort)
        {
            var lstKhachHang = (from a in _context.KhachHangs
                                orderby a.IDKhachHang descending
                                select new KhachHangVM()
                                {
                                    IDKhachHang = a.IDKhachHang,
                                    TenKhachHang = a.TenKhachHang,
                                    Email = a.Email,
                                    DiaChi = a.DiaChi,
                                    SoDienThoai = a.SoDienThoai
                                }).ToList();

            /* search */
            if (!string.IsNullOrEmpty(search))
            {
                search = search.Trim().ToLower();
                lstKhachHang = lstKhachHang.Where(a =>
                    (a.TenKhachHang != null && a.TenKhachHang.ToLower().Contains(search)) ||
                    (a.Email != null && a.Email.ToLower().Contains(search)) ||
                    (a.DiaChi != null && a.DiaChi.ToLower().Contains(search)) ||
                    (a.SoDienThoai != null && a.SoDienThoai.ToLower().Contains(search))).ToList();
            }
            ViewBag.Search = search;

            /* sort */
            ViewBag.MaKhachHangSort = sort == "MaKH" ? "MaKH_desc" : "MaKH";
            ViewBag.TenKhachHangSort = sort == "TenKH" ? "TenKH_desc" : "TenKH";
            ViewBag.EmailKHSort = sort == "EmailKH" ? "EmailKH_desc" : "EmailKH";
            ViewBag.DiaChiKHSort = sort == "DiaChiKH" ? "DiaChi_desc" : "DiaChiKH";
            ViewBag.SdtSort = sort == "SDT" ? "SDT_desc" : "SDT";

            switch (sort)
            {
                case "MaKH":
                    lstKhachHang = lstKhachHang.OrderBy(a => a.IDKhachHang).ToList();
                    break;
                case "MaKH_desc":
                    lstKhachHang = lstKhachHang.OrderByDescending(a => a.IDKhachHang).ToList();
                    break;
                case "TenKH":
                    lstKhachHang = lstKhachHang.OrderBy(a => a.TenKhachHang).ToList();
                    break;
                case "TenKH_desc":
                    lstKhachHang = lstKhachHang.OrderByDescending(a => a.TenKhachHang).ToList();
                    break;
                case "EmailKH":
                    lstKhachHang = lstKhachHang.OrderBy(a => a.Email).ToList();
                    break;
                case "EmailKH_desc":
                    lstKhachHang = lstKhachHang.OrderByDescending(a => a.Email).ToList();
                    break;
                case "DiaChiKH":
                    lstKhachHang = lstKhachHang.OrderBy(a => a.DiaChi).ToList();
                    break;
                case "DiaChiKH_desc":
                    lstKhachHang = lstKhachHang.OrderByDescending(a => a.DiaChi).ToList();
                    break;
                case "SDT":
                    lstKhachHang = lstKhachHang.OrderBy(a => a.SoDienThoai).ToList();
                    break;
                case "SDT_desc":
                    lstKhachHang = lstKhachHang.OrderByDescending(a => a.SoDienThoai).ToList();
                    break;
            }
            ViewBag.Message = lstKhachHang.Count();
            return View(lstKhachHang);
        }
        public ActionResult DetailAccount(int id)
        {
            var account = _context.TaiKhoans.Where(a => a.IDTaiKhoan == id).Select(a => new TaikhoanVM()
            {
                IDTaiKhoan = a.IDTaiKhoan,
                TenTK = a.TenTK,
                Email = a.Email,
                VaiTro = a.VaiTro
            }).FirstOrDefault();

            return View(account);
        }

        [HttpGet]
        public ActionResult AddAccount()
        {
            var roles = new List<SelectListItem>
            {
                new SelectListItem { Text = "Admin", Value = "Admin" },
                new SelectListItem { Text = "User", Value = "User" }
            };

            ViewBag.RoleList = roles;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddAccount(TaikhoanVM formData)
        {
            if (ModelState.IsValid)
            {
                var account = new TaiKhoan()
                {
                    TenTK = formData.TenTK,
                    MatKhau = formData.MatKhau, // Ensure to hash passwords in a real application
                    Email = formData.Email,
                    VaiTro = formData.VaiTro
                };

                _context.TaiKhoans.Add(account);
                _context.SaveChanges();
                return RedirectToAction("Index", "QLTaiKhoanAdmin");
            }
            return View(formData);
        }

        [HttpGet]
        public ActionResult DeleteAccount(int id)
        {
            var account = _context.TaiKhoans.Where(a => a.IDTaiKhoan == id).Select(a => new TaikhoanVM()
            {
                IDTaiKhoan = a.IDTaiKhoan,
                TenTK = a.TenTK,
                Email = a.Email,
                VaiTro = a.VaiTro
            }).FirstOrDefault();
            return View(account);
        }

        [HttpPost, ActionName("DeleteAccount")]
        [ValidateAntiForgeryToken]
        public ActionResult ConfirmDeleteAccount(int id)
        {
            var account = _context.TaiKhoans.Find(id);
            if (account == null)
            {
                return RedirectToAction("Index", "QLTaiKhoanAdmin");
            }
            _context.TaiKhoans.Remove(account);
            _context.SaveChanges();
            return RedirectToAction("Index", "QLTaiKhoanAdmin");
        }

        [HttpGet]
        public ActionResult EditAccount(int id)
        {
            var roles = new List<SelectListItem>
            {
                new SelectListItem { Text = "Admin", Value = "1" },
                new SelectListItem { Text = "User", Value = "2" }
            };

            ViewBag.RoleList = roles;

            var account = (from item in _context.TaiKhoans
                           where item.IDTaiKhoan == id
                           select new EditTaiKhoanVM()
                           {
                               IDTaiKhoan = item.IDTaiKhoan,
                               TenTK = item.TenTK,
                               Email = item.Email,
                               VaiTro = item.VaiTro
                           }).FirstOrDefault();

            if (account == null)
            {
                return RedirectToAction("Index", "QLTaiKhoanAdmin");
            }
            return View(account);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAccount(EditTaiKhoanVM formData)
        {
            if (ModelState.IsValid)
            {
                var account = _context.TaiKhoans.Where(x => x.IDTaiKhoan == formData.IDTaiKhoan).FirstOrDefault();
                if (account == null)
                {
                    return RedirectToAction("Index", "QLTaiKhoanAdmin");
                }

                if (!string.IsNullOrWhiteSpace(formData.EditPassword) && !string.IsNullOrWhiteSpace(formData.NewPassword))
                {
                    // Kiểm tra mật khẩu hiện tại
                    if (account.MatKhau != formData.EditPassword)
                    {
                        ModelState.AddModelError("EditPassword", "Mật khẩu hiện tại không chính xác.");
                    }
                    else
                    {
                        account.MatKhau = formData.NewPassword;
                    }
                }
                if (ModelState.IsValid)
                {
                    account.TenTK = formData.TenTK;
                    account.Email = formData.Email;
                    account.VaiTro = formData.VaiTro;

                    _context.SaveChanges();
                    return RedirectToAction("Index", "QLTaiKhoanAdmin");
                }
            }

            // Logging or debugging to understand why ModelState is not valid
            var errors = ModelState.Values.SelectMany(v => v.Errors);
            foreach (var error in errors)
            {
                System.Diagnostics.Debug.WriteLine(error.ErrorMessage);
            }

            var roles = new List<SelectListItem>
            {
                new SelectListItem { Text = "Admin", Value = "Admin" },
                new SelectListItem { Text = "User", Value = "User" }
            };
            ViewBag.RoleList = roles;

            return View(formData);
        }
    }
}
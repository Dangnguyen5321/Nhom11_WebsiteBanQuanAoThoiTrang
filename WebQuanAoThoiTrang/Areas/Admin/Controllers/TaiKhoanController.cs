using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Areas.Admin.Controllers
{
    public class TaiKhoanController : Controller
    {
        private ModelQuanAo _context = new ModelQuanAo();
        // GET: Admin/TaiKhoan
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string username, string password)
        {
            // Kiểm tra thông tin đăng nhập từ database
            var account = _context.TaiKhoans.FirstOrDefault(a => a.TenTK == username && a.MatKhau == password);
            if (account != null)
            {
                // Lưu thông tin vào session
                Session["TenTK"] = account.TenTK;
                Session["VaiTro"] = account.VaiTro;
                Session["Email"] = account.Email;

                // Kiểm tra vai trò của tài khoản và chuyển hướng
                if (account.VaiTro == "Admin")
                {
                    return RedirectToAction("Index", "DefaultAdmin", new { area = "Admin" });
                }
                else if (account.VaiTro == "User")
                {
                    return RedirectToAction("Index", "TrangChu", new { area = "" });
                }
                else
                {
                    ViewBag.ErrorMessage = "Vai trò không hợp lệ.";
                    return View();
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Sai tên đăng nhập hoặc mật khẩu.";
                return View();
            }
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
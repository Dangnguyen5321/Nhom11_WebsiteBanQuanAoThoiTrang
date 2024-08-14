using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Controllers
{
    public class DangKyUserController : Controller
    {
        private ModelQuanAo _context = new ModelQuanAo();
        // GET: DangKyUser
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(TaiKhoan model)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem tài khoản đã tồn tại hay chưa
                var existingAccount = _context.TaiKhoans.FirstOrDefault(a => a.TenTK == model.TenTK || a.Email == model.Email);
                if (existingAccount != null)
                {
                    ViewBag.ErrorMessage = "Tên tài khoản hoặc email đã tồn tại.";
                    return View();
                }

                // Thêm tài khoản mới vào cơ sở dữ liệu
                _context.TaiKhoans.Add(new TaiKhoan
                {
                    TenTK = model.TenTK,
                    MatKhau = model.MatKhau,
                    VaiTro = "User", // Mặc định tài khoản mới là User
                    Email = model.Email
                });

                _context.SaveChanges();

                // Đăng nhập ngay sau khi đăng ký thành công
                Session["TenTK"] = model.TenTK;
                Session["VaiTro"] = "User";
                Session["Email"] = model.Email;

                return RedirectToAction("Index", "TrangChu", new { area = "" });
            }
            else
            {
                ViewBag.ErrorMessage = "Vui lòng điền đầy đủ thông tin.";
                return View();
            }
        }
    }
}
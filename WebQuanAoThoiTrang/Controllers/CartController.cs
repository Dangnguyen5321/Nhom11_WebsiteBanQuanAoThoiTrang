using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Web.Mvc;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Controllers
{
    public class CartController : Controller
    {
        // GET: GioHang
        private ModelQuanAo db = new ModelQuanAo();
        public ActionResult Index()
        {
            var cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
            return View(cart);
        }

        public ActionResult AddToCart(int? maSP)
        {
            // Get the cart from session, if it doesn't exist, create a new one
            var cart = Session["Cart"] as List<CartItem>;
            if (maSP == null)
            {
                // Handle the case where maSP is not provided
                return RedirectToAction("Index", "Cart"); // or return an error view
            }
            if (cart == null)
            {
                cart = new List<CartItem>();
                Session["Cart"] = cart;
            }

            // Check if the sanpham is already in the cart
            var cartItem = cart.FirstOrDefault(c => c.MaSP == maSP);
            if (cartItem != null)
            {
                // If it is, increase the quantity
                cartItem.Quantity++;
            }
            else
            {
                // Otherwise, add a new item to the cart
                var sp = db.SanPhams.FirstOrDefault(s => s.IDSanPham == maSP);
                if (sp != null)
                {
                    cart.Add(new CartItem
                    {
                        MaSP = sp.IDSanPham,
                        TenSP = sp.TenSanPham,
                        HinhAnh = sp.HinhAnh,
                        Gia = sp.Gia,
                        Quantity = 1
                    });
                }
            }

            // Redirect to the cart page or wherever you want
            return RedirectToAction("Index", "Cart");
        }

        [HttpPost]
        public ActionResult UpdateCart(int maSP, int quantity)
        {
            var cart = Session["Cart"] as List<CartItem>;

            if (cart != null)
            {
                var cartItem = cart.FirstOrDefault(c => c.MaSP == maSP);
                if (cartItem != null)
                {
                    cartItem.Quantity = quantity;
                }

                // Cập nhật session với giỏ hàng mới
                Session["Cart"] = cart;
            }

            return Json(new { success = true });
        }

        public ActionResult Checkout(string TenKhachHang, string SoDienThoai, string DiaChi)
        {
            if (ModelState.IsValid)
            {
                // Save customer info
                var khachHang = new KhachHang
                {
                    TenKhachHang = TenKhachHang,
                    SoDienThoai = SoDienThoai,
                    DiaChi = DiaChi
                };
                db.KhachHangs.Add(khachHang);
                db.SaveChanges();

                // Create order
                var donHang = new DonHang
                {
                    NgayDat = DateTime.Now,
                    IDKhachHang = khachHang.IDKhachHang,
                    IDTrangThai = 1 // Assuming 1 is the default status for a new order
                };
                db.DonHangs.Add(donHang);
                db.SaveChanges();

                // Add order details
                var cart = Session["Cart"] as List<CartItem>;
                if (cart != null)
                {
                    foreach (var item in cart)
                    {
                        var ctDonHang = new CTDonHang
                        {
                            IDDonHang = donHang.IDDonHang,
                            IDSanPham = item.MaSP,
                            SoLuong = item.Quantity,
                            Gia = item.Gia
                        };
                        db.CTDonHangs.Add(ctDonHang);
                    }
                    db.SaveChanges();
                }

                // Clear the cart
                Session["Cart"] = null;

                // Redirect to a success page or the order summary
                return RedirectToAction("CamOn", "Cart", new { id = donHang.IDDonHang });
            }

            // If validation fails, return to the cart view
            return RedirectToAction("Index", "Cart");
        }

        public ActionResult CamOn(int id)
        {
            var donHang = db.DonHangs
                            .Include(d => d.CTDonHangs) // Use lambda expression here
                            .FirstOrDefault(d => d.IDDonHang == id);

            if (donHang == null)
            {
                return HttpNotFound();
            }
            return View(donHang);
        }


        [HttpPost]
        public JsonResult RemoveFromCart(int maSP)
        {
            // Giả sử bạn đã lưu giỏ hàng trong Session
            var cart = Session["Cart"] as List<CartItem>;

            if (cart != null)
            {
                var itemToRemove = cart.FirstOrDefault(item => item.MaSP == maSP);
                if (itemToRemove != null)
                {
                    cart.Remove(itemToRemove);
                    Session["Cart"] = cart;
                    return Json(new { success = true });
                }
            }

            return Json(new { success = false });
        }

    }
}
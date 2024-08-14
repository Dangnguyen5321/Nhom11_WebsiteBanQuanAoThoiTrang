using Newtonsoft.Json;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQuanAoThoiTrang.Areas.Admin.Filters;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Areas.Admin.Controllers
{
    [AdminAuthorization]
    public class DefaultAdminController : Controller
    {
        // GET: Admin/DefaultAdmin
        private ModelQuanAo _context = new ModelQuanAo();
        public ActionResult Index()
        {
            // Tính tổng số sản phẩm
            var lstSP = (from a in _context.SanPhams select a).ToList().Count();

            // Lấy tổng số các đơn hàng
            var lstDH = (from a in _context.DonHangs select a).ToList().Count();

            // Tính tổng số tài khoản
            var lstAcc = (from a in _context.TaiKhoans select a).ToList().Count();

            // Tính tổng doanh thu cho các đơn hàng có TrangThaiID == 2
            var tongDoanhThu = (from dh in _context.DonHangs
                                where dh.IDTrangThai == 2
                                join cthd in _context.CTDonHangs
                                on dh.IDDonHang equals cthd.IDDonHang
                                select new { cthd.Gia, cthd.SoLuong })
                                .Sum(ct => (decimal)ct.Gia * ct.SoLuong);


            // Gửi các giá trị này đến View
            ViewBag.TongDoanhThu = tongDoanhThu;
            ViewBag.TongSanPham = lstSP;
            ViewBag.TongTaiKhoan = lstAcc;
            ViewBag.TongDonHang = lstDH;

            #region chart doanh thu theo tháng
            var revenueData = _context.DonHangs
                .Where(dh => dh.IDTrangThai == 2 && dh.NgayDat.HasValue)
                .GroupBy(dh => new { dh.NgayDat.Value.Year, dh.NgayDat.Value.Month })
                .Select(g => new
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    Revenue = g.Sum(dh => dh.CTDonHangs.Sum(ct => (decimal?)ct.SoLuong * ct.Gia) ?? 0)
                })
                .OrderBy(g => g.Year)
                .ThenBy(g => g.Month)
                .ToList();

            var labels = revenueData.Select(rd => $"{rd.Month}/{rd.Year}").ToArray();
            var values = revenueData.Select(rd => rd.Revenue).ToArray();

            ViewBag.Labels = labels;
            ViewBag.Values = values;
            #endregion

            #region chart top 5 sản phẩm bán chạy trong tháng
            var thangHienTai = DateTime.Now.Month;
            var namHienTai = DateTime.Now.Year;

            var sanPhamBanChay = (from ct in _context.CTDonHangs
                                  join sp in _context.SanPhams on ct.IDSanPham equals sp.IDSanPham
                                  join dh in _context.DonHangs on ct.IDDonHang equals dh.IDDonHang
                                  where dh.NgayDat.HasValue &&
                                      dh.NgayDat.Value.Month == thangHienTai &&
                                      dh.NgayDat.Value.Year == namHienTai &&
                                      dh.IDTrangThai == 2
                                  group ct by new { ct.IDSanPham, sp.TenSanPham } into spGroup
                                  select new
                                  {
                                      TenSP = spGroup.Key.TenSanPham,
                                      SoLuongBan = spGroup.Sum(ct => ct.SoLuong)
                                  })
                                  .OrderByDescending(sp => sp.SoLuongBan)
                                  .Take(5) // Lấy top 5 sản phẩm bán chạy nhất
                                  .ToList();

            ViewBag.TopSellingProductsLabels = JsonConvert.SerializeObject(sanPhamBanChay.Select(sp => sp.TenSP).ToArray());
            ViewBag.TopSellingProductsValues = JsonConvert.SerializeObject(sanPhamBanChay.Select(sp => sp.SoLuongBan).ToArray());
            #endregion
            
            return View();
        }
    }
}
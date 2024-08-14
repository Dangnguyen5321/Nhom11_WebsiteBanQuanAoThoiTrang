using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Areas.Admin.Data
{
    public class CTDonHangVM
    {
        [Display(Name = "#")]
        public int MaCTDH { get; set; }
        public int? IDDonHang { get; set; }

        [DisplayName("Tên sản phẩm")]
        public string TenSP { get; set; }

        [DisplayName("Hình Ảnh")]
        public string HinhAnh { get; set; }

        [DisplayName("Số lượng")]
        public int? SoLuong { get; set; }

        [DisplayName("Giá"), DataType(DataType.Currency)]
        public decimal? Gia { get; set; }

        [DisplayName("Tổng tiền"), DataType(DataType.Currency)]
        public decimal? TongTien { get; set; }

        public int? IDTrangThai { get; set; }

        public string TrangThaiName { get; set; }

        public decimal? ThanhTien { get; set; }
    }
}
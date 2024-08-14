using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQuanAoThoiTrang.Areas.Admin.Data
{
    public class KhachHangVM
    {
        public int IDKhachHang { get; set; }

        public string TenKhachHang { get; set; }

        public string DiaChi { get; set; }

        public string SoDienThoai { get; set; }

        public string Email { get; set; }

        public string HinhAnh { get; set; }
    }
}
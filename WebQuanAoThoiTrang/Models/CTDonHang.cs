namespace WebQuanAoThoiTrang.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTDonHang")]
    public partial class CTDonHang
    {
        [Key]
        public int IDCTDonHang { get; set; }

        public int? IDDonHang { get; set; }

        public int? IDSanPham { get; set; }

        public int? SoLuong { get; set; }

        public decimal? Gia { get; set; }

        public virtual DonHang DonHang { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}

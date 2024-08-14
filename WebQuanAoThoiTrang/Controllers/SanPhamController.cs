using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQuanAoThoiTrang.Models;

namespace WebQuanAoThoiTrang.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        public ModelQuanAo _db = new ModelQuanAo();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TimKiem(string tenSanPham)
        {
            var sanPhams = _db.SanPhams.Where(s => s.TenSanPham.Contains(tenSanPham)).ToList();
            return View("TimKiem", sanPhams);
        }

        //public ActionResult GetThuongHieu(int id)
        //{
        //    var sanPhams = (from s in _db.SanPham
        //                   join ncc in _db.NhaCungCap on s.NhaCungCapID equals ncc.NhaCungCapID )
        //                   Where(ncc => ncc.NhaCungCapID.Contains(id))).ToList();
        //    return View("TimKiem", sanPhams);

        //}

    }
}
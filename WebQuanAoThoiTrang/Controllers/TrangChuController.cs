using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebQuanAoThoiTrang.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Mota()
        {
            ViewBag.Message = "Trang mô tả ứng dụng của bạn.";

            return View();
        }

        public ActionResult LienHe()
        {
            ViewBag.Message = "Trang liên hệ của bạn.";

            return View();
        }
    }
}
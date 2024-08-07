using User_WebsiteBanQuanAoThoiTrang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace User_WebsiteBanQuanAoThoiTrang.Controllers
{
    public class HomeController : Controller
    {
        KhareedoEntities db = new KhareedoEntities();

        // GET: Home
        public ActionResult Index()
        {
            var categoryMap = new Dictionary<string, string>
            {
                { "Men", "Nam" },
                { "Women", "Nữ" },
                { "Sports", "Thể thao" },
                { "Accessorys", "Phụ kiện" }
            };

            var menCategory = categoryMap["Men"];
            var womenCategory = categoryMap["Women"];
            var sportsCategory = categoryMap["Sports"];
            var accessorysCategory = categoryMap["Accessorys"];

            ViewBag.MenProduct = db.Products.Where(x => x.Category.Name.Equals(menCategory)).ToList();
            ViewBag.WomenProduct = db.Products.Where(x => x.Category.Name.Equals(womenCategory)).ToList();
            ViewBag.SportsProduct = db.Products.Where(x => x.Category.Name.Equals(sportsCategory)).ToList();
            ViewBag.AccessorysProduct = db.Products.Where(x => x.Category.Name.Equals(accessorysCategory)).ToList();
            ViewBag.Slider = db.genMainSliders.ToList();
            ViewBag.PromoRight = db.genPromoRights.ToList();

            this.GetDefaultData();

            return View();
        }      

    }
}
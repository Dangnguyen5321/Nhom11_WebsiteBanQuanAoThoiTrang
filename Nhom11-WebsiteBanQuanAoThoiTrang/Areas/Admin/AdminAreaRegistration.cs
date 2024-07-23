﻿using System.Web.Mvc;

namespace Nhom11_WebsiteBanQuanAoThoiTrang.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Nhom11_WebsiteBanQuanAoThoiTrang.Areas.Admin.Controllers" }
            );
        }
    }
}
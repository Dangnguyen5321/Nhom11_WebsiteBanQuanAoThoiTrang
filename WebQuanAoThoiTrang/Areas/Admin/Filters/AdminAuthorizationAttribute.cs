using System.Web.Mvc;

namespace WebQuanAoThoiTrang.Areas.Admin.Filters
{
    public class AdminAuthorizationAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = filterContext.HttpContext.Session;
            var role = session["VaiTro"]?.ToString();

            if (session["TenTK"] == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary
                    {
                        { "controller", "TaiKhoan" },
                        { "action", "Index" },
                        { "area", "Admin" } // Specify the area if needed
                    });
            }
            else if (role == "User")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary
                    {
                        { "controller", "Trangchu" },
                        { "action", "Index" },
                        { "area", "" } // Specify no area to go to the main Home page
                    });
            }
            else if (role != "Admin")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary
                    {
                        { "controller", "TaiKhoan" },
                        { "action", "Index" },
                        { "area", "Admin" } // Specify the area if needed
                    });
            }

            base.OnActionExecuting(filterContext);
        }
    }
}
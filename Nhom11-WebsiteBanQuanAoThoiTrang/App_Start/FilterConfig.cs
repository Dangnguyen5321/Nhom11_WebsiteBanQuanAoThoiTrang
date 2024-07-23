using System.Web;
using System.Web.Mvc;

namespace Nhom11_WebsiteBanQuanAoThoiTrang
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}

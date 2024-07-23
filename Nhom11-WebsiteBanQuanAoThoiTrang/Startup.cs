using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Nhom11_WebsiteBanQuanAoThoiTrang.Startup))]
namespace Nhom11_WebsiteBanQuanAoThoiTrang
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

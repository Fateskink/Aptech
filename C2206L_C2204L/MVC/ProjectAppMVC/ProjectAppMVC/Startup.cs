using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectAppMVC.Startup))]
namespace ProjectAppMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

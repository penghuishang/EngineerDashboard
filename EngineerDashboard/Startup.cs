using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EngineerDashboard.Startup))]
namespace EngineerDashboard
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

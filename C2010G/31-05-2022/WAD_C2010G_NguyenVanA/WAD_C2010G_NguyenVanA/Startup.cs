﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WAD_C2010G_NguyenVanA.Startup))]
namespace WAD_C2010G_NguyenVanA
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

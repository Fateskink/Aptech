﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Handlers;
using System.Web.Http;
using RequestResponseFlow.Web.Extensions;
namespace RequestResponseFlow.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MessageHandlers.Add(new RequestResponseFlow.Web.Extensions.TraceHandler());
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}

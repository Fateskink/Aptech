﻿using System.Web;
using System.Web.Mvc;

namespace EAP_C2009L_NguyenVanA
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}

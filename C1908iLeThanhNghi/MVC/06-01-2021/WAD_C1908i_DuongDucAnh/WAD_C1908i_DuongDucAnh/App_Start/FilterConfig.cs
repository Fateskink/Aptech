﻿using System.Web;
using System.Web.Mvc;

namespace WAD_C1908i_DuongDucAnh
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WAD_C2108G2_NguyenVanA.Models;

namespace WAD_C2108G2_NguyenVanA.Controllers
{
    public class EmployeesController : Controller
    {
        // GET: Employees
        public ActionResult Index()
        {
            using (DataContext context = new DataContext()) {
                var employees = context.Employees
                    .Include(e => e.ProjectEmployees.Select(pe => pe.Project))
                    .ToList();
                ViewBag.Employees = employees;  
                /*
                var product = context.Projects
                    .Where(project => project.ProjectId == 1)
                    .FirstOrDefault();
                */
            }
            return View();
        }
    }
}
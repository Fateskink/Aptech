using de11.Models;
using Microsoft.AspNetCore.Mvc;

namespace de11.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly DataContext context;
        public EmployeeController(DataContext context) {
            this.context = context;
        }
        public IActionResult Index()
        {
            var employees = context.Employees.ToList();
            return View(employees);
        }

    }
}

using de11.Models;
using de11.ViewModels;
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
            ViewBag.Employees = employees;
            ViewBag.Employee = new Employee { };
            return View();
        }
        [HttpPost]
        public IActionResult InsertEmployee(EmployeeViewModel employeeViewModel) {
            this.context.Add(new Employee { 
                EmployeeNo = employeeViewModel.EmployeeNo,
                EmployeeName = employeeViewModel.EmployeeName,
                Position = employeeViewModel.Position,
                Salary = employeeViewModel.Salary
            });
            return RedirectToAction(nameof(Index));
        }

    }
}

using Microsoft.AspNetCore.Mvc;
using myapp.ViewModels;

namespace myapp.Controllers
{
    public class EmployeeController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();//danh sach cac employees
        }
        [HttpGet]
        public IActionResult AddEmployee()
        {
            return View();//Views/Employee/AddEmployee.cshtml
        }
        [HttpPost]
        public IActionResult AddEmployee(AddEmployeeViewModel viewModel)
        {
            return View();//Views/Employee/AddEmployee.cshtml
        }
    }
}

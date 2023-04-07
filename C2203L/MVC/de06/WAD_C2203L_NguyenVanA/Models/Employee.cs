using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WAD_C2203L_NguyenVanA.Models
{
    public class Employee
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public DateTime EmployeeDOB { get; set; }
        public string EmployeeDepartment { get; set; }
        public virtual ICollection<ProjectEmployee> ProjectEmployees { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WAD_C2203L_NguyenVanA.Models
{
    public class ProjectEmployee
    {
        public int EmployeeId { get; set; }
        public int ProjectId { get; set; }
        public string Tasks { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Project Project { get; set; }
    }
}
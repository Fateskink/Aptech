using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjectAppMVC.Models
{
    public class ProjectEmployee
    {
        //[Key]
        public int Id { get; set; }
        [Required]
        public int EmployeeId { get; set; }
        [Required]
        public int ProjectId { get; set; }
        [Required]
        public string Tasks { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Project Project { get; set; }

    }
}
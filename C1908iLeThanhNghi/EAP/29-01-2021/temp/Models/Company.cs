﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Owin_TenSinhVien.Models
{
    public class Company
    {
        [Key]
        public int Id { get; set; }
        public String Name { get; set; }
        public String Nation { get; set; }
        public int YearFounded { get; set; }
    }
}

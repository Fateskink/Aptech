//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace aptechde02
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblEmployee
    {
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public Nullable<bool> Gender { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string Telephone { get; set; }
        public string Address { get; set; }
        public Nullable<int> DepartmentId { get; set; }
    
        public virtual tblDepartment tblDepartment { get; set; }
    }
}

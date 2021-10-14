//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Exam2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Product
    {
        public int ProductId { get; set; }
        
        [Required] //=> Not null
        [StringLength(32, MinimumLength= 3)]
        public string Name { get; set; }
        [Required] //=> Not null
        [DataType(DataType.Currency)]
        public Nullable<decimal> Price { get; set; }
        [Range(0, 100)]
        [Required]
        public Nullable<int> Quantity { get; set; }
        [Required]
        [DataType(DataType.DateTime)]
        public Nullable<System.DateTime> ReleaseDate { get; set; }
        public int CategoryId { get; set; }
    
        public virtual Category Category { get; set; }
    }
}
﻿using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace perfumeapp.Models
{
    public class ProductReview
    {
        [Key]
        public int ReviewID { get; set; }

        [ForeignKey("User")]
        public int UserID { get; set; }

        [ForeignKey("Product")]
        public int ProductID { get; set; }

        [Required]
        public int Rating { get; set; }

        [Column(TypeName = "VARCHAR(MAX)")]
        public string ReviewText { get; set; }

        public virtual User User { get; set; }
        public virtual Product Product { get; set; }
    }
}

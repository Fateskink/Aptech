using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace myapp.Models
{
    [Table("stocks")]
    public class Stock
    {
        [Key]
        [Column("stock_id")]
        public int StockId { get; set; }

        [Required]
        [MaxLength(10)]
        [Column("symbol")]
        [Display(Name = "Mã cổ phiếu")]
        public string Symbol { get; set; }

        [Required]
        [MaxLength(255)]
        [Column("company_name")]
        [Display(Name = "Tên công ty")]
        public string CompanyName { get; set; }

        [Column("market_cap")]
        [Display(Name = "Vốn hóa thị trường")]
        public decimal? MarketCap { get; set; }

        [MaxLength(100)]
        [Column("sector")]
        [Display(Name = "Ngành")]
        public string? Sector { get; set; }

        [MaxLength(100)]
        [Column("industry")]
        [Display(Name = "Lĩnh vực")]
        public string? Industry { get; set; }

        [MaxLength(50)]
        [Column("stock_type")]
        [Display(Name = "Loại cổ phiếu")]
        public string? StockType { get; set; }
    }
}


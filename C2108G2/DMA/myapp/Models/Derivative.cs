using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace myapp.Models
{
    [Table("derivatives")]
    public class Derivative
    {
        [Key]
        public int DerivativeId { get; set; }

        [Required(ErrorMessage = "Name is required")]
        [Column("name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Underlying asset is required")]
        [ForeignKey(nameof(UnderlyingAsset))]

        [Column("underlying_asset_id")]
        public int UnderlyingAssetId { get; set; }
        public virtual Stock? UnderlyingAsset { get; set; }

        [Column("contract_size")]
        public int ContractSize { get; set; }

        [Required(ErrorMessage = "Expiration date is required")]
        [Column("expiration_date")]
        public DateTime ExpirationDate { get; set; }

        [Column("strike_price")]
        public decimal StrikePrice { get; set; }
    }

}


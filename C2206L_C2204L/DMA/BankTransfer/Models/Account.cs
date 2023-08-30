using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BankTransfer.Models
{
    public class Account
    {
        [Key]
        public int AccountID { get; set; }
        public string AccountType { get; set; }
        public DateTime CreateDate { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "TotalAmount must be greater than 0")]
        public double TotalAmount { get; set; }

        // Foreign key to User
        public int UserID { get; set; }
        [ForeignKey("UserID")]
        public User User { get; set; }

    }
}

namespace _03_07_2023.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("tblUser")]
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }

        [MaxLength(255)]
        public string FullName { get; set; }

        [Required]
        [MaxLength(255)]
        public string Email { get; set; }

        [Required]
        [MaxLength(255, ErrorMessage = "Password must be at least 4 characters")]
        [MinLength(4)]
        public string Password { get; set; }
    }

}

//Request từ client(fullname, email, pass, retype pass, ko có ID) => Controller => insert bản ghi vào DB
//=> bản ghi user(ko có retype password)
//=> Model trong DB và Request ko nhất thiết GIỐNG NHAU
//Request => tên gọi RegisterDTO(Data Transfer Object), RegisterRequest, ...
//Model => gọi là User
//Bây giờ tạo ra controller

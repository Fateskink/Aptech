namespace _03_07_2023.Models
{
    public class User
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        //retype password ? NO!
    }
}

//Request từ client(fullname, email, pass, retype pass, ko có ID) => Controller => insert bản ghi vào DB
//=> bản ghi user(ko có retype password)
//=> Model trong DB và Request ko nhất thiết GIỐNG NHAU
//Request => tên gọi RegisterDTO(Data Transfer Object), RegisterRequest, ...
//Model => gọi là User
//Bây giờ tạo ra controller

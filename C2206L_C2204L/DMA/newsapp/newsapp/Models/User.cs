using System.ComponentModel.DataAnnotations;

namespace newsapp.Models
{
    public class User
    {
        [Key]
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Description { get; set; }

        public virtual ICollection<News> NewsList { get; set; } = new List<News>();
    }
}

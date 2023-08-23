using System.ComponentModel.DataAnnotations;

namespace newsapp.Models
{
    public class Category
    {
        [Key]
        public int ID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryType { get; set; }
        
        public int Order { get; set; }

        public virtual ICollection<News> NewsList { get; set; } = new List<News>();
    }
}

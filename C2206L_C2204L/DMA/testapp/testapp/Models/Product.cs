using System.ComponentModel.DataAnnotations;

namespace testapp.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Double Price { get; set; }
        public int Count { get; set; }
    }
}

using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace WebApiApp.Models
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
    }
}

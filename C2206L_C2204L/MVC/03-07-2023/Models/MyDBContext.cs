﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
namespace _03_07_2023.Models
{
    
    public class MyDBContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(Configuration.GetConnectionString("MyConnectionString"));
        }
    }

}

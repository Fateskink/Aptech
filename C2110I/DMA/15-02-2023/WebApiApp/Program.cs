
using Microsoft.EntityFrameworkCore;
using WebApiApp.Models;

namespace WebApiApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            if (builder.Configuration.GetValue<bool>("UseInMemoryDatabase"))
            {
                builder.Services.AddDbContext<MyDBContext>(options =>
                options.UseInMemoryDatabase(databaseName: "C2110i"));//no connection string
            }
            else {
                builder.Services.AddDbContext<MyDBContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("SQLServerConnection")));
            }            
            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
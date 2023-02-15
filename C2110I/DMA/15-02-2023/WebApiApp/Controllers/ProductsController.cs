using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiApp.Models;

namespace WebApiApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "iphone", "ipad" };
        }
        
        [HttpGet("GetProducts")]
        public ActionResult<IEnumerable<Product>> GetProducts()
        {
            var products = new List<Product>
        {
            new Product { Id = 1, Name = "Product 1", Description = "Description 1", Price = 10.99m },
            new Product { Id = 2, Name = "Product 2", Description = "Description 2", Price = 19.99m },
            new Product { Id = 3, Name = "Product 3", Description = "Description 3", Price = 25.99m }
        };

            return Ok(products);
        }
    }
}

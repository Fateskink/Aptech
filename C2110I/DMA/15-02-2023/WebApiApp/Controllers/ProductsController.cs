using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApiApp.Models;

namespace WebApiApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly MyDBContext _context;
        public ProductsController(MyDBContext context) {     
            //Dependency injection
            _context = context;
            //generate fake data
            var products = new List<Product>
            {
                new Product {Name = "Product 1", Description = "Description 1", Price = 10.99m },
                new Product {Name = "Product 2", Description = "Description 2", Price = 19.99m },
                new Product {Name = "Product 3", Description = "Description 3", Price = 25.99m }
            };
            if (!_context.Products.Any()) {
                _context.Products.AddRange(products); //ok, insert bundle
            }
            
            //_context.Products = products; //NO !
            context.SaveChanges();
        }
        
        [HttpGet("GetAllProducts")]
        //http:localhost:12345/api/Products/GetAllProducts
        public ActionResult<IEnumerable<Product>> Get()
        {
            /*
            var dictionary = new Dictionary<string, object>();
            dictionary["message"] = "Get products successfuly";
            dictionary["data"] = _context.Products.Take(100).ToList();
            */
            return Ok(_context.Products.Take(100).ToList());            
        }
        
        
    }
}

using AutoMapper;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using testapp.Models;
using testapp.Requests;

namespace testapp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly IMapper _mapper;

        private List<Product> products = new List<Product> {
            new Product { Id = 1,Name = "n11", Description = "d111", Price=11.1, Count = 11},
            new Product { Id = 2,Name = "n22", Description = "d222", Price=22.1, Count = 22},
            new Product { Id = 3,Name = "n33", Description = "d333", Price=33.1, Count = 33},

            new Product { Id = 4,Name = "n33", Description = "d444", Price = 44.1, Count = 44},

        };
        [HttpGet("hello")]
        //https://servername:port/product/hello
        public String Index()
        {
            return "Chao cac ban";
        }
        [HttpGet]
        public ActionResult<IEnumerable<Product>> GetProducts() {
            return Ok(this.products);
        }
        [HttpPost]
        public IActionResult InsertProduct(ProductRequest productRequest)
        {
            Product newProduct = new Product
            {
                Id = 1,
                Name = productRequest.Name,
                Price = productRequest.Price,
                Count = productRequest.Count,
                Description = productRequest.Description ?? ""
            };
            this.products.Add(newProduct);
            return Ok(newProduct);
        }
        [HttpPut("{id}")]
        public IActionResult UpdateProduct(int id, ProductRequest productRequest) {
            Product? existingProduct = this.products.Where(p => p.Id == id).FirstOrDefault();
            if (existingProduct != null)
            {
                /*
                existingProduct.Name = productRequest.Name;
                existingProduct.Price = productRequest.Price;
                existingProduct.Count = productRequest.Count;
                existingProduct.Description = productRequest.Description;                
                */
                /*
                CreateMap<ProductRequest, Product>()
                    .ForMember(dest => dest.Id, opt => opt.Ignore()); // Bỏ qua trường Id            
                */
                _mapper.Map(productRequest, existingProduct);

                //must optimize(Model Mapper java)
                return Ok(existingProduct);
            }
            else {
                return NotFound("Cannot find product with id : " + id);
            }
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            Product? existingProduct = this.products.Where(p => p.Id == id).FirstOrDefault();
            if (existingProduct != null)
            {
                products.Remove(existingProduct);                
            }
            return Ok("Delete product successfully");
        }

    }
}

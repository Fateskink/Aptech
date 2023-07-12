using _03_07_2023.Models;
using _03_07_2023.Repositories;

namespace _03_07_2023.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;

        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public IEnumerable<Product> GetAllProducts(int page, int limit)
        {
            return _productRepository.GetAll(page, limit);
        }

        public Product? GetProductById(int id)
        {
            return _productRepository.GetById(id);
        }

        public void CreateProduct(Product product)
        {
            _productRepository.Add(product);
        }

        public void UpdateProduct(Product product)
        {
            _productRepository.Update(product);
        }

        public void DeleteProduct(int id)
        {
            _productRepository.Delete(id);
        }
    }

}

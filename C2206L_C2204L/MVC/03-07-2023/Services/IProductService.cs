﻿using _03_07_2023.Models;

namespace _03_07_2023.Services
{
    public interface IProductService
    {
        IEnumerable<Product> GetAllProducts(int page, int limit);
        Product? GetProductById(int id);
        void CreateProduct(Product product);
        void UpdateProduct(Product product);
        void DeleteProduct(int id);
    }

}

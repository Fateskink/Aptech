using System;
using myapp.Models;
namespace myapp.Repositories
{
    public interface IStockRepository
    {
        Task<List<Stock>> GetStocksBySectorAndIndustry(
            string sector, string industry,
            string searchText,
            int page = 1, int pageSize = 20);
    }

}


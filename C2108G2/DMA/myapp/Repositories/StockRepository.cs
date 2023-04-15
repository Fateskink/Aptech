using System;
using Microsoft.EntityFrameworkCore;
using myapp.Models;

namespace myapp.Repositories
{
    public class StockRepository : IStockRepository
    {
        private readonly ApplicationDbContext _context;

        public StockRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<Stock>> GetStocksBySectorAndIndustry(
            string sector,
            string industry,
            int page = 1,
            int pageSize = 20)
        {
            IQueryable<Stock> query = _context.Stocks;

            query = query.Where(s => string.IsNullOrEmpty(sector) || s.Sector == sector);
            query = query.Where(s => string.IsNullOrEmpty(industry) || s.Industry == industry);

            // Phân trang
            int totalItems = await query.CountAsync();
            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            int skip = (page - 1) * pageSize;
            query = query.Skip(skip).Take(pageSize);

            return await query.ToListAsync();
        }

        
    }
}


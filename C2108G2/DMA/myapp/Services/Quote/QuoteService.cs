using System;
using Microsoft.EntityFrameworkCore;
using myapp.Models;
using myapp.Repositories.Quote;

namespace myapp.Services.Quote
{
	public class QuoteService: IQuoteService
    {
        private readonly ApplicationDbContext _context;

        public QuoteService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<myapp.Models.Quote>> GetQuotes(
            int page, int pageSize,
            string sector = "",
            string industry = ""
            )
        {
            var query = _context.Stocks.AsQueryable(); // Lọc theo điều kiện vùng và lĩnh vực
            if (!string.IsNullOrEmpty(sector))
            {
                query = query.Where(s => s.Sector == sector);
            }
            if (!string.IsNullOrEmpty(industry))
            {
                query = query.Where(s => s.Industry == industry);
            }

            // Lấy danh sách quote mới nhất của mỗi mã cổ phiếu
            var quotes = await query
                .Include(s => s.Quotes)
                .Select(s => new
                {
                    s.Symbol,
                    Quote = s.Quotes.OrderByDescending(q => q.TimeStamp).FirstOrDefault()
                })
                .Where(q => q.Quote != null)
                .OrderBy(q => q.Symbol)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(q => new myapp.Models.Quote
                {
                    QuoteId = q.Quote.QuoteId,
                    StockId = q.Quote.StockId,
                    Price = q.Quote.Price,
                    Change = q.Quote.Change,
                    PercentChange = q.Quote.PercentChange,
                    Volume = q.Quote.Volume,
                    TimeStamp = q.Quote.TimeStamp,
                    Stock = new Stock
                    {
                        Symbol = q.Symbol,
                        CompanyName = q.Quote.Stock.CompanyName
                    }
                })
                .ToListAsync();

            return quotes;
        }
    }
}


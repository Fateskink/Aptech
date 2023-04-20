using System;
using Microsoft.EntityFrameworkCore;
using myapp.Models;
using myapp.Repositories.Quote;
using myapp.Models.SQLViews;

namespace myapp.Services.Quote
{
	public class QuoteService: IQuoteService
    {
        private readonly ApplicationDbContext _context;

        public QuoteService(ApplicationDbContext context)
        {
            _context = context;
        }

        
        public async Task<IEnumerable<QuotesRealtime>> GetQuotes(int page,
            int pageSize,
            string sector, string industry)
        {
            var query = _context.QuotesRealtimes
                .Where(q => sector == "" || q.Sector == sector)
                .Where(q => industry == "" || q.Industry == industry)
                .OrderBy(q => q.TimeStamp);

            var totalItems = await query.CountAsync();
            var quotesRealtimes = await query.Skip((page - 1) * pageSize)
                                    .Take(pageSize).ToListAsync();
            return (IEnumerable<QuotesRealtime>)quotesRealtimes;
        }
    }
}


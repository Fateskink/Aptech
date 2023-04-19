using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using myapp.Controllers.Attributes;
using myapp.Hubs;
using myapp.Models;
using myapp.Repositories.Quote;

namespace myapp.Controllers
{
    [ApiController]    
    [Route("api/[controller]")]
    public class QuoteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IQuoteService _quoteService;        

        public QuoteController(ApplicationDbContext context, IQuoteService quoteService)
        {
            _context = context;
            _quoteService = quoteService;
        }

        [HttpGet("{id}")]        
        public async Task<ActionResult<Quote>> GetQuote(int id)
        {
            var quote = await _context.Quotes.FindAsync(id);

            if (quote == null)
            {
                return NotFound();
            }

            var stock = await _context.Stocks.FindAsync(quote.StockId);

            if (stock == null)
            {
                return NotFound();
            }

            quote.Stock = stock;

            return quote;
        }
        [HttpGet("GetQuotes")]
        public async Task<IActionResult> GetQuotes(
            string sector = "",
            string industry = "",
            string searchText = "",
            int page = 1, int pageSize = 20)
        {                        
            var quotes = await _quoteService.GetQuotes(
                    page: page,
                    pageSize: pageSize,
                    sector: sector,
                    industry: industry
                );

            if (quotes == null || quotes.Count() == 0)
            {
                return NotFound();
            }

            return Ok(quotes);
        }
    }

}


using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using myapp.Hubs;
using myapp.Models;

namespace myapp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StockQuoteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IHubContext<QuoteHub> _hubContext;

        public StockQuoteController(ApplicationDbContext context, IHubContext<QuoteHub> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
            _ = UpdateQuotes();
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
        private async Task UpdateQuotes()
        {
            while (true)
            {
                // Lấy danh sách quotes hiện tại từ database
                var quotes = await _context.Quotes
                    .Include(q => q.Stock)
                    .Select(q => new {
                        q.QuoteId,
                        Symbol = q.Stock.Symbol,
                        q.Price,
                        q.Change,
                        q.PercentChange,
                        q.Volume,
                        q.TimeStamp
                    })
                    .ToListAsync();
                // Gửi thông tin quotes mới nhất cho các client đang kết nối
                await _hubContext.Clients.All.SendAsync("ReceiveQuotes", quotes);

                // Chờ 2 giây để tiếp tục kiểm tra lại dữ liệu
                await Task.Delay(2000);
            }
        }
    }

}


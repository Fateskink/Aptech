using System;
using System.Security.Claims;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using myapp.Models;
using myapp.Controllers.Attributes;

namespace myapp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]    
    public class WatchListController : ControllerBase
    {
        private readonly ApplicationDbContext _context;        

        public WatchListController(ApplicationDbContext context)
        {
            _context = context;            
        }

        [HttpPost]
        [AuthorizeToken]
        [Route("watchlist/add")]
        public async Task<IActionResult> AddToWatchlist(int stockId)
        {
            // Kiểm tra token
            var userIdString = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userIdString == null)
            {
                return Unauthorized();
            }
            if (!int.TryParse(userIdString, out int userId))
            {
                return BadRequest("Invalid user id");
            }
            // Check if user exists
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserId == userId);
            if (user == null)
            {
                return Unauthorized();
            }

            // Check if stock exists
            var stock = await _context.Stocks.FirstOrDefaultAsync(s => s.StockId == stockId);
            if (stock == null)
            {
                return NotFound($"Stock with ID {stockId} not found");
            }

            // Check if the stock is already in the user's watchlist
            var existingWatchlist = await _context.Watchlists
                            .FirstOrDefaultAsync(w => w.UserId == userId
                                && w.StockId == stockId);
            if (existingWatchlist != null)
            {
                return BadRequest($"Stock with ID {stockId} is already in the watchlist of user with ID {userId}");
            }

            // Add the stock to the user's watchlist
            var watchlistItem = new Watchlist
            {
                UserId = userId,
                StockId = stockId
            };
            _context.Watchlists.Add(watchlistItem);
            await _context.SaveChangesAsync();

            return Ok($"Stock with ID {stockId} added to the watchlist of user with ID {userId}");
        }

    }
}


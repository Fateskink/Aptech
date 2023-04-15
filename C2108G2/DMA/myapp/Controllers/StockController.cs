using System;
using Microsoft.AspNetCore.Mvc;
using myapp.Models;
using myapp.Repositories;
using System.Linq;

namespace myapp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StockController : ControllerBase
    {
        private readonly IStockRepository _stockRepository;

        public StockController(IStockRepository stockRepository)
        {
            _stockRepository = stockRepository;
        }

        [HttpGet]
        public IActionResult GetStocks(
            string? sector = null, string industry = null,
            int page = 1, int pageSize = 20)
        {
            var stocks = _stockRepository.GetStocksBySectorAndIndustry(sector, industry, page, pageSize);

            if (stocks == null || stocks.Count() == 0)
            {
                return NotFound();
            }

            return Ok(stocks);
        }
    }
}


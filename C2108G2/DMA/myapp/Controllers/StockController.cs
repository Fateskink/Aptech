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
        public async Task<IActionResult> GetStocks(
            string sector = "",
            string industry = "",
            string searchText = "",
            int page = 1, int pageSize = 20)
        {
            var stocks = await _stockRepository
                            .GetStocksBySectorAndIndustry(
                                sector, industry,
                                searchText,
                                page, pageSize);

            if (stocks == null || stocks.Count() == 0)
            {
                return NotFound();
            }

            return Ok(stocks);
        }

    }
}


﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using newsapp.Models;

namespace newsapp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        private readonly DataContext _context;

        public NewsController(DataContext context)
        {
            _context = context;
        }

        // GET: api/News
        [HttpGet]
        public async Task<ActionResult<IEnumerable<News>>> GetNews()
        {
          if (_context.News == null)
          {
              return NotFound();
          }
            return await _context.News.ToListAsync();
        }

        // GET: api/News/5
        [HttpGet("{id}")]
        public async Task<ActionResult<News>> GetNews(int id)
        {
          if (_context.News == null)
          {
              return NotFound();
          }
            var news = await _context.News.FindAsync(id);

            if (news == null)
            {
                return NotFound();
            }

            return news;
        }
        [HttpGet("{strSearch}")]
        public async Task<ActionResult<List<News>>> SearchString(string strSearch)
        {
            strSearch = strSearch.Trim().ToLower();
            IQueryable<News> query = _context.News;

            if (!string.IsNullOrWhiteSpace(strSearch))
            {
                query = query.Where(item =>
                    item.Content.ToLower().Trim().Contains(strSearch) ||
                    item.Summary.ToLower().Trim().Contains(strSearch) ||
                    item.Title.ToLower().Trim().Contains(strSearch)
                );
            }
            List<News> newsList = await query.ToListAsync();
            return Ok(newsList);
        }
        [HttpGet("search/{categoryID}")]
        public async Task<ActionResult<List<News>>> GetNewsByCategoryID(int categoryID)
        {            
            List<News> result = await _context.News
                                    .Where(news => news.CategoryID == categoryID)
                                    .ToListAsync();            
            return Ok(result);
        }


        // PUT: api/News/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNews(int id, News news)
        {
            if (id != news.ID)
            {
                return BadRequest();
            }

            _context.Entry(news).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NewsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/News
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<News>> PostNews(News news)
        {
          if (_context.News == null)
          {
              return Problem("Entity set 'DataContext.News'  is null.");
          }
            _context.News.Add(news);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNews", new { id = news.ID }, news);
        }



        // DELETE: api/News/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteNews(int id)
        {
            if (_context.News == null)
            {
                return NotFound();
            }
            var news = await _context.News.FindAsync(id);
            if (news == null)
            {
                return NotFound();
            }

            _context.News.Remove(news);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool NewsExists(int id)
        {
            return (_context.News?.Any(e => e.ID == id)).GetValueOrDefault();
        }
    }
}

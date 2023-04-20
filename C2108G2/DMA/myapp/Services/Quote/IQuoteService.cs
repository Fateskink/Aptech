using System;
using myapp.Models;
using myapp.Models.SQLViews;

namespace myapp.Repositories.Quote
{
	public interface IQuoteService
	{        
        public Task<IEnumerable<QuotesRealtime>>
            GetQuotes( int page, int pageSize,
            string sector = "",
            string industry = "");

    }
}


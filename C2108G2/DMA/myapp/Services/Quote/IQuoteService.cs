using System;
using myapp.Models;

namespace myapp.Repositories.Quote
{
	public interface IQuoteService
	{        
        public Task<IEnumerable<myapp.Models.SQLViews.QuotesRealtime>>
            GetQuotes( int page, int pageSize,
            string sector = "",
            string industry = "");

    }
}


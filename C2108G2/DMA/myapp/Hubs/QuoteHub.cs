using System;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using myapp.Models;

namespace myapp.Hubs
{
    public class QuoteHub : Hub
    {
        public async Task UpdateQuote(Quote quote)
        {
            /*
             * chúng ta định nghĩa một phương thức UpdateQuote để nhận dữ liệu mới nhất về giá cổ phiếu từ client. 
             * Sau đó, chúng ta sử dụng phương thức SendAsync 
             * của SignalR để gửi lại thông tin cho tất cả các client đã kết nối thông qua phương thức ReceiveQuotes.
             */
            await Clients.All.SendAsync("ReceiveQuotes", quote);
        }
    }
}


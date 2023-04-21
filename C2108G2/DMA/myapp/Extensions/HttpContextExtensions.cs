using System;
namespace myapp.Extensions
{
    public static class HttpContextExtensions
    {
        public static int GetUserId(this HttpContext httpContext)
        {
            if (httpContext.Items.ContainsKey("UserId"))
            {
                return (int)httpContext.Items["UserId"];
            }
            else
            {
                throw new Exception("User ID not found in HttpContext.Items");
            }
        }
    }
}


using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Models
{
    public class MServerResponse<T>
    {
        public MServerResponse()
        {
            StatusCode = 500;
        }
        public T Data { get; set; }
        public int StatusCode { get; set; }
        public string SuccessMessage { get; set; }
        public string Error { get; set; }
    }

}

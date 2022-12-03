using System;

namespace mServerWeb.Core.Models
{
    public class BrandResponse : BrandRequest
    {
        public string Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastModifiedDate { get; set; }

    }
}

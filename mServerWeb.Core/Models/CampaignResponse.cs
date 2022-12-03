using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Models
{
    public class CampaignResponse
    {
        public string Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastModifiedDate { get; set; }
    }
}

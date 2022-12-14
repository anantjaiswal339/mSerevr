using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Models
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    //public class Address
    //{
    //    public string city { get; set; }
    //    public string state { get; set; }
    //    public string street { get; set; }
    //    public string zipCode { get; set; }
    //}

    //public class AlternateBusinessId
    //{
    //    public string id { get; set; }
    //    public string type { get; set; }
    //}

    public class Paging
    {
        public int page { get; set; }
        public int size { get; set; }
        public int totalPages { get; set; }
        public int totalResults { get; set; }
    }

    public class BrandModel
    {
        public string id { get; set; }
        public string referenceId { get; set; }
        public string type { get; set; }
        public Address address { get; set; }
        public AlternateBusinessId alternateBusinessId { get; set; }
        public string countryCode { get; set; }
        public DateTime createdDate { get; set; }
        public string supportEmail { get; set; }
        public DateTime lastModifiedDate { get; set; }
        public string legalName { get; set; }
        public string name { get; set; }
        public string supportPhone { get; set; }
        public string vertical { get; set; }
        public string website { get; set; }
        public string taxId { get; set; }
    }

    public class Root
    {
        public List<BrandModel> results { get; set; }
        public Paging paging { get; set; }
    }


}

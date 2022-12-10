namespace mServerWeb.Core.Models
{
    public class BrandRequest
    {
        public string ReferenceId { get; set; }
        public string Type { get; set; }
        public Address Address { get; set; }
        public AlternateBusinessId AlternateBusinessId { get; set; }
        public string CountryCode { get; set; }
        public string SupportEmail { get; set; }
        public string LegalName { get; set; }
        public string Name { get; set; }
        public string SupportPhone { get; set; }
        public string Vertical { get; set; }
        public string Website { get; set; }
        public string TaxId { get; set; }

        public BrandRequest()
        {
            Address = new Address();
            AlternateBusinessId = new AlternateBusinessId();
        }
    }

    public class Address
    {
        public string City { get; set; }
        public string State { get; set; }
        public string Street { get; set; }
        public string ZipCode { get; set; }
    }

    public class AlternateBusinessId
    {
        public string Id { get; set; }
        public string Type { get; set; }
    }
}

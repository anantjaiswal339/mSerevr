using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Models
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    public class CamKeyword
    {
        public string callToAction { get; set; }
        public List<string> keywords { get; set; }
        public string type { get; set; }
    }

    public class CamOptIns
    {
        public Keyword keyword { get; set; }
    }

    public class CamPaging
    {
        public int page { get; set; }
        public int size { get; set; }
        public int totalPages { get; set; }
        public int totalResults { get; set; }
    }

    public class CamResult
    {
        public string id { get; set; }
        public string referenceId { get; set; }
        public string type { get; set; }
        public string name { get; set; }
        public DateTime createdDate { get; set; }
        public DateTime lastModifiedDate { get; set; }
        public List<string> numberKeys { get; set; }
        public string brandId { get; set; }
        public string confirmationMessage { get; set; }
        public string customerCarePhone { get; set; }
        public string customerCareEmail { get; set; }
        public List<string> exampleMessages { get; set; }
        public string helpMessage { get; set; }
        public bool lowVolume { get; set; }
        public List<string> messageTypes { get; set; }
        public string programSummary { get; set; }
        public string stopMessage { get; set; }
        public string termsAndConditionsUrl { get; set; }
        public string useCase { get; set; }
        public OptIns optIns { get; set; }
    }

    public class CamRoot
    {
        public List<CamResult> results { get; set; }
        public Paging paging { get; set; }
    }


}

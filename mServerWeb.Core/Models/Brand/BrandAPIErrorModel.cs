using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Models
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    public class RequestError
    {
        public ServiceException serviceException { get; set; }
    }

    public class BrandAPIErrorModel
    {
        public RequestError requestError { get; set; }
    }

    public class ServiceException
    {
        public string messageId { get; set; }
        public string text { get; set; }
        public ValidationErrors validationErrors { get; set; }
    }

    public class ValidationErrors
    {
        [JsonProperty("brand.website")]
        public List<string> brandwebsite { get; set; }
        public List<string> brand { get; set; }
    }
}

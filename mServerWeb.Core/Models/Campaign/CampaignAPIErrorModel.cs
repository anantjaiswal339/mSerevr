using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace mServerWeb.Core.Models
{
    
    public class ServiceExceptionCampaign
    {
        public string messageId { get; set; }
        public string text { get; set; }
        public ValidationErrorsCampaign validationErrors { get; set; }
    }

    public class ValidationErrorsCampaign
    {
        [JsonPropertyName("customerCareEmail")]
        [JsonProperty("campaign.customerCareEmail")]
        public List<string> campaigncustomerCareEmail { get; set; }

        [JsonProperty("campaign.confirmationMessage")]
        public List<string> campaignconfirmationMessage { get; set; }

        [JsonProperty("campaign.optIns.interactiveVoiceResponse.callToAction")]
        public List<string> campaignoptInsinteractiveVoiceResponsecallToAction { get; set; }

        [JsonProperty("campaign.stopMessage")]
        public List<string> campaignstopMessage { get; set; }

        [JsonProperty("campaign.customerCarePhone")]
        public List<string> campaigncustomerCarePhone { get; set; }

        [JsonProperty("campaign.exampleMessages[0]")]
        public List<string> campaignexampleMessages0 { get; set; }

        [JsonProperty("campaign.helpMessage")]
        public List<string> campaignhelpMessage { get; set; }

        [JsonProperty("campaign.programSummary")]
        public List<string> campaignprogramSummary { get; set; }

        [JsonProperty("campaign.termsAndConditionsUrl")]
        public List<string> campaigntermsAndConditionsUrl { get; set; }
    }



    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
    public class RequestErrorCampaign
    {
        public ServiceExceptionCampaign serviceException { get; set; }
    }

    public class CampaignAPIErrorModel
    {
        public RequestErrorCampaign requestError { get; set; }
    }
}

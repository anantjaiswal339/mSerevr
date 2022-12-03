using System.Collections.Generic;

namespace mServerWeb.Core.Models
{
    public class CampaignRequest
    {
        public string ReferenceId { get; set; }
        public string Type { get; set; }
        public string Name { get; set; }
        public List<string> NumberKeys { get; set; }
        public string BrandId { get; set; }
        public string ConfirmationMessage { get; set; }
        public string CustomerCarePhone { get; set; }
        public string CustomerCareEmail { get; set; }
        public List<string> ExampleMessages { get; set; }
        public string HelpMessage { get; set; }
        public bool LowVolume { get; set; }
        public List<string> MessageTypes { get; set; }
        public string ProgramSummary { get; set; }
        public string StopMessage { get; set; }
        public string TermsAndConditionsUrl { get; set; }
        public string UseCase { get; set; }
        public OptIns OptIns { get; set; }

        public CampaignRequest()
        {
            NumberKeys = new List<string>();
            ExampleMessages = new List<string>();
            MessageTypes = new List<string>();
            OptIns = new OptIns();
        }

    }

    public class OptIns
    {
        public Keyword Keyword { get; set; }
        public Web Web { get; set; }
        public Verbal Verbal { get; set; }
        public InteractiveVoiceResponse InteractiveVoiceResponse { get; set; }
    }

    public class Keyword
    {
        public string CallToAction { get; set; }
        public List<string> Keywords { get; set; }
    }
    public class Web
    {
        public string CallToAction { get; set; }
        public string Url { get; set; }
    }
    public class Verbal
    {
        public string CallToAction { get; set; }
    }
    public class InteractiveVoiceResponse
    {
        public string CallToAction { get; set; }
    }
}

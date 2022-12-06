using mServerWeb.Core.Models;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using RestSharp;
using System;

namespace mServerWeb.Core.Services
{
	public class CampaignService : ICampaignService
    {
        public CampaignResponse AddCampaign(CampaignRequest req)
        {
			try
			{
                var client = new RestClient("https://{baseUrl}/number-registration/1/campaigns");
                var request = new RestRequest("", Method.Post);
                request.AddHeader("Authorization", "{authorization}");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Accept", "application/json");
                var body = JsonConvert.SerializeObject(req);
                request.AddParameter("application/json", body, ParameterType.RequestBody);
                var response = client.Execute(request);
                Console.WriteLine(response.Content);

                CampaignResponse resObj = JsonConvert.DeserializeObject<CampaignResponse>(response.Content);

                return resObj;
            }
			catch (Exception ex)
			{
				throw ex;
			}
        }

        public string GetCampaignJson()
        {
            try
            {
                string jsonData = "\"{\\r\\n  \\\"results\\\": [\\r\\n    {\\r\\n      \\\"id\\\": \\\"4d3601ed-c632-4979-ae22-43854ef4ffaf\\\",\\r\\n      \\\"referenceId\\\": \\\"customer-defined-identifier\\\",\\r\\n      \\\"type\\\": \\\"TEN_DIGIT_LONG_CODE\\\",\\r\\n      \\\"name\\\": \\\"Example Promo\\\",\\r\\n      \\\"createdDate\\\": \\\"2019-08-24T14:15:22Z\\\",\\r\\n      \\\"lastModifiedDate\\\": \\\"2019-08-24T14:15:22Z\\\",\\r\\n      \\\"numberKeys\\\": [\\r\\n        \\\"D79C1785A82A2BC6FC0B867DCD055215\\\"\\r\\n      ],\\r\\n      \\\"brandId\\\": \\\"a0c63335-f841-4d43-9ef8-e0765a233f29\\\",\\r\\n      \\\"confirmationMessage\\\": \\\"Example promotional-marketing. Msg&data rates may apply. Reply HELP for help, STOP to cancel.\\\",\\r\\n      \\\"customerCarePhone\\\": \\\"18889997777\\\",\\r\\n      \\\"customerCareEmail\\\": \\\"examples@example.com\\\",\\r\\n      \\\"exampleMessages\\\": [\\r\\n        \\\"Come in today and get 10% OFF today!\\\"\\r\\n      ],\\r\\n      \\\"helpMessage\\\": \\\"Example promotional-marketing: Help at textsupport@example.com or 18889997777. Msg&data rates may apply. Reply STOP to cancel.\\\",\\r\\n      \\\"lowVolume\\\": false,\\r\\n      \\\"messageTypes\\\": [\\r\\n        \\\"sms\\\",\\r\\n        \\\"mms\\\"\\r\\n      ],\\r\\n      \\\"programSummary\\\": \\\"A mix of promotional and informational messaging.\\\",\\r\\n      \\\"stopMessage\\\": \\\"Example promotional-marketing: You have been unsubscribed, no more messages will be sent.\\\",\\r\\n      \\\"termsAndConditionsUrl\\\": \\\"https://www.example.com/terms-and-conditions\\\",\\r\\n      \\\"useCase\\\": \\\"PROMOTIONAL_MARKETING\\\",\\r\\n      \\\"optIns\\\": {\\r\\n        \\\"keyword\\\": {\\r\\n          \\\"callToAction\\\": \\\"Text MESSAGE to subscribe\\\",\\r\\n          \\\"keywords\\\": [\\r\\n            \\\"MESSAGE\\\"\\r\\n          ],\\r\\n          \\\"type\\\": \\\"keyword\\\"\\r\\n        }\\r\\n      }\\r\\n    }\\r\\n  ],\\r\\n  \\\"paging\\\": {\\r\\n    \\\"page\\\": 0,\\r\\n    \\\"size\\\": 20,\\r\\n    \\\"totalPages\\\": 1,\\r\\n    \\\"totalResults\\\": 1\\r\\n  }\\r\\n}\"";
                return jsonData;
                var client = new RestClient("https://{baseUrl}/number-registration/1/campaigns");
                var request = new RestRequest("", Method.Get);
                request.AddHeader("Authorization", "{authorization}");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Accept", "application/json");
                //var body = JsonConvert.SerializeObject(req);
                //request.AddParameter("application/json", body, ParameterType.RequestBody);
                var response = client.Execute(request);
                Console.WriteLine(response.Content);
                //dynamic dyobj = JsonConvert.DeserializeObject<dynamic>(data);
                //BrandsList resObj = JsonConvert.DeserializeObject<BrandsList>(dyobj);
                //return data;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

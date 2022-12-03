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
    }
}

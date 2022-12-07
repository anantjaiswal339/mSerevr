using mServerWeb.Core.Models;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using RestSharp;
using System;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;

namespace mServerWeb.Core.Services
{
	public class CampaignService : ICampaignService
    {
        public MServerResponse<CampaignResponse> AddCampaign(CampaignRequest req, string url, string auth)
        {
            var response = new MServerResponse<CampaignResponse>();
            try
			{
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("App", auth);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                JsonConvert.DefaultSettings = () => new JsonSerializerSettings
                {
                    ContractResolver = new CamelCasePropertyNamesContractResolver()
                };

                var body = JsonConvert.SerializeObject(req);
                var httpContent = new StringContent(body, Encoding.UTF8, "application/json");
                using (HttpResponseMessage httpResponse = client.PostAsync("number-registration/1/campaigns", httpContent).GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<CampaignResponse>(responseContent);
                    }
                    else
                    {
                        response.Error = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    }
                }

                return response;
            }
			catch (Exception ex)
			{
				throw ex;
			}
        }

        public MServerResponse<CamRoot> GetCampaignJson(string url, string auth)
        {
            var response = new MServerResponse<CamRoot>();
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("App", auth);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                JsonConvert.DefaultSettings = () => new JsonSerializerSettings
                {
                    ContractResolver = new CamelCasePropertyNamesContractResolver()
                };

                using (HttpResponseMessage httpResponse = client.GetAsync("number-registration/1/campaigns").GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<CamRoot>(responseContent);
                    }
                    else
                    {
                        response.Error = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    }
                }
                return response;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public MServerResponse<CamResult> GetCampaignDetails(string campaignId, string url, string auth)
        {
            var response = new MServerResponse<CamResult>();
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("App", auth);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                JsonConvert.DefaultSettings = () => new JsonSerializerSettings
                {
                    ContractResolver = new CamelCasePropertyNamesContractResolver()
                };

                using (HttpResponseMessage httpResponse = client.GetAsync($"number-registration/1/campaigns/{campaignId}").GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<CamResult>(responseContent);
                    }
                    else
                    {
                        response.Error = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    }
                }
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

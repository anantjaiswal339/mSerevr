using mServerWeb.Core.Models;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using RestSharp;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Services;

namespace mServerWeb.Core.Services
{
    public class BrandService : IBrandService
    {
        public MServerResponse<BrandResponse> AddBrand(BrandRequest req, string url, string auth)
        {
            var response = new MServerResponse<BrandResponse>();
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
                using (HttpResponseMessage httpResponse = client.PostAsync("number-registration/1/brands", httpContent).GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<BrandResponse>(responseContent);
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

        public MServerResponse<Root> GetBrands(string url, string auth)
        {
            var response = new MServerResponse<Root>();
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

                using (HttpResponseMessage httpResponse = client.GetAsync("number-registration/1/brands").GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<Root>(responseContent);
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


        public string GetBrandsJson(string url, string auth)
        {
            try
            {
                string jsonData = $"{{\r\n\t\"results\": [{{\r\n\t\t\"id\": \"79ff0424-7201-45ca-bcbe-9989535fa2ec\",\r\n\t\t\"referenceId\": \"customer-defined-identifier\",\r\n\t\t\"type\": \"TENDLC_PRIVATE_COMPANY\",\r\n\t\t\"address\": {{\r\n\t\t\t\"city\": \"Seattle\",\r\n\t\t\t\"state\": \"WA\",\r\n\t\t\t\"street\": \"56486 915th Street\",\r\n\t\t\t\"zipCode\": \"98061\"\r\n\t\t}},\r\n\t\t\"alternateBusinessId\": {{\r\n\t\t\t\"id\": \"858020355\",\r\n\t\t\t\"type\": \"data-universal-numbering-system\"\r\n\t\t}},\r\n\t\t\"countryCode\": \"US\",\r\n\t\t\"createdDate\": \"2021-01-19T16:17:14Z\",\r\n\t\t\"supportEmail\": \"help@example.com\",\r\n\t\t\"lastModifiedDate\": \"2021-01-19T16:17:14Z\",\r\n\t\t\"legalName\": \"Examples Warehouse LLC\",\r\n\t\t\"name\": \"Examples Warehouse\",\r\n\t\t\"supportPhone\": \"18886679878\",\r\n\t\t\"vertical\": \"RETAIL_AND_CONSUMER_PRODUCTS\",\r\n\t\t\"website\": \"https://www.example.com\",\r\n\t\t\"taxId\": \"62-4161762\"\r\n\t}}],\r\n\t\"paging\": {{\r\n\t\t\"page\": 0,\r\n\t\t\"size\": 20,\r\n\t\t\"totalPages\": 1,\r\n\t\t\"totalResults\": 1\r\n\t}}\r\n}}";
                return jsonData;
                string data = "\"{\\r\\n  \\\"results\\\": [\\r\\n    {\\r\\n      \\\"id\\\": \\\"79ff0424-7201-45ca-bcbe-9989535fa2ec\\\",\\r\\n      \\\"referenceId\\\": \\\"customer-defined-identifier\\\",\\r\\n      \\\"type\\\": \\\"TENDLC_PRIVATE_COMPANY\\\",\\r\\n      \\\"address\\\": {\\r\\n        \\\"city\\\": \\\"Seattle\\\",\\r\\n        \\\"state\\\": \\\"WA\\\",\\r\\n        \\\"street\\\": \\\"56486 915th Street\\\",\\r\\n        \\\"zipCode\\\": \\\"98061\\\"\\r\\n      },\\r\\n      \\\"alternateBusinessId\\\": {\\r\\n        \\\"id\\\": \\\"858020355\\\",\\r\\n        \\\"type\\\": \\\"data-universal-numbering-system\\\"\\r\\n      },\\r\\n      \\\"countryCode\\\": \\\"US\\\",\\r\\n      \\\"createdDate\\\": \\\"2021-01-19T16:17:14Z\\\",\\r\\n      \\\"supportEmail\\\": \\\"help@example.com\\\",\\r\\n      \\\"lastModifiedDate\\\": \\\"2021-01-19T16:17:14Z\\\",\\r\\n      \\\"legalName\\\": \\\"Examples Warehouse LLC\\\",\\r\\n      \\\"name\\\": \\\"Examples Warehouse\\\",\\r\\n      \\\"supportPhone\\\": \\\"18886679878\\\",\\r\\n      \\\"vertical\\\": \\\"RETAIL_AND_CONSUMER_PRODUCTS\\\",\\r\\n      \\\"website\\\": \\\"https://www.example.com\\\",\\r\\n      \\\"taxId\\\": \\\"62-4161762\\\"\\r\\n    }\\r\\n  ],\\r\\n  \\\"paging\\\": {\\r\\n    \\\"page\\\": 0,\\r\\n    \\\"size\\\": 20,\\r\\n    \\\"totalPages\\\": 1,\\r\\n    \\\"totalResults\\\": 1\\r\\n  }\\r\\n}\"";
                var client = new RestClient("https://{baseUrl}/number-registration/1/brands");
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
                return data;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public MServerResponse<BrandModel> GetBrandDetails(string brandId, string url, string auth)
        {
            var response = new MServerResponse<BrandModel>();
            try
            {
                string jdata = "\"{\\r\\n  \\\"id\\\": \\\"79ff0424-7201-45ca-bcbe-9989535fa2ec\\\",\\r\\n  \\\"referenceId\\\": \\\"customer-defined-identifier\\\",\\r\\n  \\\"type\\\": \\\"TENDLC_NON_PROFIT\\\",\\r\\n  \\\"address\\\": {\\r\\n    \\\"city\\\": \\\"Seattle\\\",\\r\\n    \\\"state\\\": \\\"WA\\\",\\r\\n    \\\"street\\\": \\\"56486 915th Street\\\",\\r\\n    \\\"zipCode\\\": \\\"98061\\\"\\r\\n  },\\r\\n  \\\"alternateBusinessId\\\": {\\r\\n    \\\"id\\\": \\\"590900O3Z29E78HVXT56\\\",\\r\\n    \\\"type\\\": \\\"LEI\\\"\\r\\n  },\\r\\n  \\\"countryCode\\\": \\\"US\\\",\\r\\n  \\\"createdDate\\\": \\\"2021-01-19T16:17:14Z\\\",\\r\\n  \\\"supportEmail\\\": \\\"exampl@example.com\\\",\\r\\n  \\\"lastModifiedDate\\\": \\\"2021-01-19T16:17:14Z\\\",\\r\\n  \\\"legalName\\\": \\\"Examples In Need\\\",\\r\\n  \\\"name\\\": \\\"Examples In Need\\\",\\r\\n  \\\"supportPhone\\\": \\\"18886679878\\\",\\r\\n  \\\"vertical\\\": \\\"NON_PROFIT_ORGANIZATION\\\",\\r\\n  \\\"website\\\": \\\"https://www.example.com\\\",\\r\\n  \\\"taxId\\\": \\\"62-4161762\\\"\\r\\n}\"";

                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("App", auth);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                JsonConvert.DefaultSettings = () => new JsonSerializerSettings
                {
                    ContractResolver = new CamelCasePropertyNamesContractResolver()
                };

                using (HttpResponseMessage httpResponse = client.GetAsync($"number-registration/1/brands/{brandId}").GetAwaiter().GetResult())
                {
                    var responseContent = httpResponse.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (httpResponse.IsSuccessStatusCode)
                    {
                        response.StatusCode = (int)httpResponse.StatusCode;
                        response.Data = JsonConvert.DeserializeObject<BrandModel>(responseContent);
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

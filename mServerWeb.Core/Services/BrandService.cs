using mServerWeb.Core.Models;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using RestSharp;
using System;

namespace mServerWeb.Core.Services
{
    public class BrandService : IBrandService
    {
        public BrandResponse AddBrand(BrandRequest req)
        {
            try
            {

                var client = new RestClient("https://{baseUrl}/number-registration/1/brands");
                var request = new RestRequest("", Method.Post);
                request.AddHeader("Authorization", "{authorization}");
                request.AddHeader("Content-Type", "application/json");
                request.AddHeader("Accept", "application/json");
                var body = JsonConvert.SerializeObject(req);
                request.AddParameter("application/json", body, ParameterType.RequestBody);
                var response = client.Execute(request);
                Console.WriteLine(response.Content);

                BrandResponse resObj = JsonConvert.DeserializeObject<BrandResponse>(response.Content);

                return resObj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

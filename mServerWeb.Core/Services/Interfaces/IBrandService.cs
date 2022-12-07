using mServerWeb.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Services.Interfaces
{
    public interface IBrandService
    {
        MServerResponse<BrandResponse> AddBrand(BrandRequest req, string url, string auth);
        MServerResponse<Root> GetBrands(string url, string auth);
        string GetBrandsJson(string url, string auth);
        MServerResponse<BrandModel> GetBrandDetails(string brandId, string url, string auth);
        //Result BindBrandDetails(string brandId);
    }
}

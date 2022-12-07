using mServerWeb.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Services.Interfaces
{
    public interface IBrandService
    {
        MServerResponse<BrandResponse> AddBrand(BrandRequest req);
        MServerResponse<Root> GetBrands();
        string GetBrandsJson();
        MServerResponse<BrandModel> GetBrandDetails(string brandId);
        //Result BindBrandDetails(string brandId);
    }
}

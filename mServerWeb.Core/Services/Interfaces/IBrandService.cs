using mServerWeb.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace mServerWeb.Core.Services.Interfaces
{
    public interface IBrandService
    {
        BrandResponse AddBrand(BrandRequest req);
        //BrandsList GetBrands();
        Root GetBrands();
        string GetBrandsJson();
        string GetBrandDetails(string brandId);
        //Result BindBrandDetails(string brandId);
    }
}

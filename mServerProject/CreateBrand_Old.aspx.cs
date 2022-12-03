using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using System;

namespace mServerProject
{
    public partial class CreateBrand_Old : System.Web.UI.Page
    {

        private ICampaignService campaignRegistryBrandService;
        private ICampaignService _brandService
        {
            get { return campaignRegistryBrandService ?? (campaignRegistryBrandService = new CampaignService()); }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


            }
        }
    }
}
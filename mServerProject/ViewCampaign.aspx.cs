using mServerWeb.Core.Services.Interfaces;
using mServerWeb.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace mServerProject
{
    public partial class ViewCampaign : System.Web.UI.Page
    {
        private IBrandService brandService;
        private IBrandService _brandService
        {
            get { return brandService ?? (brandService = new BrandService()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GetCampaign();
            }
        }

        [WebMethod]
        public static string GetCampaign()
        {
            CampaignService _CampaignService = new CampaignService();
            string resbrd = _CampaignService.GetCampaignJson();
            return resbrd;
        }
    }
}
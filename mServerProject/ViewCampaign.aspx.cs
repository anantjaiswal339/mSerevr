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
        private static ICampaignService campaignService;
        private static ICampaignService _campaignService
        {
            get { return campaignService ?? (campaignService = new CampaignService()); }
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
            string resbrd = _campaignService.GetCampaignJson();
            return resbrd;
        }
    }
}
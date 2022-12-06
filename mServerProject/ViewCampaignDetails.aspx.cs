using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mServerProject
{
    public partial class ViewCampaignDetails : System.Web.UI.Page
    {
        private static ICampaignService campaignService;
        private static ICampaignService _campaignService
        {
            get { return campaignService ?? (campaignService = new CampaignService()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string BindCampaignDetails(string campaignId)
        {
            try
            {
                string resbrd = _campaignService.GetCampaignDetails(campaignId);

                return resbrd;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
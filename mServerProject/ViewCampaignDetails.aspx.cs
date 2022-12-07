using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
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
        private static string url = ConfigurationSettings.AppSettings["Url"];
        private static string auth = ConfigurationSettings.AppSettings["Auth"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object BindCampaignDetails(string campaignId)
        {
            try
            {
                return _campaignService.GetCampaignDetails(campaignId, url, auth);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
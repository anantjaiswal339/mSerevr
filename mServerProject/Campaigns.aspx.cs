using mServerWeb.Core.Services.Interfaces;
using mServerWeb.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Configuration;

namespace mServerProject
{
    public partial class Campaigns : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                //GetCampaign();
            }
        }

        [WebMethod]
        public static object GetCampaign()
        {
            return _campaignService.GetCampaignJson(url, auth);
        }
    }
}
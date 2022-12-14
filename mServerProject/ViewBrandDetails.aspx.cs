using mServerWeb.Core.Services.Interfaces;
using mServerWeb.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using mServerWeb.Core.Models;
using System.Web.Services;
using Newtonsoft.Json;
using System.Configuration;

namespace mServerProject
{
    public partial class ViewBrandDetails : System.Web.UI.Page
    {
        private static IBrandService brandService;
        private static IBrandService _brandService
        {
            get { return brandService ?? (brandService = new BrandService()); }
        }

        private static string url = ConfigurationSettings.AppSettings["Url"];
        private static string auth = ConfigurationSettings.AppSettings["Auth"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindBrandDetails();
            }
        }

        [WebMethod]
        public static object BindBrandDetails(string brandId)
        {
            try
            {
                return _brandService.GetBrandDetails(brandId, url, auth);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
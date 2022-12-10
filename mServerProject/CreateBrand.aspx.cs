using mServerWeb.Core.Models;
using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.DynamicData;
using System.Xml.Linq;

namespace mServerProject
{
    public partial class CreateBrand : System.Web.UI.Page
    {

        private IBrandService brandService;
        private IBrandService _brandService
        {
            get { return brandService ?? (brandService = new BrandService()); }
        }
        private static string url = ConfigurationSettings.AppSettings["Url"];
        private static string auth = ConfigurationSettings.AppSettings["Auth"];
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string vasId = "VAS010";
                BrandRequest req = new BrandRequest
                {
                    Name = txtName.Text,
                    ReferenceId = vasId,
                    Type = ddlType.Text,
                    Address = new Address
                    {
                        Street = txtStreet.Text,
                        City = txtCity.Text,
                        State = txtState.Text,
                        ZipCode = txtZipCode.Text
                    },
                    AlternateBusinessId = new AlternateBusinessId { Id = "590900O3Z29E78HVXT56", Type = "LEI" },
                    CountryCode = ddlCountry.Text,
                    SupportEmail = txtEmail.Text,
                    LegalName = txtLegalName.Text,
                    SupportPhone = txtPhone.Text,
                    Vertical = ddlVertical.Text,
                    Website = txtWebsite.Text,
                    TaxId = txtTax.Text,

                };

                var response = _brandService.AddBrand(req, url, auth);
                if (response.StatusCode == 201)
                    Response.Redirect("Brands");

                StringBuilder strErrors = new StringBuilder();
                var brandAPIError = JsonConvert.DeserializeObject<BrandAPIErrorModel>(response.Error);
                if (brandAPIError != null)
                {
                    var errorModel = brandAPIError.requestError.serviceException.validationErrors;
                    var dict = errorModel.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public).ToDictionary(prop => prop.Name, prop => (object)prop.GetValue(errorModel, null));
                    foreach (var item in dict)
                    {
                        strErrors.Append("<b>" + item.Key + "</b>:<br/>");
                        string[] values = ((IEnumerable)item.Value).Cast<object>()
                             .Select(x => x.ToString())
                             .ToArray();

                        strErrors.Append(string.Join("<br>", values));
                        strErrors.Append("<br>");
                    }
                    ltrError.Visible = true;
                }
                ltrError.Text = strErrors.ToString();
            }
            catch (Exception ex)
            {
                ltrError.Text = "Something went wrong!";
            }
        }
    }
}
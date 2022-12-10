using Microsoft.Ajax.Utilities;
using mServerWeb.Core.Models;
using mServerWeb.Core.Models.Campaign;
using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Text;
using System.Web.UI.WebControls;

namespace mServerProject
{
    public partial class CampaignRegistration : System.Web.UI.Page
    {
        private ICampaignService campaignService;
        private ICampaignService _campaignService
        {
            get { return campaignService ?? (campaignService = new CampaignService()); }
        }

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
                var brands = _brandService.GetBrands(url, auth);
                if(brands.StatusCode == 200)
                {
                    ddlBrand.DataSource = brands.Data.results;                    
                    ddlBrand.DataValueField  ="id";
                    ddlBrand.DataTextField  ="name";
                    ddlBrand.DataBind();

                    ddlBrand.Items.Insert(0, new ListItem("--Select Brand--", ""));
                }

                List<NumbersModel> numbers = new List<NumbersModel>();
                numbers.Add(new NumbersModel { Number = "447860099299", NumberKey = "1AD64938DE25A3818114CD5E15DB817E" });
                numbers.Add(new NumbersModel { Number = "447491163443", NumberKey = "3CA99AB3B566AFEC74FB98187BDE0B8F" });

                lstNumbers.DataSource = numbers;
                lstNumbers.DataValueField = "NumberKey";
                lstNumbers.DataTextField = "Number";
                lstNumbers.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var exampleMessage = new List<string>();
                if (txtSampleMessage.Text.Length > 0)
                    exampleMessage.Add(txtSampleMessage.Text);

                var messageType = new List<string>();
                var numbersList = new List<string>();
                if (lblMessageType.Items.Count > 0)
                {
                    foreach (ListItem item in lblMessageType.Items)
                    {
                        if (item.Selected)
                            messageType.Add(item.Value);
                    }
                }

                foreach (ListItem item in lstNumbers.Items)
                {
                    if (item.Selected)
                        numbersList.Add(item.Value);
                }
                var optIns = new OptIns();
                if (rblOptIn.Text == "Keyword")
                {
                    Keyword keyword = new Keyword();
                    keyword.Keywords = txtKeyword.Text?.ToString().Split(',').ToList();
                    keyword.CallToAction = txtAutoMessage.Text;
                    optIns.Keyword = keyword;
                }
                else if (rblOptIn.Text == "InteractiveVoiceResponse")
                {
                    InteractiveVoiceResponse inter = new InteractiveVoiceResponse();
                    inter.CallToAction = txtAutoMessage.Text;
                    optIns.InteractiveVoiceResponse = inter;
                }
                else if (rblOptIn.Text == "Verbal")
                {
                    Verbal verbal = new Verbal();
                    verbal.CallToAction = txtAutoMessage.Text;
                    optIns.Verbal = verbal;
                }
                else if (rblOptIn.Text == "Website")
                {
                    Web web = new Web();
                    web.Url = txtUrl.Text;
                    web.CallToAction = txtAutoMessage.Text;
                    optIns.Web = web;
                }

                string vasId = "VAS011";
                CampaignRequest req = new CampaignRequest
                {
                    Name = txtName.Text,
                    ReferenceId = vasId,
                    Type = "TEN_DIGIT_LONG_CODE",
                    NumberKeys = numbersList,
                    BrandId = ddlBrand.Text,
                    ConfirmationMessage = txtConfirmationMessage.Text,
                    CustomerCarePhone = txtSupportNumber.Text,
                    CustomerCareEmail = txtSupportEmail.Text,
                    ExampleMessages = exampleMessage,
                    HelpMessage = txtSupportMessage.Text,
                    LowVolume = false,
                    MessageTypes = messageType,
                    ProgramSummary = txtCampaingDescription.Text,
                    StopMessage = txtStopMessage.Text,
                    TermsAndConditionsUrl = txtTAndC.Text,
                    UseCase = ddlUseCase.Text,
                    OptIns = optIns
                };

                var response = _campaignService.AddCampaign(req, url , auth);
                if (response.StatusCode == 201)
                    Response.Redirect("Campaigns");

                StringBuilder strErrors = new StringBuilder();
                var brandAPIError = JsonConvert.DeserializeObject<CampaignAPIErrorModel>(response.Error);
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
                throw ex;
            }
        }
    }
}
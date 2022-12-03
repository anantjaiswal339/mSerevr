using Microsoft.Ajax.Utilities;
using mServerWeb.Core.Models;
using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;

namespace mServerProject
{
    public partial class CampaignRegistration : System.Web.UI.Page
    {
        private ICampaignService campaignService;
        private ICampaignService _campaignService
        {
            get { return campaignService ?? (campaignService = new CampaignService()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var exampleMessage = new List<string>();
                if (txtSampleMessage.Text.Length > 0)
                    exampleMessage.Add(txtSampleMessage.Text);

                var messageType = new List<string>();
                if (lblMessageType.Items.Count > 0)
                {
                    foreach (var item in lblMessageType.Items)
                    {
                        messageType.Add(item.ToString());
                    }
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

                CampaignRequest req = new CampaignRequest
                {
                    Name = txtName.Text,
                    ReferenceId = "",
                    Type = "TEN_DIGIT_LONG_CODE",
                    NumberKeys = new List<string>(),
                    BrandId = txtName.Text,
                    ConfirmationMessage = txtConfirmationMessage.Text,
                    CustomerCarePhone = txtSupportNumber.Text,
                    CustomerCareEmail = txtSupportEmail.Text,
                    ExampleMessages = exampleMessage,
                    HelpMessage = txtSupportMessage.Text,
                    LowVolume = false,
                    MessageTypes = messageType,
                    ProgramSummary = txtName.Text,
                    StopMessage = txtName.Text,
                    TermsAndConditionsUrl = txtName.Text,
                    UseCase = txtName.Text,
                    OptIns = optIns
                };

                var res = _campaignService.AddCampaign(req);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
using mServerWeb.Core.Models;
using System.Collections.Generic;

namespace mServerWeb.Core.Services.Interfaces
{
    public interface ICampaignService
    {
        MServerResponse<CampaignResponse> AddCampaign(CampaignRequest req, string url, string auth);
        MServerResponse<CamRoot> GetCampaignJson(string url, string auth);
        MServerResponse<CamResult> GetCampaignDetails(string campaignId, string url, string auth);
    }
}

using mServerWeb.Core.Models;
using System.Collections.Generic;

namespace mServerWeb.Core.Services.Interfaces
{
    public interface ICampaignService
    {
        CampaignResponse AddCampaign(CampaignRequest req);
        string GetCampaignJson();
    }
}

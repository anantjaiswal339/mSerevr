using mServerWeb.Core.Models;
using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using System;
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
                BrandRequest req = new BrandRequest
                {
                    Name = txtName.Text,
                    ReferenceId = "",
                    Type = ddlType.Text,
                    Address = new Address
                    {
                        Street = txtStreet.Text,
                        City = txtCity.Text,
                        State = txtState.Text,
                        ZipCode = txtZipCode.Text
                    },
                    AlternateBusinessId = new AlternateBusinessId(),
                    CountryCode = ddlCountry.Text,
                    SupportEmail = txtEmail.Text,
                    LegalName = txtLegalName.Text,
                    SupportPhone = txtPhone.Text,
                    Vertical = ddlVertical.Text,
                    Website = txtWebsite.Text,
                    TaxId = txtTax.Text,

                };

                var res = _brandService.AddBrand(req);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
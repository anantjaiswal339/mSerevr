﻿using mServerWeb.Core.Services.Interfaces;
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

namespace mServerProject
{
    public partial class ViewBrandDetails : System.Web.UI.Page
    {
        private IBrandService brandService;
        private IBrandService _brandService
        {
            get { return brandService ?? (brandService = new BrandService()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindBrandDetails();
            }
        }

        [WebMethod]
        public static string BindBrandDetails(string brandId)
        {
            try
            {
                BrandService _brandService = new BrandService();
                string resbrd = _brandService.GetBrandDetails(brandId);
                //dynamic test = JsonConvert.DeserializeObject<dynamic>(resbrd);
                //Result brddt = JsonConvert.DeserializeObject<Result>(test);
                return resbrd;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        private void BindBrandDetails1(string brandId)
        {
            try
            {
                //Root resbrd = _brandService.GetBrandDetails(brandId);
                //lblcmpname.Text = "";
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
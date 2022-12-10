using mServerWeb.Core.Services;
using mServerWeb.Core.Services.Interfaces;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mServerProject
{
    public partial class Brands : System.Web.UI.Page
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

            }

        }

        [WebMethod]
        public static object GetBrands()
        {
           return _brandService.GetBrands(url, auth);
           
        }

        // remove "this" if not on C# 3.0 / .NET 3.5
        public DataTable ToDataTable<T>(List<T> data)
        {
            PropertyDescriptorCollection props =
                TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }
    }
}
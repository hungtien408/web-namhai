using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class san_pham_chi_tiet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var oBreadcrum = new ProductCategory();
            if (!string.IsNullOrEmpty(Request.QueryString["dci"]))
            {
                var dvBreadcrum = oBreadcrum.ProductCategoryHierarchyToTopSelectAll(Request.QueryString["dci"]).DefaultView;
                lstBreadcrum.DataSource = dvBreadcrum;
                lstBreadcrum.DataBind();
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["cci"]))
            {
                var dvBreadcrum = oBreadcrum.ProductCategoryHierarchyToTopSelectAll(Request.QueryString["cci"]).DefaultView;
                lstBreadcrum.DataSource = dvBreadcrum;
                lstBreadcrum.DataBind();
            }
            else 
            {
                var dvBreadcrum = oBreadcrum.ProductCategoryHierarchyToTopSelectAll(Request.QueryString["sci"]).DefaultView;
                lstBreadcrum.DataSource = dvBreadcrum;
                lstBreadcrum.DataBind();
            }

            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản xuất in ấn";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblTitle.Text = strTitle;
            //lblTitle2.Text = strTitle;
        }
    }

    protected string progressTitle(object input)
    {
        return Common.ConvertTitle(input.ToString());
    }
}
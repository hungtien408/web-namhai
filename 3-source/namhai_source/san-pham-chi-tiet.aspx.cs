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
                lstProductSameTK.Visible = true;
                tabContent.Visible = false;
                lstGalleryTK.Visible = true;
                hdnAdCategoryID.Value = "7";
                lblBanner1.Text = "THIẾT KẾ IN ẤN";
                lblBanner2.Text = "NHỮNG SẢN PHẨM IN ẤN CỦA NAM HẢI";
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["cci"]))
            {
                var dvBreadcrum = oBreadcrum.ProductCategoryHierarchyToTopSelectAll(Request.QueryString["cci"]).DefaultView;
                lstBreadcrum.DataSource = dvBreadcrum;
                lstBreadcrum.DataBind();
                lstProductSameSX.Visible = true;
                tabContent.Visible = false;
                lstGallerySX.Visible = true;
                hdnAdCategoryID.Value = "8";
                lblBanner1.Text = "SẢN XUẤT THẺ CÀO";
                lblBanner2.Text = "NHỮNG SẢN PHẨM THẺ CÀO CỦA NAM HẢI";
            }
            else 
            {
                var dvBreadcrum = oBreadcrum.ProductCategoryHierarchyToTopSelectAll(Request.QueryString["sci"]).DefaultView;
                lstBreadcrum.DataSource = dvBreadcrum;
                lstBreadcrum.DataBind();
                lstProductCategorySeal.Visible = true;
                lstGallerySeal.Visible = true;
                hdnAdCategoryID.Value = "9";
                lblBanner1.Text = "SEAL NIÊM PHONG";
                lblBanner2.Text = "NHỮNG SẢN PHẨM SEAL NIÊM PHONG CỦA NAM HẢI";
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

    private void sendEmail()
    {
        string msg = "<h3>NAM HẢI: CONTACT</h3><br/>";
        msg += "<b>Họ và tên: </b>" + txtFullName.Text.Trim().ToString() + "<br />";
        msg += "<b>Địa chỉ: </b>" + txtAddress.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Nội dung: </b>" + txtNoiDung.Text.Trim().ToString();
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "cc@tranlegroup.com", "", "Contact NAM HẢI", msg, true);
    }
    protected void btGui_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (RadCaptcha1.IsValid)
            //{

                //send email         
                sendEmail();
                //lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                //lblMessage.Visible = true;
                //lblMessage.Text = "";
                //
                //Clear text
                //
                txtFullName.Text = "";
                txtAddress.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtNoiDung.Text = "";
            //}
            //else
            //{
            //    lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
            //}
        }
    }
}
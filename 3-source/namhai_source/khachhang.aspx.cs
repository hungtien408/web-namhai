using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class khachhang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsPartner.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }
            Page.Title = "Khách Hàng";
            var meta = new HtmlMeta() { Name = "description", Content = "Khách Hàng" };
            Header.Controls.Add(meta);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gsolution
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserId"]==null)
            //{
            //    Response.Redirect("~/Login.aspx");
            //}
            //lblCompanyName.Text = Session["CompanyName"].ToString();
            //lblUserName.Text = Session["UserFullName"].ToString();
        }

        protected void lnkBtnOrders_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Orders/ProductsOrder.aspx");
        }

        protected void lnkBtnInventatory_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Inventory/InvProductReceive.aspx");
        }

        protected void lnkBtnSettring_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Settings/Setting.aspx");
        }

        protected void lnkBtnLogout_OnClick(object sender, EventArgs e)
        {
            Session["UserId"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}
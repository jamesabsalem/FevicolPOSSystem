using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fevicol.Orders
{
    public partial class OrdMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"]==null)
            {
                Response.Redirect("~/Login.aspx");
            }
            lblUserName.Text = Session["userName"].ToString();
        }

        protected void btnLogOut_OnClick(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}
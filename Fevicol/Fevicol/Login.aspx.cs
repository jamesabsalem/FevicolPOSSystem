using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly Fev fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLoginMessage.Visible = false;
            lblLoginMessage.Text = "";
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {

            lblLoginMessage.Visible = false;
            lblLoginMessage.Text = "";
            if (!string.IsNullOrEmpty(txtUserName.Text.Trim()) && !string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                DataTable dataTable =
                    fev.get_InformationdataTable("sp_usersLogin '" + txtUserName.Text.Trim() + "','" +
                                                   txtPassword.Text.Trim() + "'");
                if (dataTable.Rows.Count > 0)
                {
                    Session["UserId"] = dataTable.Rows[0]["userId"].ToString();
                    Session["userName"] = dataTable.Rows[0]["userName"].ToString();
                    Response.Redirect("~/fevicol/Home.aspx");
                }
                else
                {
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    lblLoginMessage.Visible = true;
                    lblLoginMessage.Text = "Invalid username and password.";
                }
            }
            else
            {
                txtUserName.Text = "";
                txtPassword.Text = "";
                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "Enter any username and password.";
            }
        }
    }
}
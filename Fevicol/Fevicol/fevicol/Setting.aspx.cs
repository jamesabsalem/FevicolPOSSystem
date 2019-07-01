using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fevicol.Settings
{
    public partial class Setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkBtnAddUser_OnClick(object sender, EventArgs e)
        {
            
            Response.Redirect("AddUser.aspx");
        }

        protected void lnkBtnAddDealer_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect("AddDealer.aspx");
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "OpenModal('AddDealer.aspx');", true);
        }

        protected void lnkBtnAddProduct_OnClick(object sender, EventArgs e)
        {
           // Response.Redirect("AddProduct.aspx");
        }

        protected void lnkBtnAddSize_OnClick(object sender, EventArgs e)
        {
           // Response.Redirect("AddSize.aspx");
        }

        protected void lnkBtnAddUnit_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect("AddUnit.aspx");
        }

        protected void lnkBtnAddProductGroup_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect("AddGroup.aspx");
        }

        protected void lnkBtnAddSalesPerson_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect("AddSalesPerson.aspx");
        }
    }
}
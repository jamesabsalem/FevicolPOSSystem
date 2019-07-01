using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Settings
{
    public partial class AddSalesPerson : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSalesPerson();
            }
            
        }
        protected void btnAddPerson_OnClick(object sender, EventArgs e)
        {
            if (btnAddPerson.Text == "Save")
            {
                if (!string.IsNullOrEmpty(txtSalesPersonName.Text) && !string.IsNullOrEmpty(txtAddress.Text) &&
                    !string.IsNullOrEmpty(txtPhoneNo.Text))
                {
                    bool message = _fev.SalesPersonSave(txtSalesPersonName.Text.Trim(), txtPhoneNo.Text.Trim(),
                        txtAddress.Text.Trim(), Convert.ToInt32(Session["UserId"]));
                    if (message)
                    {

                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup",
                            "swal('Added','Sales person info Added succesfully..','success');", true);
                        ClearTextField();
                        GetSalesPerson();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup",
                            "swal('Oops...','Sales person info already Exists!','error');", true);
                    }
                }
            }
            else
            {
                bool message = _fev.SalesPersonUpdate(Convert.ToInt32(Session["selesPersonId"].ToString()), txtSalesPersonName.Text.Trim(), txtAddress.Text.Trim(),
                    txtPhoneNo.Text.Trim(), Convert.ToInt32(Session["UserId"]));
                if (message)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup",
                           "swal('Updated','Sales person info Updated succesfully..','success');", true);
                    GetSalesPerson();
                }
                
                ClearTextField();
            }
            
        }
        void ClearTextField()
        {
            txtSalesPersonName.Text = "";
            txtAddress.Text = "";
            txtPhoneNo.Text = "";
        }

        void GetSalesPerson()
        {
            GridSalesPersonDetails.DataSource = _fev.get_InformationdataTable("sp_GetSalesPerson");
            GridSalesPersonDetails.DataBind();
        }

        protected void GridSalesPersonDetails_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSalesPersonDetails.DataSource = _fev.get_InformationdataTable("sp_GetSalesPerson");
            GridSalesPersonDetails.PageIndex = e.NewPageIndex;
            //GridProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            GridSalesPersonDetails.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            var salesPersonId = (Label)ro.FindControl("lblSalesPersonId");
            var name = (Label)ro.FindControl("lblSalesPersonName");
            var address = (Label) ro.FindControl("lblSalesPersonAddress");
            var phone = (Label) ro.FindControl("lblSalesPersonPhone");

            txtSalesPersonName.Text = name.Text;
            txtAddress.Text = address.Text;
            txtPhoneNo.Text = phone.Text;
            Session["selesPersonId"] = salesPersonId.Text;
            btnAddPerson.Text = "Update";

        }
    }
}
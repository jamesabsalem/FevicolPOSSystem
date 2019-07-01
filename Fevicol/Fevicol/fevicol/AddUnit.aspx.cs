using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Settings
{
    public partial class AddUnit : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindUnitDetails();
                BindProduct();
                if (Session["Flag"] != null)
                {
                    int messagePrint = (int)Session["Flag"];
                    if (messagePrint == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "swal('" + Session["title"] + "', '" + Session["text"] + "', '" + Session["type"] + "');", true);
                        Session["Flag"] = null;
                        Session["title"] = null;
                        Session["text"] = null;
                        Session["type"] = null;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sweetAlert('" + Session["title"] + "', '" + Session["text"] + "', '" + Session["type"] + "');", true);
                        Session["Flag"] = null;
                        Session["title"] = null;
                        Session["text"] = null;
                        Session["type"] = null;
                    }
                }
            }
        }

        protected void btnAddUnit_OnClick(object sender, EventArgs e)
        {
            if (btnAddUnit.Text=="Save")
            {
                if (!string.IsNullOrEmpty(ddlProduct.SelectedValue) && !string.IsNullOrEmpty(txtUnit.Text))
                {
                    bool checkMessage = _fev.CheckUnit(txtUnit.Text.Trim().ToUpper(), Convert.ToInt32(ddlProduct.SelectedValue));
                    if (!checkMessage)
                    {
                        bool message = _fev.UnitSave(Convert.ToInt32(ddlProduct.SelectedValue),
                            txtUnit.Text.Trim().ToUpper(), Convert.ToInt32(Session["UserId"]));
                        if (message)
                        {
                            Session["Flag"] = 1;
                            Session["title"] = "Added";
                            Session["text"] = "Product unit added succesfully..";
                            Session["type"] = "success";
                            ClearTextField();
                            BindUnitDetails();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }

                    }
                    else
                    {
                        Session["Flag"] = 0;
                        Session["title"] = "Oops...";
                        Session["text"] = "Product unit already Exists!";
                        Session["type"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
            else
            {
                bool message = _fev.UnitUpdate(Convert.ToInt32(Session["unitId"].ToString()), txtUnit.Text.Trim(), Convert.ToInt32(ddlProduct.SelectedValue),
                    Convert.ToInt32(Session["UserId"]));
                if (message)
                {
                    Session["Flag"] = 1;
                    Session["title"] = "Updated";
                    Session["text"] = "Product unit updated succesfully";
                    Session["type"] = "success";
                    BindUnitDetails();
                    btnAddUnit.Text = "Save";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                ClearTextField();
            }
            
        }
        void BindProduct()
        {
            ddlProduct.DataSource = _fev.get_InformationdataTable("sp_GetProductForDropdownlist");
            ddlProduct.DataTextField = "productDescription";
            ddlProduct.DataValueField = "productId";
            ddlProduct.DataBind();
            ddlProduct.Items.Insert(0, new ListItem("Select Product", string.Empty));
        }

        void ClearTextField()
        {
            ddlProduct.SelectedIndex = -1;
            txtUnit.Text = "";
            btnAddUnit.Text = "Save";
        }

        void BindUnitDetails()
        {
            GridUnitDetails.DataSource = _fev.get_InformationdataTable("sp_GetUnitDetails");
            GridUnitDetails.DataBind();
        }

        protected void GridUnitDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridUnitDetails.DataSource = _fev.get_InformationdataTable("sp_GetUnitDetails");
            GridUnitDetails.PageIndex = e.NewPageIndex;
            GridUnitDetails.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            Label lblProductId = (Label)ro.FindControl("lblProductId");
            Label lblUnitId = (Label)ro.FindControl("lblUnitId");
            Label lblunitDescription = (Label)ro.FindControl("lblunitDescription");

            Session["unitId"] = lblUnitId.Text;
            txtUnit.Text = lblunitDescription.Text;
            ddlProduct.SelectedValue = lblProductId.Text.Trim();
            btnAddUnit.Text = "Update";
        }
    }
}
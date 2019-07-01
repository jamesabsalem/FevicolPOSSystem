using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Settings
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProductDetails();
                BindProductGroup();

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

        protected void btnProductAdd_OnClick(object sender, EventArgs e)
        {
            if (btnProductAdd.Text == "Save")
            {
                if (!string.IsNullOrEmpty(ddlProductGroup.SelectedValue) && !string.IsNullOrEmpty(txtProductName.Text))
                {
                    bool checkMessage = _fev.CheckProduct(txtProductName.Text.Trim().ToUpper(),
                        Convert.ToInt32(ddlProductGroup.SelectedValue));
                    if (!checkMessage)
                    {
                        bool message = _fev.ProductSave(Convert.ToInt32(ddlProductGroup.SelectedValue),
                            txtProductName.Text.Trim(), Convert.ToInt32(Session["UserId"]));
                        if (message)
                        {
                            Session["Flag"] = 1;
                            Session["title"] = "Added";
                            Session["text"] = "Product info added succesfully..";
                            Session["type"] = "success";
                            GetProductDetails();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                        ClearTextField();
                    }
                    else
                    {
                        Session["Flag"] = 0;
                        Session["title"] = "Oops...";
                        Session["text"] = "Product info already Exists!";
                        Session["type"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }

            }
            else
            {

                var productUsed = _fev.ProductUsedCheck(Convert.ToInt32(Session["productId"]));
                if (!productUsed)
                {
                    var updateMessage = _fev.ProductUpdate(Convert.ToInt32(Session["productId"]), txtProductName.Text,
                        Convert.ToInt32(ddlProductGroup.SelectedValue), Convert.ToInt32(Session["UserId"]));
                    if (updateMessage)
                    {
                        var title = "Updated";
                        var text = "Product info updated successfully..";
                        var type = "success";
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "swal('" + title + "', '" + text + "', '" + type + "');", true);
                        GetProductDetails();
                        btnProductAdd.Text = "Save";
                        ClearTextField();
                    }
                }
            }

        }

        void GetProductDetails()
        {
            GridProductDetails.DataSource = _fev.get_InformationdataTable("sp_GetProductDetailsForGrid");
            GridProductDetails.DataBind();
        }

        void ClearTextField()
        {
            ddlProductGroup.SelectedIndex = -1;
            txtProductName.Text = "";
        }

        void BindProductGroup()
        {
            ddlProductGroup.DataSource = _fev.get_InformationdataTable("dbo.sp_getProductGroup");
            ddlProductGroup.DataTextField = "groupDescription";
            ddlProductGroup.DataValueField = "groupId";
            ddlProductGroup.DataBind();
            ddlProductGroup.Items.Insert(0, new ListItem("Select Product Group", string.Empty));
            ddlProductGroup.SelectedIndex = 0;
        }

        protected void GridProductDetails_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridProductDetails.PageIndex = e.NewPageIndex;
            GridProductDetails.DataSource = _fev.get_InformationdataTable("sp_GetProductDetailsForGrid");
            GridProductDetails.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            Label productId = (Label)ro.FindControl("lblProductId");
            Label groupId = (Label)ro.FindControl("lblGroupId");
            Label productDescription = (Label)ro.FindControl("lblProductDescription");
            var productUsed = _fev.ProductUsedCheck(Convert.ToInt32(productId.Text));
            if (!productUsed)
            {
                ddlProductGroup.SelectedValue = groupId.Text.Trim();
                txtProductName.Text = productDescription.Text.Trim();
                btnProductAdd.Text = "Update";
                Session["productId"] = productId.Text;
            }
            else
            {
                btnProductAdd.Text = "Save";
                ClearTextField();
                var title = "OOps...";
                var text = "This Product already used in previous invoice.";
                var type = "error";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "swal('" + title + "', '" + text + "', '" + type + "');", true);
            }
        }

        protected void btnClean_OnClick(object sender, EventArgs e)
        {
            btnProductAdd.Text = "Save";
            ClearTextField();
        }
    }
}
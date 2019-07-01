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
    public partial class AddSize : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct();
                GetSizeDetails();
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

        protected void btnAddSize_OnClick(object sender, EventArgs e)
        {
            if (btnAddSize.Text == "Save")
            {
                if (!string.IsNullOrEmpty(ddlProduct.SelectedValue) && !string.IsNullOrEmpty(txtProductSize.Text))
                {

                    bool checkMessage = _fev.CheckSize(txtProductSize.Text.Trim().ToUpper(),
                        Convert.ToInt32(ddlProduct.SelectedValue));
                    if (!checkMessage)
                    {
                        bool message = _fev.SizeSave(Convert.ToInt32(ddlProduct.SelectedValue),
                            txtProductSize.Text.Trim(),
                            Convert.ToInt32(Session["UserId"]));
                        if (message)
                        {
                            Session["Flag"] = 1;
                            Session["title"] = "Added";
                            Session["text"] = "Product size added succesfully..";
                            Session["type"] = "success";
                            GetSizeDetails();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                        ClearTextField();
                    }
                    else
                    {
                        Session["Flag"] = 0;
                        Session["title"] = "Oops...";
                        Session["text"] = "Product size already Exists!";
                        Session["type"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
            else
            {
                bool message = _fev.SizeUpdate(Convert.ToInt32(Session["sizeId"].ToString()), txtProductSize.Text.Trim(), Convert.ToInt32(ddlProduct.SelectedValue),
                     Convert.ToInt32(Session["UserId"]));
                if (message)
                {
                    Session["Flag"] = 1;
                    Session["title"] = "Updated";
                    Session["text"] = "Product size updated succesfully";
                    Session["type"] = "success";
                    GetSizeDetails();
                    btnAddSize.Text = "Save";
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
            txtProductSize.Text = "";
            btnAddSize.Text = "Save";
        }

        void GetSizeDetails()
        {
            GridSizeDetails.DataSource = _fev.get_InformationdataTable("sp_GetSizeDetails");
            GridSizeDetails.DataBind();
        }

        protected void GridSizeDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridSizeDetails.DataSource = _fev.get_InformationdataTable("sp_GetSizeDetails");
            GridSizeDetails.PageIndex = e.NewPageIndex;
            GridSizeDetails.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            Label lblProductId = (Label)ro.FindControl("lblProductId");
            Label lblSizeId = (Label)ro.FindControl("lblSizeId");
            Label lblsizeDescription = (Label)ro.FindControl("lblsizeDescription");

            Session["sizeId"] = lblSizeId.Text;
            txtProductSize.Text = lblsizeDescription.Text;
            ddlProduct.SelectedValue = lblProductId.Text.Trim();
            btnAddSize.Text = "Update";
        }
    }
}
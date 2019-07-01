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
    public partial class AddGroup : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetProductGroup();
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

        protected void btnAddProductGroup_OnClick(object sender, EventArgs e)
        {
            if (btnAddProductGroup.Text=="Save")
            {
                if (!string.IsNullOrEmpty(txtProductGroup.Text.Trim()))
                {
                    bool checkGroup = _fev.CheckGroup(txtProductGroup.Text.Trim().ToUpper());
                    if (!checkGroup)
                    {
                        bool message = _fev.ProductGroupSave(txtProductGroup.Text.Trim().ToUpper(), Convert.ToInt32(Session["UserId"]));
                        if (message)
                        {
                            Session["Flag"] = 1;
                            Session["title"] = "Added";
                            Session["text"] = "Group info added succesfully..";
                            Session["type"] = "success";
                            GetProductGroup();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                        ClearTextField();

                    }
                    else
                    {
                        Session["Flag"] = 0;
                        Session["title"] = "Oops...";
                        Session["text"] = "Group name already Exist!";
                        Session["type"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
            else
            {
                bool message = _fev.GroupUpdate(Convert.ToInt32(Session["groupId"].ToString()), txtProductGroup.Text.Trim(),Convert.ToInt32(Session["UserId"]));
                if (message)
                {
                    Session["Flag"] = 1;
                    Session["title"] = "Updated";
                    Session["text"] = "Group info updated succesfully..";
                    Session["type"] = "success";
                    GetProductGroup();
                    btnAddProductGroup.Text = "Save";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                ClearTextField();
            }
            

        }

        protected void ClearTextField()
        {
            txtProductGroup.Text = "";
            btnAddProductGroup.Text = "Save";
        }

        void GetProductGroup()
        {
            GridProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            GridProductGroup.DataBind();
        }
        protected void GridProductGroup_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            GridProductGroup.PageIndex = e.NewPageIndex;
            //GridProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            GridProductGroup.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            Label lblGroupId = (Label)ro.FindControl("lblGroupId");
            Label lblGroupName = (Label)ro.FindControl("lblGroupName");

            Session["groupId"] = lblGroupId.Text;
            txtProductGroup.Text = lblGroupName.Text;
            btnAddProductGroup.Text = "Update";
        }
    }
}
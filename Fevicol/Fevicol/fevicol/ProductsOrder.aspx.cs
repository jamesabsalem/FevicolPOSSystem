using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Repository;

namespace Fevicol.Orders
{
    public partial class ProductsOrder : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDealer();
                BindInvoiceDetails();
                BindProductGroup();
                BindSalesPerson();
            }
            txtQuantity.Attributes.Add("onkeyup", "javascript:calcval('" + txtQuantity.ClientID + "','" + txtUnitPrice.ClientID + "','" + txtTotalAmount.ClientID + "')");
            txtUnitPrice.Attributes.Add("onkeyup", "javascript:calcval('" + txtQuantity.ClientID + "','" + txtUnitPrice.ClientID + "','" + txtTotalAmount.ClientID + "')");
        }
        void BindDealer()
        {
            ddlDealer.DataSource = _fev.get_InformationdataTable("sp_GetDealer");
            ddlDealer.DataTextField = "dealerName";
            ddlDealer.DataValueField = "dealerId";
            ddlDealer.DataBind();
            ddlDealer.Items.Insert(0, new ListItem("Select Dealer", string.Empty));
            ddlDealer.SelectedIndex = 0;
        }
        void BindSalesPerson()
        {
            ddlSalesPerson.DataSource = _fev.get_InformationdataTable("sp_GetSalesPerson");
            ddlSalesPerson.DataTextField = "salesPersonName";
            ddlSalesPerson.DataValueField = "salesPersonId";
            ddlSalesPerson.DataBind();
            ddlSalesPerson.Items.Insert(0, new ListItem("Select Sales Person", string.Empty));
            ddlSalesPerson.SelectedIndex = 0;
        }
        void BindProduct()
        {
            ddlProducts.DataSource = _fev.get_InformationdataTable("sp_GetProductForOrder " + ddlProductGroup.SelectedValue);
            ddlProducts.DataTextField = "productDescription";
            ddlProducts.DataValueField = "productId";
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, new ListItem("Select Product", string.Empty));
            ddlProducts.SelectedIndex = 0;
        }
        void BindProductGroup()
        {
            ddlProductGroup.DataSource = _fev.get_InformationdataTable("sp_GetProductGroubForOrder");
            ddlProductGroup.DataTextField = "groupDescription";
            ddlProductGroup.DataValueField = "groupId";
            ddlProductGroup.DataBind();
            ddlProductGroup.Items.Insert(0, new ListItem("Select Product Group", string.Empty));
            ddlProductGroup.SelectedIndex = 0;
        }
        void BindSize()
        {
            ddlSize.DataSource = _fev.get_InformationdataTable("sp_GetSizeForOrder " + ddlProducts.SelectedValue);
            ddlSize.DataTextField = "sizeDescription";
            ddlSize.DataValueField = "sizeId";
            ddlSize.DataBind();
            ddlSize.Items.Insert(0, new ListItem("Select Size", string.Empty));
        }
        void BindUnit()
        {
            ddlUnit.DataSource = _fev.get_InformationdataTable("sp_GetUnitForOrder " + ddlProducts.SelectedValue);
            ddlUnit.DataTextField = "unitDescription";
            ddlUnit.DataValueField = "uintId";
            ddlUnit.DataBind();
            ddlUnit.Items.Insert(0, new ListItem("Select Unit", string.Empty));
        }

        //protected void ddlDealer_OnSelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (!string.IsNullOrEmpty(ddlDealer.SelectedValue))
        //    {
        //        BindProduct();
        //    }
        //}
        protected void ddlProducts_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProducts.SelectedValue))
                BindSize();
            BindUnit();
        }
        public void BindGrid(int count, int groupId, string groupName, int productId, string productName, int sizeId, string sizeDes, int unitId, string unitDes, string quantity, string unitPrice, string totalAmount, int personId,string personName)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("groupId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("groupName", typeof(string)));
            dt.Columns.Add(new DataColumn("productId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("productName", typeof(string)));
            dt.Columns.Add(new DataColumn("sizeId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("sizeDes", typeof(string)));
            dt.Columns.Add(new DataColumn("unitId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("unitDes", typeof(string)));
            dt.Columns.Add(new DataColumn("quantity", typeof(Int32)));
            dt.Columns.Add(new DataColumn("unitPrice", typeof(string)));
            dt.Columns.Add(new DataColumn("totalAmount", typeof(string)));
            dt.Columns.Add(new DataColumn("personId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("personName", typeof(string)));
            if (ViewState["CurrentData"] != null)
            {
                for (int i = 0; i < count; i++)
                {
                    dt = (DataTable)ViewState["CurrentData"];
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr[0] = dt.Rows[0][0].ToString();
                    }
                }
                dr = dt.NewRow();
                dr["groupId"] = groupId;
                dr["groupName"] = groupName;
                dr["productId"] = productId;
                dr["productName"] = productName;
                dr["sizeId"] = sizeId;
                dr["sizeDes"] = sizeDes;
                dr["unitId"] = unitId;
                dr["unitDes"] = unitDes;
                dr["quantity"] = quantity;
                dr["unitPrice"] = unitPrice;
                dr["totalAmount"] = totalAmount;
                dr["personId"] = personId;
                dr["personName"] = personName;
                dt.Rows.Add(dr);
            }
            else
            {
                dr = dt.NewRow();
                dr["groupId"] = groupId;
                dr["groupName"] = groupName;
                dr["productId"] = productId;
                dr["productName"] = productName;
                dr["sizeId"] = sizeId;
                dr["sizeDes"] = sizeDes;
                dr["unitId"] = unitId;
                dr["unitDes"] = unitDes;
                dr["quantity"] = quantity;
                dr["unitPrice"] = unitPrice;
                dr["totalAmount"] = totalAmount;
                dr["personId"] = personId;
                dr["personName"] = personName;
                dt.Rows.Add(dr);
            }
            if (ViewState["CurrentData"] != null)
            {
                GridItemDetais.DataSource = ViewState["CurrentData"];
                GridItemDetais.DataBind();
            }
            else
            {
                GridItemDetais.DataSource = dt;
                GridItemDetais.DataBind();
            }
            ViewState["CurrentData"] = dt;
        }
        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            string str = txtTotalAmount.Text;
            DataTable dtbmf = (DataTable)ViewState["CurrentData"];
            if (Session["EditRow"] != null)
            {
                int rno = int.Parse(Session["EditRow"].ToString());
                dtbmf.Rows.RemoveAt(rno);
                Session["EditRow"] = null;
            }
            DataTable dt = (DataTable)ViewState["CurrentData"];
            int cont = 1;
            int existrow = 0;
            if (ViewState["CurrentData"] != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string groupId = dt.Rows[i]["groupId"].ToString();
                        string productId = dt.Rows[i]["productId"].ToString();
                        string sizeId = dt.Rows[i]["sizeId"].ToString();
                        string unitId = dt.Rows[i]["unitId"].ToString();

                        if (groupId == ddlProductGroup.SelectedValue && productId == ddlProducts.SelectedValue && sizeId == ddlSize.SelectedValue && unitId == ddlUnit.SelectedValue)
                        {
                            existrow = 1;
                            GridItemDetais.Rows[i].BackColor = System.Drawing.Color.Red;
                            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Already Added Same Item');", true);
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                    }
                }
            }
            if (existrow < 1)
            {
                if (Convert.ToDecimal(txtQuantity.Text) > 0)
                {
                    BindGrid(cont, int.Parse(ddlProductGroup.SelectedValue), ddlProductGroup.SelectedItem.ToString(), int.Parse(ddlProducts.SelectedValue), ddlProducts.SelectedItem.ToString(), int.Parse(ddlSize.SelectedValue), ddlSize.SelectedItem.ToString(), int.Parse(ddlUnit.SelectedValue), ddlUnit.SelectedItem.ToString(), txtQuantity.Text.Trim(), txtUnitPrice.Text.Trim(), txtTotalAmount.Text.Trim(),int.Parse(ddlSalesPerson.SelectedValue),ddlSalesPerson.SelectedItem.ToString());
                    Clear();
                    ddlDealer.Enabled = false;
                }
            }

        }
        void Clear()
        {
            ddlDealer.SelectedIndex = -1;
            ddlProductGroup.SelectedIndex = -1;
            ddlProducts.SelectedIndex = -1;
            ddlSize.SelectedIndex = -1;
            ddlUnit.SelectedIndex = -1;
            txtQuantity.Text = "";
            txtUnitPrice.Text = "";
            txtTotalAmount.Text = "";
            ddlSalesPerson.SelectedIndex = -1;
        }
        void AllClear()
        {
            ddlDealer.SelectedIndex = -1;
            ddlProductGroup.SelectedIndex = -1;
            ddlProducts.SelectedIndex = -1;
            ddlSize.SelectedIndex = -1;
            ddlUnit.SelectedIndex = -1;
            txtQuantity.Text = "";
            txtUnitPrice.Text = "";
            txtTotalAmount.Text = "";
            ddlDealer.Enabled = true;
            ddlSalesPerson.SelectedIndex = -1;
            ddlUnit.Items.Clear();
            GridItemDetais.DataSource = null;
            GridItemDetais.DataBind();
        }
        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (GridItemDetais.Rows.Count > 0)
            {
                //DataTable tdInvoce = _fev.get_InformationdataTable("sp_GetInvoiceParameter");
                //string invoiceNo = tdInvoce.Rows[0]["invoiceNo"].ToString();
                //int invoice = Convert.ToInt32(invoiceNo)+1;
                bool message = false;
                string invoiceNo = _fev.OrderHeaderSave(Convert.ToInt32(ddlDealer.SelectedValue), Convert.ToDecimal(lblTotalValue.Text.Trim()),
                    Convert.ToInt32(Session["UserId"].ToString()));
                for (int i = 0; i < GridItemDetais.Rows.Count; i++)
                {
                    Label lblGroupId = (Label)GridItemDetais.Rows[i].FindControl("lblGroupId");
                    Label lblProductId = (Label)GridItemDetais.Rows[i].FindControl("lblProductId");
                    Label lblSizeId = (Label)GridItemDetais.Rows[i].FindControl("lblSizeId");
                    Label lblUnitId = (Label)GridItemDetais.Rows[i].FindControl("lblUnitId");
                    Label lblQuantity = (Label)GridItemDetais.Rows[i].FindControl("lblQuantity");
                    Label lblUnitPrice = (Label)GridItemDetais.Rows[i].FindControl("lblUnitPrice");
                    Label personId = (Label)GridItemDetais.Rows[i].FindControl("lblPerson");
                    message = _fev.InvoiceDetailsSave(Convert.ToInt32(invoiceNo), Convert.ToInt32(lblQuantity.Text.Trim()),
                        Convert.ToInt32(lblUnitPrice.Text.Trim()), Convert.ToInt32(lblGroupId.Text.Trim()), Convert.ToInt32(lblProductId.Text.Trim()),
                        Convert.ToInt32(lblSizeId.Text.Trim()), Convert.ToInt32(lblUnitId.Text.Trim()),
                        Convert.ToInt32(Session["UserId"].ToString()),Convert.ToInt32(personId.Text));
                }
                if (message)
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Save Successfully');", true);
                    GridItemDetais.DataSource = "";
                    GridItemDetais.DataBind();
                    BindInvoiceDetails();
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
        decimal _totalval = 0;
        protected void GridItemDetais_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Attributes.Add("style", "text-align:center");
                Label lblValue = (Label)e.Row.FindControl("lblTotalAmount");
                _totalval = _totalval + decimal.Parse(lblValue.Text);
            }
            GridItemDetais.Columns[8].FooterText = _totalval.ToString();
            lblTotalValue.Text = _totalval.ToString();
        }

        void BindInvoiceDetails()
        {
            GridInvoiceDetails.DataSource = _fev.get_InformationdataTable("sp_GetInvoiceDetails");
            GridInvoiceDetails.DataBind();
        }


        protected void lnkBtnReport_OnClick(object sender, EventArgs e)
        {
            ASPxGridView grid = (ASPxGridView)sender;
            //string keyValue = grid.GetRowValues(e.VisibleIndex, "EmployeeID").ToString();

            //GridViewRow grdRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            LinkButton lnkBtnReport = grid.FindControl("lnkBtnReport") as LinkButton;
            Session["InvoiceNo"] = lnkBtnReport.Text;
            Session["Param"] = "Invoice";
            runjQueryCode("window.open('OrderReport.aspx','popup','location=1,status=1,left=0,top=0,scrollbars=1,width=970,height=600')");
        }
        private void runjQueryCode(string jsCodetoRun)
        {
            ScriptManager requestSM = ScriptManager.GetCurrent(this);
            if (requestSM != null && requestSM.IsInAsyncPostBack)
            {
                ScriptManager.RegisterClientScriptBlock(this,
                                                        typeof(Page),
                                                        Guid.NewGuid().ToString(),
                                                        getjQueryCode(jsCodetoRun),
                                                        true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(typeof(Page),
                                                       Guid.NewGuid().ToString(),
                                                       getjQueryCode(jsCodetoRun),
                                                       true);
            }
        }
        private string getjQueryCode(string jsCodetoRun)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.AppendLine("$(document).ready(function() {");
            sb.AppendLine(jsCodetoRun);
            sb.AppendLine(" });");
            return sb.ToString();
        }

        protected void ddlProductGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProductGroup.SelectedValue))
            {
                BindProduct();
            }
        }

        protected void btnClear_OnClick(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnAllClear_OnClick(object sender, EventArgs e)
        {
            AllClear();
        }
        
      
        //Edit By Lintu - 04-08-2017
        protected void txtQuantity_OnTextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtQuantity.Text.Trim()))
            {
                string balanceQty = null;
                if (!string.IsNullOrEmpty(ddlProducts.SelectedValue.Trim()) &&
                    !string.IsNullOrEmpty(ddlSize.SelectedValue.Trim()) &&
                    !string.IsNullOrEmpty(ddlUnit.SelectedValue.Trim()) &&
                    !string.IsNullOrEmpty(ddlProductGroup.SelectedValue.Trim()))
                {
                    balanceQty = _fev.OrderQtyCheck(Convert.ToInt32(ddlProducts.SelectedValue.Trim()), Convert.ToInt32(ddlSize.SelectedValue.Trim()),
                       Convert.ToInt32(ddlUnit.SelectedValue.Trim()), Convert.ToInt32(ddlProductGroup.SelectedValue.Trim()));
                }
                if (Convert.ToDecimal(balanceQty) < Convert.ToDecimal(txtQuantity.Text.Trim()))
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Order Qty is grater than balance Qty');", true);
                    txtQuantity.Text = null;
                }
            }
        }
        //Edit By Lintu - 04-08-2017
    }
}
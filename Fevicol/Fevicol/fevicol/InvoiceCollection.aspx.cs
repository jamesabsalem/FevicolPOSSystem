using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Orders
{
    public partial class InvoiceCollection : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetInvoiceCollectionDetails();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtInvoiceNumber.Text) && !string.IsNullOrEmpty(txtInvoiceCollection.Text))
            {
                bool checkMessage = _fev.CheckInvoice(Convert.ToInt32(txtInvoiceNumber.Text.Trim()));
                if (checkMessage)
                {
                    bool message = _fev.CollectionSave(Convert.ToInt32(txtInvoiceNumber.Text.Trim()),Convert.ToDecimal(txtInvoiceCollection.Text.Trim()),
                        Convert.ToInt32(Session["UserId"]));
                    if (message)
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox",
                            "alert('Save Successfully');", true);
                        GetInvoiceCollectionDetails();
                    }
                    ClearTextField();
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox",
                          "alert('Unsufficient Balance');", true);
                }

            }
        }
        void ClearTextField()
        {
            txtInvoiceNumber.Text ="";
            txtInvoiceCollection.Text = "";
            txtDueAmount.Text = null;
        }

        void GetInvoiceCollectionDetails()
        {
            GridInvoiceCollection.DataSource = _fev.get_InformationdataTable("sp_GetInvoiceCollection");
            GridInvoiceCollection.DataBind();
        }

        protected void txtInvoiceNumber_OnTextChanged(object sender, EventArgs e)
        {
            DataTable dt =
                _fev.get_InformationdataTable("sp_GetInvoiceWiseAmount " + Convert.ToInt32(txtInvoiceNumber.Text.Trim()));
            if (dt.Rows.Count > 0)
            {
                txtDueAmount.Text = dt.Rows[0]["invBalanceAmount"].ToString();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox",
                    "alert('Invalid Invoice Number');", true);
            }
        }
    }
}
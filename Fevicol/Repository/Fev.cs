using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Repository
{
    public class Fev
    {
        private readonly SqlConnection _con = GetWay.FeviCon;
        public DataTable get_InformationdataTable(string sqlstatement)
        {
            DataTable dt = new DataTable();
            using (SqlDataAdapter cmd = new SqlDataAdapter(sqlstatement, _con))
            {
                if (_con.State == ConnectionState.Open)
                {
                    cmd.Fill(dt);
                    _con.Close();
                }
                else
                {
                    _con.Open();
                    cmd.Fill(dt);
                    _con.Close();
                }

            }
            return dt;
        }
        public DataSet get_Informationdataset(string sqlstatement)
        {
            using (SqlDataAdapter cmd = new SqlDataAdapter(sqlstatement, _con))
            {
                //if (_con.State == ConnectionState.Closed || _con.State == ConnectionState.Broken)
                //{
                //    _con.Open();
                //}
                //DataSet ds = new DataSet();
                //cmd.Fill(ds);
                //if (_con.State == ConnectionState.Open)
                //{
                //    _con.Close();
                //}
                DataSet ds = new DataSet();
                if (_con.State == ConnectionState.Open)
                {
                    cmd.Fill(ds);
                    _con.Close();
                }
                else
                {
                    _con.Open(); cmd.Fill(ds);
                    _con.Close();
                }
                return ds;
            }

        }
        public bool DealerSave(string dealerName, string dealerAddress, string dealerPhone, int dealerCreateBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_SaveDealer", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dealerName", dealerName.ToUpper());
                cmd.Parameters.AddWithValue("@dealerAddress", dealerAddress);
                cmd.Parameters.AddWithValue("@dealerPhone", dealerPhone);
                cmd.Parameters.AddWithValue("@dealerCreatedBy", dealerCreateBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool ProductSave(int productGroupId, string productDescription, int productCreatedBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_ProductSave", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productGroupId", productGroupId);
                cmd.Parameters.AddWithValue("@ProductDescription", productDescription.ToUpper());
                cmd.Parameters.AddWithValue("@ProductCreatedBy", productCreatedBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open(); if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool SizeSave(int productId, string sizeDescription, int sizeCreatedBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_SaveSize", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productId", productId);
                cmd.Parameters.AddWithValue("@sizeDescription", sizeDescription.ToUpper());
                cmd.Parameters.AddWithValue("@sizeCreatedBy", sizeCreatedBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool UnitSave(int productId, string unitDescription, int unitCreatedBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_SaveUnit", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productId", productId);
                cmd.Parameters.AddWithValue("@unitDescription", unitDescription.ToUpper());
                cmd.Parameters.AddWithValue("@unitCreatedBy", unitCreatedBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool InvoiceDetailsSave(int invoiceNo, int invQty, int invUprice, int invProductGroupId, int invProductId, int invSizeId, int invUnitId, int invCreatedBy, int invSalesPerson)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_InvoiceDetailsSave", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InvoiceNO", invoiceNo);
                cmd.Parameters.AddWithValue("@InvQty", invQty);
                cmd.Parameters.AddWithValue("@InvUprice", invUprice);
                cmd.Parameters.AddWithValue("@InvProductId", invProductId);
                cmd.Parameters.AddWithValue("@InvSizeId", invSizeId);
                cmd.Parameters.AddWithValue("@InvUnitId", invUnitId);
                cmd.Parameters.AddWithValue("@InvCreatedBy", invCreatedBy);
                cmd.Parameters.AddWithValue("@productGroupid", invProductGroupId);
                cmd.Parameters.AddWithValue("@Personid", invSalesPerson);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }


        public bool UpdateParameter(int invoiceNo)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_UpdateParameters", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InvoiceNo", invoiceNo);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool ProductGroupSave(string productGroupDes, int productGroupCreateBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_ProductGroupSave", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productGroupDes", productGroupDes.ToUpper());
                cmd.Parameters.AddWithValue("@productGroupCreatedBy", productGroupCreateBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CheckDealer(string dealerName)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckDealer", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dealerName", dealerName);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CheckGroup(string groupName)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckGroup", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@groupName", groupName);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CheckProduct(string productDescription, int productGroupId)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckProduct", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productDescription", productDescription);
                cmd.Parameters.AddWithValue("@productGroupId", productGroupId);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CheckSize(string sizeDescription, int productId)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckSize", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sizeDescription", sizeDescription);
                cmd.Parameters.AddWithValue("@productId", productId);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CheckUnit(string unitDes, int productId)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckUnit", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@unitDes", unitDes);
                cmd.Parameters.AddWithValue("@productId", productId);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        //public void AlertMessage()
        //{
        //    System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Save Successfully');", true);
        //}
        public string ProductReceiveSave(string invoiceNo, decimal invAmount, int invCreatedBy)
        {
            string invReceiveHeaderid = "";
            using (SqlCommand cmd = new SqlCommand("sp_ReceiveInvoiceHeaderSave", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@invoicNo", invoiceNo);
                cmd.Parameters.AddWithValue("@invoicTotalAmount", invAmount);
                cmd.Parameters.AddWithValue("@invoiceReceveBy", invCreatedBy);

                SqlParameter outputParameter = new SqlParameter();
                outputParameter.ParameterName = "@GoodsRecevieHeaderId";
                outputParameter.SqlDbType = System.Data.SqlDbType.Int;
                outputParameter.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(outputParameter);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    invReceiveHeaderid = outputParameter.Value.ToString();
                }
                _con.Close();
            }
            return invReceiveHeaderid;
        }
        public bool GoodsReceiveDetailsSave(int grHeaderId, int proGroupid, int productId, int sizeId, int unitId, int quantity, decimal unitPrice, int createdBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_GoodsReceiveDetailsSave", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@grHeaderId", grHeaderId);
                cmd.Parameters.AddWithValue("@productGroupId", proGroupid);
                cmd.Parameters.AddWithValue("@productId", productId);
                cmd.Parameters.AddWithValue("@productSizeId", sizeId);
                cmd.Parameters.AddWithValue("@UnitId", unitId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@UnitPrice", unitPrice);
                cmd.Parameters.AddWithValue("@CreatedBy", createdBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public string OrderHeaderSave(int invDealerId, decimal invAmount, int invCreatedBy)
        {
            string orderHeaderid = "";
            using (SqlCommand cmd = new SqlCommand("sp_SaveInvoiceHeader", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InvTotaAmount", invAmount);
                cmd.Parameters.AddWithValue("@InvCreatedBy", invCreatedBy);
                cmd.Parameters.AddWithValue("@InvDealer", invDealerId);

                SqlParameter outputParameter = new SqlParameter();
                outputParameter.ParameterName = "@InvoiceNo";
                outputParameter.SqlDbType = System.Data.SqlDbType.Int; outputParameter.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(outputParameter);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    orderHeaderid = outputParameter.Value.ToString();
                }
                _con.Close();
            }
            return orderHeaderid;
        }

        public bool ProductUsedCheck(int productId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_ProductUsedCheck", _con);
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                message = true;
            }
            _con.Close();
            return message;
        }


        public bool ProductUpdate(int productId, string productDescription, int productGroupId, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_ProductUpdate", _con);
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.Parameters.AddWithValue("@productDescription", productDescription);
            cmd.Parameters.AddWithValue("@productGroupId", productGroupId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }

        public bool GroupUpdate(int groupId, string name, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_GroupUpdate", _con);
            cmd.Parameters.AddWithValue("@groupId", groupId);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }
        public bool DealerUpdate(int dealerId, string name, string address, string phone, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_DealerUpdate", _con);
            cmd.Parameters.AddWithValue("@dealerId", dealerId);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }


        public bool SizeUpdate(int sizeId, string sizeDescription, int sizeProductId, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_SizeUpdate", _con);
            cmd.Parameters.AddWithValue("@sizeId", sizeId);
            cmd.Parameters.AddWithValue("@sizeDescription", sizeDescription);
            cmd.Parameters.AddWithValue("@sizeProductId", sizeProductId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }

        public bool UnitUpdate(int unitId, string unitDescription, int unitProductId, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_UnitUpdate", _con);
            cmd.Parameters.AddWithValue("@unitId", unitId);
            cmd.Parameters.AddWithValue("@unitDescription", unitDescription);
            cmd.Parameters.AddWithValue("@unitProductId", unitProductId);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }
        //public bool SalesPersonUpdate(int salesPersonId, string name, string address, string phone, int userId)
        //{
        //    var message = false;
        //    SqlCommand cmd = new SqlCommand("sp_SalesPersonUpdate", _con);
        //    cmd.Parameters.AddWithValue("@salerId", salesPersonId);
        //    cmd.Parameters.AddWithValue("@name", name);
        //    cmd.Parameters.AddWithValue("@address", address);
        //    cmd.Parameters.AddWithValue("@phone", phone);
        //    cmd.Parameters.AddWithValue("@userId", userId);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    _con.Open();
        //    var rowAffected = cmd.ExecuteNonQuery();
        //    if (rowAffected > 0)
        //    {
        //        message = true;
        //    }
        //    _con.Close();
        //    return message;
        //}
        public bool CheckSalesPerson(string salesPersonName, string phone)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckSalesPerson", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@salesPersonName", salesPersonName);
                cmd.Parameters.AddWithValue("@phone", phone);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }


        public bool SalesPersonUpdate(int salesPersonId, string name, string address, string phone, int userId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_SalesPersonUpdate", _con);
            cmd.Parameters.AddWithValue("@salerId", salesPersonId);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }


        public bool SalesPersonSave(string name, string phone, string address, int createBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_SaveSalesPerson", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@salesPersonName", name);
                cmd.Parameters.AddWithValue("@salesPersonPhone", phone);
                cmd.Parameters.AddWithValue("@salesPersonAddress", address);
                cmd.Parameters.AddWithValue("@salesPersonCreateBy", createBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool ProductDelete(int productId)
        {
            var message = false;
            SqlCommand cmd = new SqlCommand("sp_ProductDelete", _con);
            cmd.Parameters.AddWithValue("@productId", productId);
            cmd.CommandType = CommandType.StoredProcedure;
            _con.Open();
            var rowAffected = cmd.ExecuteNonQuery();
            if (rowAffected > 0)
            {
                message = true;
            }
            _con.Close();
            return message;
        }
        //public bool InvoiceHeaderSave(int invoiceNo, decimal invAmount, int invCreatedBy,int invDealerId)
        //{
        //    bool message = false;
        //    using (SqlCommand cmd = new SqlCommand("sp_SaveInvoiceHeader", _con))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@InvoiceNo", invoiceNo);
        //        cmd.Parameters.AddWithValue("@InvTotaAmount", invAmount);
        //        cmd.Parameters.AddWithValue("@InvCreatedBy", invCreatedBy);
        //        cmd.Parameters.AddWithValue("@InvDealer", invDealerId);
        //        if (_con.State == ConnectionState.Open)
        //        {
        //            _con.Close();
        //        }
        //        _con.Open();
        //        if (cmd.ExecuteNonQuery() > 0)
        //        {
        //            message = true;
        //        }
        //    }
        //    return message;
        //}

        //***********************************************************************************
        public bool CheckInvoice(int invoiceNo)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_CheckInvoiceNo", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@invoiceNo", invoiceNo);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        public bool CollectionSave(int invoiceNo, decimal collectionAmount, int createdBy)
        {
            bool message = false;
            using (SqlCommand cmd = new SqlCommand("sp_SaveCollection", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@invoiceNo", invoiceNo);
                cmd.Parameters.AddWithValue("@colAmount", collectionAmount);
                cmd.Parameters.AddWithValue("@createdBy", createdBy);
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    message = true;
                }
                _con.Close();
            }
            return message;
        }
        //public bool SalesPersonSave(string name, string phone, string address, int createBy)
        //{
        //    bool message = false;
        //    using (SqlCommand cmd = new SqlCommand("sp_SaveSalesPerson", _con))
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@salesPersonName", name);
        //        cmd.Parameters.AddWithValue("@salesPersonPhone", phone);
        //        cmd.Parameters.AddWithValue("@salesPersonAddress", address);
        //        cmd.Parameters.AddWithValue("@salesPersonCreateBy", createBy);
        //        if (_con.State == ConnectionState.Open)
        //        {
        //            _con.Close();
        //        }
        //        _con.Open();
        //        if (cmd.ExecuteNonQuery() > 0)
        //        {
        //            message = true;
        //        }
        //        _con.Close();
        //    }
        //    return message;
        //}
            // Edited By Lintu - 04-08-2017
        public string OrderQtyCheck(int invProductGroupId, int invProductId, int invSizeId, int invUnitId)
        {

            string balanceQty=null;
            using (SqlCommand cmd = new SqlCommand("sp_productOrderBalanceQtyCheck", _con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@InvProductId", invProductId);
                cmd.Parameters.AddWithValue("@InvSizeId", invSizeId);
                cmd.Parameters.AddWithValue("@InvUnitId", invUnitId);
                cmd.Parameters.AddWithValue("@productGroupid", invProductGroupId);

               
                if (_con.State == ConnectionState.Open)
                {
                    _con.Close();
                }
                _con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    balanceQty = rdr["itemBalanceQty"].ToString();
                }_con.Close();
            }
            return balanceQty;}
        // Edited By Lintu - 04-08-2017
    }
}
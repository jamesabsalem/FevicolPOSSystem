using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    class GetWay
    {
        private static SqlConnection _conFevi = null;
        public static SqlConnection FeviCon
        {
            get
            {
                if (_conFevi == null)
                {
                    _conFevi = new SqlConnection(String.Format(@"Data Source=LIN2\LIN2;Initial Catalog=Fevicol;Persist Security Info=True;User ID=sa;Password=12345"));
                }
                return _conFevi;
            }
        }
    }
}
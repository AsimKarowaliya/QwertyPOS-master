using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace QwertyPOS
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                if (Session["USERNAME"] != null)
                {

                    SqlCommand cmd = new SqlCommand("SELECT ID_Number, FirstName FROM Users WHERE ID_Number = " + Session["USERNAME"].ToString() + "", con);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    lblSuccess.Text ="Welcome " +  reader["FirstName"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }


        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using(SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE ID_Number = '" + UserName.Text + "' AND passsword = '"+Password.Text+"'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    string usertype = dt.Rows[0][6].ToString().Trim();
                    if(usertype == "U")
                    {
                    Session["USERNAME"] = UserName.Text;
                    Response.Redirect("Default.aspx");
                    } else if(usertype == "A")
                    {
                        Session["USERNAME"] = UserName.Text;
                        Response.Redirect("Admin.aspx");
                    }
                    
                }
                else
                {
                    lblError.Text = "Invalid Username or Passowrd";
                }


            }
        }
    }
}
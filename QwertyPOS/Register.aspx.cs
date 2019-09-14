using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace QwertyPOS
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignup_Click1(object sender, EventArgs e)
        {
            if (tbID.Text != "" && tbFirstName.Text != "" && tbLastName.Text != "" && tbPhoneNum.Text != "" && tbPassword.Text != "" && tbConfirmPass.Text != "")
            {
                if (tbPassword.Text == tbConfirmPass.Text)
                {
                    string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO Users(ID_Number, FirstName, LastName, PhoneNumber, passsword, UserType) values('" + tbID.Text + "', '" + tbFirstName.Text + "', '" + tbLastName.Text + "', '" + tbPhoneNum.Text + "', '" + tbPassword.Text + "', 'U')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Registeration Successfull";
                        lblMsg.ForeColor = Color.Green;
                        Response.Redirect("Login.aspx");
                    }

                }

                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Password do not match";
                }
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "All fields are mandotary";
            }
        }
    }
}
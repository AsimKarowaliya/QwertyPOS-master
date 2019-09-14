using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QwertyPOS
{
    public partial class Report2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                if (txtDate.Text != null && txtDate2.Text != null)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * From LowQuantityLog", con);
                    
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    sda.Fill(dt);

                    if (dt.Rows.Count != 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    else
                    {

                    }


                }

                con.Close();

            }
        }
    }
}
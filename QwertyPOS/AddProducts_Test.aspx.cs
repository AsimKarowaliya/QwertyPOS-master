using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QwertyPOS
{
    public partial class AddProducts_Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindGender();
             
            }

            
        }

       

        private void BindGender()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {
                
                SqlCommand cmd2 = new SqlCommand("SELECT * FROM Gender", con1);
                con1.Open();
                
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            
                DataTable dt2 = new DataTable();
               
                sda2.Fill(dt2);
                if (dt2.Rows.Count != 0)
                {
                    ddlGnder.DataSource = dt2;
                    ddlGnder.DataTextField = "GenderName";

                    ddlGnder.DataValueField = "Gender_ID";
                    ddlGnder.DataBind();
                    ddlGnder.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }

        private void BindBrand()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Product", con);
               
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                
                DataTable dt = new DataTable();
               
                sda.Fill(dt);
             
                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Brand";
                    ddlBrand.DataValueField = "Product_ID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("--Select--", "0"));
                }

                
            }


        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddlModel.Text != "" && ddlQuantity.Text != "" && ddlSize.Text != "" && ddlPrice.Text != "" && ddlGnder.Text !="")
            {

                string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    int quantity = int.Parse(ddlQuantity.Text);
                    SqlCommand cmd = new SqlCommand("INSERT INTO Product_Details(Product_ID,Gender_ID,Model,Size,Price,Quantity) values('"+ddlBrand.SelectedItem.Value+"','"+ddlGnder.SelectedItem.Value+"','"+ddlModel.Text+"','"+(ddlSize.Text)+"','"+(ddlPrice.Text)+"','"+quantity+"')",con);
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO Inventory(Quantity) values('" + quantity + "')", con);
                 
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
               
                    ddlModel.Text = string.Empty;
                    
                    ddlGnder.ClearSelection();
                    ddlBrand.ClearSelection();
                    ddlBrand.Items.FindByValue("0").Selected = true;
                    ddlGnder.Items.FindByValue("0").Selected = true;
                }

                
               
               
            }
        }
    }
}
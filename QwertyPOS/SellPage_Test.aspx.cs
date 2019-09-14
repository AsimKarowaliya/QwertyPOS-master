using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace QwertyPOS
{

    public partial class SellPage_Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindModel();

            }
        }

        private void BindBrand()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {

                SqlCommand cmd2 = new SqlCommand("SELECT * FROM Product", con1);
                con1.Open();

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);

                DataTable dt2 = new DataTable();

                sda2.Fill(dt2);
                if (dt2.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt2;
                    ddlBrand.DataTextField = "Brand";

                    ddlBrand.DataValueField = "Product_ID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }



        private void BindModel()
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {

                SqlCommand cmd2 = new SqlCommand("SELECT distinct(Model) FROM Product_Details", con1);
                con1.Open();

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);

                DataTable dt2 = new DataTable();

                sda2.Fill(dt2);
                if (dt2.Rows.Count != 0)
                {
                    ddlModel.DataSource = dt2;
                    ddlBrand.DataTextField = "Model";

                    ddlModel.DataValueField = "Model";
                    ddlModel.DataBind();
                    ddlModel.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }

        }


        protected void ddlModel_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {

                SqlCommand cmd2 = new SqlCommand("SELECT Size FROM Product_Details WHERE Model='" + ddlModel.SelectedItem.Text + "'", con1);
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM Gender", con1);
                SqlCommand cmd4 = new SqlCommand("SELECT Quantity FROM Product_Details WHERE Model='" + ddlModel.SelectedItem.Text + "'", con1);
                SqlCommand cmd5 = new SqlCommand("SELECT distinct(Price) FROM Product_Details WHERE Model='" + ddlModel.SelectedItem.Text + "'", con1);
                con1.Open();

                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                SqlDataAdapter sda3 = new SqlDataAdapter(cmd3);
                SqlDataAdapter sda4 = new SqlDataAdapter(cmd4);
                SqlDataAdapter sda5 = new SqlDataAdapter(cmd5);
                DataTable dt2 = new DataTable();
                DataTable dt3 = new DataTable();
                DataTable dt4 = new DataTable();
                DataTable dt5 = new DataTable();
                sda2.Fill(dt2);
                sda3.Fill(dt3);
                sda4.Fill(dt4);
                sda5.Fill(dt5);
                if (dt2.Rows.Count != 0)
                {
                    ddlSize.DataSource = dt2;
                    ddlSize.DataTextField = "Size";

                    ddlSize.DataValueField = "Size";
                    ddlSize.DataBind();
                    ddlSize.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlGender.DataSource = dt3;
                    ddlGender.DataTextField = "GenderName";

                    ddlGender.DataValueField = "Gender_ID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("--Select--", "0"));

                  
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            AddItemToList(ddlBrand.SelectedItem.Value, ddlModel.SelectedItem.Text, ddlPrice.SelectedItem.Text, ddlSize.SelectedItem.Text);

            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Product_Details SET Quantity = Quantity-1 WHERE Product_ID ='" + ddlBrand.SelectedItem.Value + "' AND Model='"+ddlModel.SelectedItem.Text+"' AND Size='"+ddlSize.SelectedItem.Text+"' AND Quantity='"+ddlQuantity.SelectedItem.Text+"'", con);
                con.Open();

                cmd.ExecuteNonQuery();


            }

        }

        private void AddItemToList(string Brand, string modelName, string price, string Size)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT distinct Model,Price,Size,Product_ID FROM Product_Details WHERE Model = @modelName AND Price = @price AND Size= @Size AND Product_ID=@Product_ID", con))

                {
                    var BrandParameter = new SqlParameter();
                    BrandParameter.ParameterName = "@Product_ID";
                    BrandParameter.Value = Brand;
                    cmd.Parameters.Add(BrandParameter);

                    var modelParameter = new SqlParameter();
                    modelParameter.ParameterName = "@modelName";
                    modelParameter.Value = modelName;
                    cmd.Parameters.Add(modelParameter);

                  
                    var priceParameter = new SqlParameter();
                    priceParameter.ParameterName = "@price";
                    priceParameter.Value = price;
                    cmd.Parameters.Add(priceParameter);

                    var SizeParameter = new SqlParameter();
                    SizeParameter.ParameterName = "@Size";
                    SizeParameter.Value = Size;
                    cmd.Parameters.Add(SizeParameter);
                    con.Open();

                    using (var sqlReader = cmd.ExecuteReader())
                    {
                        var dataTable = (DataTable)GetDataTable();
                        while (sqlReader.Read())
                        {
                            var dataRow = dataTable.NewRow();
                            //Hear I assume that Product_Details table has Model and Price columns
                            //So that sqlReader["Model"] and sqlReader["Price"] will not have any issue.
                            dataRow["Brand"] = sqlReader["Product_ID"];
                            dataRow["Model"] = sqlReader["Model"];
                            
                            dataRow["Price"] = sqlReader["Price"];
                            dataRow["Size"] = sqlReader["Size"];
                            dataTable.Rows.Add(dataRow);
                        }

                        SaveDataTable(dataTable);
                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                }
            }
        }

        private object GetDataTable()
        {
            DataTable dt = ViewState["SelectedModels"] as DataTable;

            if (dt == null)
            {
                dt = new DataTable();
                dt.TableName = "ColorData";
                dt.Columns.Add(new DataColumn("Brand", typeof(string)));
                dt.Columns.Add(new DataColumn("Model", typeof(string)));
                
                dt.Columns.Add(new DataColumn("Price", typeof(string)));
                dt.Columns.Add(new DataColumn("Size", typeof(string)));
                ViewState["SelectedModels"] = dt;
            }
            return dt;
        }
        private void SaveDataTable(DataTable dataTable)
        {
            ViewState["SelectedModels"] = dataTable;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow rw in GridView1.Rows)
            {
                string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {


                    SqlCommand cmd = new SqlCommand("INSERT INTO Transactions(Product_ID,Sold,Price) values('" + rw.Cells[0].Text + "','" + Convert.ToString(rw.Cells[1].Text) + "','" + rw.Cells[2].Text + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }

        
            ddlBrand.ClearSelection();
            ddlGender.ClearSelection();
            ddlModel.ClearSelection();
            ddlPrice.ClearSelection();
            ddlSize.ClearSelection();
            ddlQuantity.ClearSelection();
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        private void calculateSum()
        {
            double total = 0;
            double tax = 0.0825;
            double convert;
            double round;
            foreach (GridViewRow row in GridView1.Rows)
            {
                convert = Convert.ToDouble(row.Cells[2].Text) * tax;
                round = total + ((Convert.ToDouble(row.Cells[2].Text)) + convert);
                total = Math.Round(round, 2, MidpointRounding.AwayFromZero);


            }
            GridView1.FooterRow.Cells[2].Text = "Total:$";
            GridView1.FooterRow.Cells[3].Text = total.ToString();
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["SelectedModels"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["SelectedModels"] = dt;
            BindGrid();
        }

        private void BindGrid()
        {

            GridView1.DataSource = ViewState["SelectedModels"] as DataTable;
            GridView1.DataBind();

        }

        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["POS_SystemConnectionString2"].ConnectionString;
            using (SqlConnection con1 = new SqlConnection(CS))
            {

                
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM Gender", con1);
                SqlCommand cmd4 = new SqlCommand("SELECT distinct(Quantity) FROM Product_Details WHERE Size='" + ddlSize.SelectedItem.Value + "' AND Model='"+ddlModel.SelectedItem.Text+"'", con1);
                SqlCommand cmd5 = new SqlCommand("SELECT distinct(Price) FROM Product_Details WHERE Model='" + ddlModel.SelectedItem.Text + "'", con1);
                con1.Open();

                
                SqlDataAdapter sda3 = new SqlDataAdapter(cmd3);
                SqlDataAdapter sda4 = new SqlDataAdapter(cmd4);
                SqlDataAdapter sda5 = new SqlDataAdapter(cmd5);
               
                DataTable dt3 = new DataTable();
                DataTable dt4 = new DataTable();
                DataTable dt5 = new DataTable();
               
                sda3.Fill(dt3);
                sda4.Fill(dt4);
                sda5.Fill(dt5);
                if (dt3.Rows.Count != 0)
                {
                    


                    ddlQuantity.DataSource = dt4;
                    ddlQuantity.DataTextField = "Quantity";
                    ddlQuantity.DataValueField = "Quantity";
                    ddlQuantity.DataBind();
                    ddlQuantity.Items.Insert(0, new ListItem("--Select--", "0"));

                    ddlPrice.DataSource = dt5;
                    ddlPrice.DataTextField = "Price";

                    ddlPrice.DataValueField = "Price";
                    ddlPrice.DataBind();
                    ddlPrice.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }
    }
}
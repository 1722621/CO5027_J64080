using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace CO5027.Admin
{
    public partial class AdminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static String CS = ConfigurationManager.ConnectionStrings["IdentityConnectionString"].ConnectionString;
        protected void add_Click(object sender, EventArgs e)
        {
            if (ProductName.Text != "" & ProductPrice.Text != "" && ProductBrand.Text != "" && ProductDescription.Text != "" && ProductDetails.Text != "" && ProductQty.Text != "")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("InsertProducts", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductName", ProductName.Text);
                    cmd.Parameters.AddWithValue("@ProductPrice", ProductPrice.Text);
                    cmd.Parameters.AddWithValue("@ProductBrand", ProductBrand.Text);
                    cmd.Parameters.AddWithValue("@ProductDescription", ProductDescription.Text);
                    cmd.Parameters.AddWithValue("@ProductDetails", ProductDetails.Text);
                    cmd.Parameters.AddWithValue("@ProductQty", ProductQty.Text);
                    con.Open();
                    Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                }
            }
            else
            {
                LblMessage.Text = "*All Fields are mandatory";
                LblMessage.ForeColor = Color.Red;
            }
            LblSuccess.Text = "Products Added Successfully!";
            LblMessage.ForeColor = Color.Green;
        }

        protected void lbInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["ProductName"].DefaultValue
                = ((TextBox)GridView1.FooterRow.FindControl("txtname")).Text;

            SqlDataSource1.InsertParameters["ProductPrice"].DefaultValue
              = ((TextBox)GridView1.FooterRow.FindControl("txtPrice")).Text;

            SqlDataSource1.InsertParameters["ProductBrand"].DefaultValue
              = ((TextBox)GridView1.FooterRow.FindControl("txtBrand")).Text;

            SqlDataSource1.InsertParameters["ProductDescription"].DefaultValue
              = ((TextBox)GridView1.FooterRow.FindControl("txtDescription")).Text;

            SqlDataSource1.InsertParameters["ProductDetails"].DefaultValue
              = ((TextBox)GridView1.FooterRow.FindControl("txtDetails")).Text;

            SqlDataSource1.Insert();
        }
    }
}



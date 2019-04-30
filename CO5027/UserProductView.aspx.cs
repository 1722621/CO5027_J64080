using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

namespace CO5027
{
    public partial class UserProductView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ProductID = Request.QueryString["PID"];
            string filename = ProductID + ".jpg";

            Img.ImageUrl = "~/Productimages/" + filename;



            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductDetails();
                }
            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }

        }

        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            String CS = ConfigurationManager.ConnectionStrings["IdentityConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Products where PID=" + PID + "", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable productTable = new DataTable();
                        sda.Fill(productTable);
                        ProductDetails.DataSource = productTable;
                        ProductDetails.DataBind();
                    }
                }
            }
        }

        protected string GetActiveClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                CookiePID = CookiePID + "," + PID;

                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = CookiePID;
                CartProducts.Expires = DateTime.Now.AddDays(15);
                Response.Cookies.Add(CartProducts);
            }
                else
                {
                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = PID.ToString();
                CartProducts.Expires = DateTime.Now.AddDays(15);
                Response.Cookies.Add(CartProducts);
            }

            Response.Redirect("UserProductView.aspx?PID=" + PID);
        }
        }
    }

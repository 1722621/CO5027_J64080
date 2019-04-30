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
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace CO5027
{
    public partial class Addtocart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartProducts();
            }
        }

        private void BindCartProducts()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    h5NoItems.InnerText = "MY CART (" + CookieDataArray.Length + " Items)";
                    DataTable productTable = new DataTable();
                    Int64 Total = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];

                        String CS = ConfigurationManager.ConnectionStrings["IdentityConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("select * from Products where PID=" + PID + "", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(productTable);
                                }
                            }
                        }
                        Total += Convert.ToInt64(productTable.Rows[i]["ProductPrice"]);
                    }
                    rptrCartProducts.DataSource = productTable;
                    rptrCartProducts.DataBind();
                    priceDetails.Visible = true;

                    spanTotal.InnerText = "$" + Total.ToString();
                }
                else
                {
                    //TODO show empty cart
                    h5NoItems.InnerText = "Your Cart is Empty";
                    priceDetails.Visible = false;
                }

            }
            else
            {
                //TODO show empty cart
                h5NoItems.InnerText = "Your Cart is Empty";
                priceDetails.Visible = false;
            }
        }
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            Button btn = (Button)(sender);
            string PID = btn.CommandArgument;
            List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
            CookiePIDList.Remove(PID);
            string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
            if (CookiePIDUpdated == "")
            {
                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = null;
                CartProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);

            }
            else
            {
                HttpCookie CartProducts = new HttpCookie("CartPID");
                CartProducts.Values["CartPID"] = CookiePIDUpdated;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            Response.Redirect("Addtocart.aspx");

        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("PaymentPaypal.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx?rurl=cart");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.EntityFramework;
using PayPal.Api;

namespace CO5027
{
    public partial class PaymentPaypal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {

                }
                BindPriceData();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void BindPriceData()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    DataTable productTable = new DataTable();
                    Int64 Total = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];

                        string CS = ConfigurationManager.ConnectionStrings["IdentityConnectionString"].ConnectionString;
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
                    priceDetails.Visible = true;

                    spanTotal.InnerText = "$" + Total.ToString();
                    TotalPaid.Value = Total.ToString();
                }
                else
                {
                    //TODO show empty cart
                    Response.Redirect("UserProduct.aspx");
                }

            }
            else
            {
                //TODO show empty cart
                Response.Redirect("UserProduct.aspx");
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            // Authenticate with Paypal
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            // APIContext Object
            var apiContext = new APIContext(accessToken);

            decimal postagePackingCost = 3.95m;
            decimal examPaperPrice = 10.00m;
            int quantityOfExamPapers = int.Parse(ddlExamQuantity.SelectedValue);
            decimal subtotal = (quantityOfExamPapers * examPaperPrice);
            decimal total = subtotal + postagePackingCost;

            var examPaperItem = new Item();
            examPaperItem.name = "Past Exam Paper";
            examPaperItem.currency = "GBP";
            examPaperItem.price = examPaperPrice.ToString();
            examPaperItem.sku = "PRODAnker";
            examPaperItem.quantity = quantityOfExamPapers.ToString();

            var transactionDetails = new Details();
            transactionDetails.tax = "0";
            transactionDetails.shipping = postagePackingCost.ToString();
            transactionDetails.subtotal = subtotal.ToString("0.00");

            var transactionAmount = new Amount();
            transactionAmount.currency = "GBP";
            transactionAmount.total = total.ToString("0.00");
            transactionAmount.details = transactionDetails;

            var transaction = new Transaction();
            transaction.description = "Your order of Past Exam papers";
            transaction.invoice_number = Guid.NewGuid().ToString();
            transaction.amount = transactionAmount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { examPaperItem }
            };

            var payer = new Payer();
            payer.payment_method = "paypal";

            var redirectUrls = new RedirectUrls();
            redirectUrls.cancel_url = "";
            redirectUrls.return_url = "";

            var payment = Payment.Create(apiContext, new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = new List<Transaction> { transaction },
                redirect_urls = redirectUrls
            });

            Session["PaymentId"] = payment.id;

            foreach (var link in payment.links)
            {
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    Response.Redirect(link.href);
                }
            }
        }


        //if (Session["UserName"] != null)
        //{
        //    string USERID = Session["UserName"].ToString();
        //    string PaymentType = "PayPal";
        //    string PaymentStatus = "NotPaid";
        //    DateTime DateOfPurchase = DateTime.Now;

        //    //INSERT DATA TO PURCHASE TABLE
        //    String CS = ConfigurationManager.ConnectionStrings["IdentityConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        SqlCommand cmd = new SqlCommand("Insert into [Purchase](UserID, TotalPaid, PaymentType, PaymentStatus, DateOfPurchase, Name, Address, PinCode, PostCode, City) values('" + USERID + "', '"
        //            + TotalPaid.Value + "','" + PaymentType + "','" + PaymentStatus + "','" + DateOfPurchase + "','"
        //            + Name.Text + "','" + Address.Text + "','" + Pincode.Text + "','" + Postcode.Text + "','" + City.Text + "') select SCOPE_IDENTITY()", con);
        //        con.Open();
        //        Int64 PurchaseID = Convert.ToInt64("50");
        //    }
        //}
        //else
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }
}
using System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Web.Security;
using Microsoft.Owin.Security;

namespace CO5027
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                BindCartNumber();
            }

            if (Context.User.Identity.IsAuthenticated)
            {
                UserLogout.Visible = true;
                linksignup.Visible = false;
                linklogin.Visible = false;

                lblname.Text = "Welcome, " + Context.User.Identity.Name + " ";
            }
            else
            {
                UserLogout.Visible = false;
                linklogin.Visible = true;
                linkd.Visible = false;
            }


        }
        protected void UserLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            HttpContext.Current.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("Login.aspx");
        }


        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {

                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();
            }

        }


    }
}
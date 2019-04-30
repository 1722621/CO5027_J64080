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
using System.Web.Security;
using Microsoft.Owin.Security;

namespace CO5027
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Index.aspx");
            }
            else
            {

            }
        }

        protected void Login_btn_Click(object sender, EventArgs e)
        {

            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(Username.Text, Passtxt.Text);

            if (user != null)
            {
                LogUserIn(userManager, user);
                Session["UserName"] = Username.Text;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Login Successful";
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "*Invalid Username or Password";
            }

        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

            if (Request.QueryString["ReturnUrl"] != null)
            {
                Response.Redirect(Request.QueryString["ReturnUrl"]);
            }
            else
            {
                String userRoles = usermanager.GetRoles(user.Id).FirstOrDefault();

                if (userRoles.Equals("admin"))
                {
                    Session["UserName"] = Username.Text;
                    Response.Redirect("Admin/AdminProduct.aspx");
                }
                else if (userRoles.Equals("user"))
                {
                    Session["UserName"] = Username.Text;
                    Response.Redirect("Index.aspx");
                }
            if (Request.QueryString["rurl"] != null)
            {
                if (Request.QueryString["rurl"] == "cart")
                {
                    Response.Redirect("Addtocart.aspx");
                }
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
                Response.Redirect("Index.aspx");
            }

        }


    }
}


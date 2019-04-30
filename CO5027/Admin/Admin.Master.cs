using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Web.Security;
using Microsoft.Owin.Security;
using System.Drawing;


namespace CO5027.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((string)Session["UserName"] == "Admin")
            //{
            //    lblname.Text = "Welcome, " + Session["UserName"].ToString() + " ";
            //    lblname.ForeColor = Color.Red;
            //}
            //else
            //{
            //    lblname.Visible = false;
            //    Response.Redirect("~Index.aspx"); ;

            //}

            if (Context.User.Identity.IsAuthenticated)
            {
                lblname.Text = "Welcome, " + Context.User.Identity.Name + " ";
            }
        }

        protected void UserLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            HttpContext.Current.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Login.aspx");
        }

    }
}
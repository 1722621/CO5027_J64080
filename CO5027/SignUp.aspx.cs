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
using Microsoft.AspNet.Identity.Owin;
using Owin;

namespace CO5027
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendMessage_Click(object sender, EventArgs e)

        {

            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var roleStore = new RoleStore<IdentityRole>(identityDbContext);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);



            IdentityRole userRole = new IdentityRole("user");
            roleManager.Create(userRole);

            var user = new IdentityUser() { UserName = Name.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Passwd.Text);
            if (result.Succeeded)
            {
                manager.AddToRole(user.Id, "user");
                manager.Update(user);
                LblMessage.Text = "Registration Successful";
                LblMessage.ForeColor = Color.Green;
            }
            else
            {
                LblMessage.Text = "*Registration Failed";
                LblMessage.ForeColor = Color.Red;
            }

        }


    }
}
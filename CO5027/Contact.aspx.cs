using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Drawing;

namespace CO5027
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click1(object sender, EventArgs e)
        {
            if (senderName.Text != "" & senderEmail.Text != "" && Subject.Text != "" && Message.Text != "")
            {
                //set mail                     

                MailMessage message = new MailMessage();

                //set address
                message.From = new MailAddress(senderEmail.Text.ToString());
                message.To.Add("powerbank.bn@gmail.com");

                //set content        
                message.Subject = "Message via Powerbanks from" + " " + senderName.Text.ToString();
                message.IsBodyHtml = true;
                message.Body = "<html><body>"
                    + "Email Address: " + senderEmail.Text.ToString() +
                    "<br><br>"
                    + "Subject: " + Subject.Text.ToString() +
                    "<br><br>"
                    + "Message: " + Message.Text.ToString() +
                    "</body></html>";

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("powerbank.bn@gmail.com", "P0w3rbank");
                client.Send(message);

                string msgstring = "Message Sent!";
                string content = "window.onload=function(){ alert('";
                content += msgstring;
                content += "');";
                content += "window.location='";
                content += Request.Url.AbsoluteUri;
                content += "';}";
                ClientScript.RegisterStartupScript(this.GetType(), "Success Message", content, true);
            }
            else
            {
                LblMessage.Text = "*All Fields are mandatory";
                LblMessage.ForeColor = Color.Red;
            }

        }
    }
}


   

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace CO5027.Admin
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ProductID = Request.QueryString["PID"];
            string filename = ProductID + ".jpg";

            CurrentImage.ImageUrl = "~/ProductImages/" + filename;

        }

        protected void btnClick_Click(object sender, EventArgs e)
        {
            if(ImageUpload.HasFile)
            {
                    if (ImageUpload.PostedFile.ContentType == "image/jpeg" || ImageUpload.PostedFile.ContentType == "image/png")
                    {
                        string ProductID = Request.QueryString["PID"];
                        string filename = ProductID + ".jpg";
                        string saveLocation = Server.MapPath("~/ProductImages/" + filename);
                        ImageUpload.SaveAs(saveLocation);
                        Uploaded.Text = "Upload Successful";
                        Uploaded.ForeColor = Color.Green;
                }
                    else
                {
                    Uploaded.Text = "(Only JPG and PNG file formats are allowed)";
                    Uploaded.ForeColor = Color.Red;
                }
                  
            }
        
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProduct.aspx");
        }
    }
}
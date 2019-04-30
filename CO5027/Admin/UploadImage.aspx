<%@ Page Title="P0W3RBANK | Image Upload" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="CO5027.Admin.Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
        <!--CSS file link-->
<link href="../Content/ProductView.css" rel="stylesheet" type="text/css"/>
<!--CSS file link-->
      <div class ="container">
        <div class="row">
            <div class="form-group">
                <div class="col-sm-6 col-md-6">
          <div class="thumbnail">
                <asp:Image ID="CurrentImage" runat="server" />
                    </div>
    <div class="form-group">
               <asp:FileUpload ID="ImageUpload" Cssclass="form-control" placeholder="Description" runat="server"></asp:FileUpload>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorImage" ValidationGroup="UPLOAD" CssClass ="text-danger" runat="server" ErrorMessage="Select product image" ControlToValidate="ImageUpload"></asp:RequiredFieldValidator>
        <asp:Label ID="Uploaded" runat="server"></asp:Label>
                 </div>
    <div class="form-group">
                <asp:Button ID="btnClick" ValidationGroup="UPLOAD" class="btn btn-primary btn" runat="server" Text="Upload" OnClick="btnClick_Click" />
        <asp:Button ID="btnCancel" class="btn btn-primary btn" runat="server" Text="Back" OnClick="btnCancel_Click"/>
        
            </div>
            </div>
                </div>     
            </div>
          </div>
</asp:Content>


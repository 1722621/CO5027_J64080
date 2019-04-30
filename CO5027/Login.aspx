<%@ Page Title="P0W3RBANK | Login" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CO5027.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
   <!--CSS file link-->
<link href="Content/Login.css" rel="stylesheet" type="text/css"/>
<!-- Body -->
<div class="container">
<div class="row">
<!-- Login Form -->
     <div class="col-md-4 col-md-offset-4" id="loginform"> 
           <div class="well well-lg">
            <fieldset>
             <legend class="text-center header">LOGIN</legend>
<!-- USERNAME TEXTBOX -->
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-user"></i>                 
                        <asp:TextBox ID="Username" Cssclass="form-control" placeholder="Username" runat="server"/>  
                        <asp:RequiredFieldValidator ID="rfvUsername" ValidationGroup="CONTACT" ControlToValidate="Username" cssClass="text-danger" ErrorMessage="Username is a required field." Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                  </div>
             </div>                    
<!-- PASSWORD TEXTBOX -->
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-lock"></i>                
                       <asp:TextBox ID="Passtxt" Cssclass="form-control" placeholder="Password" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="rfvsPass" ValidationGroup="CONTACT" ControlToValidate="Passtxt" cssClass="text-danger" ErrorMessage="Password field is required" Display="Dynamic" runat="server"  ></asp:RequiredFieldValidator>                   
                  </div>
             </div>
<!-- LOGIN BUTTON -->
             <div class="form-group">
                        <asp:Button ID="Login_btn" Cssclass="btn btn-primary btn-block" ValidationGroup="CONTACT" runat="server" Text="Login" OnClick="Login_btn_Click"/>  
                  <div class="form-group" id="labelMessage">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>                     
             </div> 
            </fieldset>  
           </div>
<!-- LINK -->
         <div class="form-group" id="Reglink">
           <%--<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/ForgotPassword.aspx">Forgot Password?</asp:LinkButton>--%>
<asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/SignUp.aspx">Haven't Registered?</asp:LinkButton>
      </div>
<!-- Login Form End -->
</div>
</div>
    </div>
<!-- Body End -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</asp:Content>


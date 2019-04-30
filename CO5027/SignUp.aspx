<%@ Page Title="P0W3RBANK | Sign Up" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CO5027.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
    <link href="Content/Login.css" rel="stylesheet" type="text/css"/>
<!-- Body -->
      <div class="container">
          <div class="row">
    <!-- Register Form -->
                  <div class="col-md-4 col-md-offset-4" id="loginform"> 
           <div class="well well-lg">
               <fieldset>
               <legend class="text-center header">SIGN UP</legend>
             <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-user"></i>
               <asp:TextBox ID="Name" class="form-control" placeholder="Username" runat="server"></asp:TextBox>   
                    <asp:RequiredFieldValidator ValidationGroup="CONTACT" cssClass="text-danger" ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="Name"
                    ErrorMessage="Name is a required field."
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                 </div>
                 </div>
             <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-envelope"></i>
               <asp:TextBox ID="Email" class="form-control" placeholder="Email Address" runat="server" TextMode="Email"></asp:TextBox>   
                     <asp:RequiredFieldValidator ValidationGroup="CONTACT" cssClass="text-danger" ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="Email"
                    ErrorMessage="Email is a required field."
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
             </div>
                 </div>
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-pencil"></i>
               <asp:TextBox type="password" ID="Passwd" class="form-control" placeholder="Password" runat="server"></asp:TextBox>   
                     <asp:RequiredFieldValidator ValidationGroup="CONTACT" cssClass="text-danger" ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="Passwd"
                    ErrorMessage="Password is a required field."
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
             </div>
                 </div>
                <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-lock"></i>
               <asp:TextBox type="password" ID="confirmpassword" class="form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>   
                      <asp:RequiredFieldValidator ValidationGroup="CONTACT" cssClass="text-danger" ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="confirmpassword"
                    ErrorMessage="confirm your password."
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                       <div class="help-block with-errors"></div>
             </div>
                 </div>
                   <div class="form-group">
                       <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-calendar"></i>
                    <asp:TextBox ID="date" class="form-control" placeholder="MM/DD/YYY" runat="server"></asp:TextBox> 
                       <asp:RequiredFieldValidator ValidationGroup="CONTACT" cssClass="text-danger" ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="date"
                    ErrorMessage="Date is a required field."
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                    </div>
                    </div>
               <asp:Button ID="sendMessage" ValidationGroup="CONTACT" Cssclass="btn btn-primary btn-block" runat="server" Text="Register Now" OnClick="sendMessage_Click"/>
                   <div class="form-group">
                   <asp:Label ID="LblMessage" runat="server" Text="" ViewStateMode="Enabled"></asp:Label>
                       </div>
               </fieldset>
           </div>
           </div>
              </div>
          </div>
<!-- Register Form End -->              
</asp:Content>

<%@ Page Title="P0W3RBANK | Payment" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PaymentPaypal.aspx.cs" Inherits="CO5027.PaymentPaypal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
    <!--CSS file link-->
<link href="Content/Login.css" rel="stylesheet" type="text/css"/>
<div class="container">
    <div class="row">
<!-- TEXTBOX -->
    <asp:HiddenField ID="TotalPaid" runat="server" />

    <div class="col-md-7">
           <h4>DELIVERY DETAILS</h4>
                <hr />
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-user"></i>                 
                        <asp:TextBox ID="Name" Cssclass="form-control" placeholder="Name" runat="server"></asp:TextBox>  
                        <asp:RequiredFieldValidator ID="rfvsName" ControlToValidate="Name" cssClass="text-danger" ErrorMessage="Field is required" Display="Dynamic" runat="server"></asp:RequiredFieldValidator>
                  </div>
             </div>
<!-- TEXTBOX -->
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-home"></i>                
                        <asp:TextBox ID="City" Cssclass="form-control" placeholder="City / District" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="City" cssClass="text-danger" ErrorMessage="Field is required" Display="Dynamic" runat="server"  ></asp:RequiredFieldValidator>                   
                  </div>
             </div>     
<!-- TEXTBOX -->
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-map-marker"></i>                
                        <asp:TextBox ID="Postcode" Cssclass="form-control" placeholder="Postcode (e.g. KB4533)" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Postcode" cssClass="text-danger" ErrorMessage="Field is required" Display="Dynamic" runat="server"  ></asp:RequiredFieldValidator>                   
                  </div>
             </div>                  
<!-- TEXTBOX -->
             <div class="form-group">               
                        <asp:TextBox ID="Address" TextMode="MultiLine" Cssclass="form-control" placeholder="Address (Town. etc..)" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvsAddress" ControlToValidate="Address" cssClass="text-danger" ErrorMessage="Field is required" Display="Dynamic" runat="server"  ></asp:RequiredFieldValidator>                   
             </div>
<!-- TEXTBOX -->
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-lock"></i>                
                        <asp:TextBox ID="Pincode" Cssclass="form-control" placeholder="Pincode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Pincode" cssClass="text-danger" ErrorMessage="Field is required" Display="Dynamic" runat="server"  ></asp:RequiredFieldValidator>                   
                  </div>
             </div>     
        </div>

<!-- PRICE TAB -->
    
        <div class="col-md-3 pull-right" runat="server" id="priceDetails">
            <h4>PRICE DETAILS</h4>
                <hr />
            <div class="price">
                <label>Total</label>
                <span class="pull-right priceGreen" id="spanTotal" runat="server"></span>
            </div> 
            <asp:ImageButton ID="btnPurchaseExamQuestions" ImageUrl="~/images/paypalbtn.png" OnClick="btnPay_Click" runat="server" />
            </div> 
        </div>
<div class="row">
    <asp:Label ID="LblQuantity" runat="server" Text="Quantity" AssociatedControlID="ddlExamQuantity"></asp:Label>
    <asp:DropDownList ID="ddlExamQuantity" runat="server">
    <asp:ListItem>1</asp:ListItem>
    <asp:ListItem>2</asp:ListItem>
    <asp:ListItem>3</asp:ListItem>
        </asp:DropDownList>
</div>
            </div>
</asp:Content>
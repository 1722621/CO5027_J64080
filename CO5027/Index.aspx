<%@ Page Title="P0W3RBANK | Products" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CO5027.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
     <!--CSS file link-->
<link href="Content/UserProduct.css" rel="stylesheet" type="text/css"/>
   
<!--CSS file link-->
     
<div class="container">
     <div class="well well-lg">
             <fieldset>
               <legend class="text-center header">AVAILABLE PRODUCTS</legend>
    <div class="row">
        <asp:Repeater ID="ProductRepeater" runat="server"> 
            <ItemTemplate>
    <div class="col-sm-3 col-md-3"> 
        <a href="UserProductView.aspx?PID=<%#Eval("PID") %>">
        <div class="thumbnail">
            <img src="Productimages/<%#Eval("PID") %>.jpg" alt="P0W3RBANK"/>
                    <div class="caption">
                    <div class="brand"><%# Eval("ProductBrand") %></div>
                    <div class="name"><%# Eval("ProductName") %></div> 
                    <div class="price">$<%# Eval("ProductPrice")%></div>
                    <div class="price">Quantity: (<%#Eval("ProductQty")%>)</div> 
                        </div>
                </div> 
            </a>
            
        </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
                 </fieldset>
        </div>
    </div>
</asp:Content>

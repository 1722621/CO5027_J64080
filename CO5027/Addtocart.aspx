<%@ Page Title="P0W3RBANK | Add to cart" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Addtocart.aspx.cs" Inherits="CO5027.Addtocart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
       <!--CSS file link-->
<link href="Content/ProductView.css" rel="stylesheet" type="text/css"/>
<!--CSS file link-->
    <div class="container">
        <div class="row">
<!-- ITEMS --> 
            <div class="col-md-9">     
                <h3 class="price" runat="server" id="h5NoItems"></h3>
            <asp:Repeater ID="rptrCartProducts" runat="server">
           <ItemTemplate> 
            <div class="media">
                <div class="media-left">
                      <img class="media-object" src="Productimages/<%#Eval("PID") %>.jpg"/>
                </div>
            
            <div class="media-body">
                <h4 class ="media-heading"><%#Eval("ProductName") %></h4>
                <span class="price">$<%# Eval("ProductPrice","{0:0.00}")%></span><asp:Button CommandArgument='<%#Eval("PID") %>' ID="btnRemove" OnClick="btnRemove_Click" CssClass="removeButton" runat="server" Text="REMOVE ITEM" />   
              </div>
</div>
     </ItemTemplate>
        </asp:Repeater>   
            </div>

 
<!-- PRICE TAB -->
        <div class="col-md-3" runat="server" id="priceDetails">
                <h4 class="price">PRICE DETAILS</h4>
                <hr />
            <div class="price">
                <label>Grand Total</label>
                <span class="pull-right priceGreen" id="spanTotal" runat="server"></span>
            </div>                      
                <div>
                  <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click" CssClass="buyNowbtn btn-block" runat="server" Text="PROCEED TO CHECKOUT" />
               </div>
            </div>            

        
     

<!-- FOOTER -->
       </div>
     </div>
</asp:Content>


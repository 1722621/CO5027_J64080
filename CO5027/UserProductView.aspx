<%@ Page Title="P0W3RBANK | Product View" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserProductView.aspx.cs" Inherits="CO5027.UserProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
        <!--CSS file link-->
<link href="Content/ProductView.css" rel="stylesheet" type="text/css"/>
<!--CSS file link-->
     <div class="container">
         <div class="row">
             <div class="description"></div>
        <div class="col-sm-6">
        <div class="thumbnail">
            <asp:Image ID="Img" runat="server" />
            <asp:Repeater ID="ImgRepeater" runat="server">
                <ItemTemplate>
            <div class="item <%#GetActiveClass(Container.ItemIndex) %>">
            </div>   
                </ItemTemplate>
            </asp:Repeater>
        </div>    
    </div>

<!--End of Slider Banner-->
             <div class="col-sm-6"> 
                    <div class ="thumbnail">
                    <div class="description">
                        <asp:Repeater ID="ProductDetails" runat="server">
                            <ItemTemplate>
                 <h2><%#Eval("ProductName") %></h2>
             <div class="divider"></div>
                        <h4><strong>Price</strong></h4>
                        <h4>$<%#Eval("ProductPrice") %></h4> 
                        <div class="divider"></div>
                        <h4><strong>Product Description</strong></h4>
                         <p><%#Eval("ProductDescription") %></p>    
                        <h4><strong>Product Highlights</strong></h4>
                        <p><%#Eval("ProductDetails") %></p>    
                        <div class="divider"></div>    
                        <h4>Quantity: (<%#Eval("ProductQty")%>)</h4> 
                            </ItemTemplate>
                            </asp:Repeater>
                        
    <%--<asp:Label ID="LblQuantity" runat="server" Text="Select Quantity" AssociatedControlID="ddlProductQuantity"></asp:Label>
    <asp:DropDownList ID="ddlProductQuantity" runat="server">
    <asp:ListItem>1</asp:ListItem>
    <asp:ListItem>2</asp:ListItem>
    <asp:ListItem>3</asp:ListItem>
        </asp:DropDownList>--%>
                         <div>
                        <asp:Button ID="btnAddtoCart" OnClick="btnAddtoCart_Click" CssClass="mainButton" runat="server" Text="ADD TO CART" />
                                  </div>

                        </div>   
                        </div>
                 </div>
</div>
</div>
</asp:Content>

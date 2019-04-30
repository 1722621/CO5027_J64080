<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="CO5027.Admin.AdminProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
    <!--CSS file link-->
<link href="../Content/Login.css" rel="stylesheet" type="text/css"/>
<!--CSS file link-->
    <div class ="container">
        <div class="row">
           <div class="col-sm-3"> 
        <div class="form-group">
            <h1>ADD PRODUCT</h1>
            <hr />
                 </div> 
               <div class="form-group">
                    <div class="inner-addon left-addon">
                        <i class="glyphicon glyphicon-tasks"></i>
                <asp:TextBox ID="ProductBrand" Cssclass="form-control" placeholder="Brand" runat="server"></asp:TextBox>   
                 <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="ProductBrand"
                    ErrorMessage="Fill in the required field."
                     ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                    </div>
                    </div>
        <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-circle-arrow-right"></i>
               <asp:TextBox ID="ProductName" Cssclass="form-control" placeholder="Name" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="ProductName"
                    ErrorMessage="Fill in the required field."
                   ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                 </div>
                 </div> 
                <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-usd"></i>
               <asp:TextBox ID="ProductPrice" Cssclass="form-control" placeholder="Price" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="ProductPrice"
                    ErrorMessage="Fill in the required field."
                   ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ValidationGroup="PRODUCT" ID="RegularExpressionValidator1"
                        ControlToValidate="ProductPrice" runat="server"
                        ErrorMessage="Only Numbers are allowed"
                        ForeColor="Red" Display="Dynamic" ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                 </div>
                 </div>
               <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-plus"></i>
               <asp:TextBox ID="ProductQty" Cssclass="form-control" placeholder="Quantity" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="ProductQty"
                    ErrorMessage="Fill in the required field."
                   ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ValidationGroup="PRODUCT" ID="RegularExpressionValidator2"
                        ControlToValidate="ProductQty" runat="server"
                        ErrorMessage="Only Numbers are allowed"
                        ForeColor="Red" Display="Dynamic" ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                 </div>
                   </div>              
                  <div class="form-group">
               <asp:TextBox ID="ProductDescription" Cssclass="form-control" Textmode="MultiLine" placeholder="Description" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="ProductDescription"
                    ErrorMessage="Fill in the required field."
                   ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                      </div>
                <div class="form-group">
               <asp:TextBox ID="ProductDetails" Cssclass="form-control" Textmode="MultiLine" placeholder="Details" runat="server"></asp:TextBox>  
               <asp:RequiredFieldValidator ValidationGroup="PRODUCT" ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="ProductDetails"
                    ErrorMessage="Fill in the required field."
                   ForeColor="Red" Display="Dynamic"> </asp:RequiredFieldValidator>
                 </div>
               <div class="form-group">
               <asp:Button ID="add" ValidationGroup="PRODUCT" class="btn btn-primary btn-block" runat="server" Text="Add Product" OnClick="add_Click"/>
                   <asp:Label ID="LblMessage" runat="server" Text="" ViewStateMode="Enabled"></asp:Label>
                   <asp:Literal ID="LblSuccess" runat="server"></asp:Literal>
                 </div>
               </div>  
            <div class="col-sm-9">                  
        <div class="form-group">
            <h1>PRODUCT LIST</h1>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PID" DataSourceID="SqlDataSource1" CellSpacing="2" Height="100px" Width="851px" PageSize="4">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="INSERT" UpdateText="Save"  />
                    <asp:TemplateField ShowHeader="False">                       
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are you sure?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="PID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ValidationGroup="INSERT" OnClick="lbInsert_Click" ID="lbInsert" runat="server">Insert</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Name" SortExpression="ProductName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                            <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editNameV" runat="server"
                                ControlToValidate="TextBox1" Text="*Name is a required field" ForeColor="Red" Display="Dynamic" >
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Price" SortExpression="ProductPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:TextBox>
                              <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editPriceV" runat="server"
                                ControlToValidate="TextBox2" Text="*price is a required field" ForeColor="Red" Display="Dynamic" >
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                            <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidator3"
                        ControlToValidate="TextBox2" runat="server"
                        ErrorMessage="Only Numbers are allowed"
                        ForeColor="Red" Display="Dynamic" ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Brand" SortExpression="ProductBrand">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProductBrand") %>'></asp:TextBox>
                             <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editBrandV" runat="server"
                                ControlToValidate="TextBox3" Text="*brand is a required field" ForeColor="Red" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProductBrand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="ProductDescription">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:TextBox>
                             <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editDescV" runat="server"
                                ControlToValidate="TextBox4" Text="*Description" ForeColor="Red" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Details" SortExpression="ProductDetails">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ProductDetails") %>'></asp:TextBox>
                             <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editDetailsV" runat="server"
                                ControlToValidate="TextBox5" Text="*details is a required field" ForeColor="Red" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ProductDetails") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="ProductQty">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ProductQty") %>'></asp:TextBox>
                             <!-- RequiredFieldValidator-->
                            <asp:RequiredFieldValidator ValidationGroup="INSERT" ID="editQtyV" runat="server"
                                ControlToValidate="TextBox6" Text="*Quantity is a required field" ForeColor="Red" Display="Dynamic" >
                            </asp:RequiredFieldValidator>
                         <!-- RequiredFieldValidator-->
                            <asp:RegularExpressionValidator ValidationGroup="INSERT" ID="RegularExpressionValidator4"
                        ControlToValidate="TextBox6" runat="server"
                        ErrorMessage="Only Numbers are allowed"
                        ForeColor="Red" Display="Dynamic" ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ProductQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:HyperLinkField DataNavigateUrlFields="PID" DataNavigateUrlFormatString="UploadImage.aspx?PID={0}" InsertVisible="False" Text="Set Image" />

                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>

            <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" Forecolor="Red" runat="server" Height="44px" />

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db_1722632_co5027_4213ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [PID] = @original_PID AND (([ProductName] = @original_ProductName) OR ([ProductName] IS NULL AND @original_ProductName IS NULL)) AND (([ProductPrice] = @original_ProductPrice) OR ([ProductPrice] IS NULL AND @original_ProductPrice IS NULL)) AND (([ProductBrand] = @original_ProductBrand) OR ([ProductBrand] IS NULL AND @original_ProductBrand IS NULL)) AND (([ProductDescription] = @original_ProductDescription) OR ([ProductDescription] IS NULL AND @original_ProductDescription IS NULL)) AND (([ProductDetails] = @original_ProductDetails) OR ([ProductDetails] IS NULL AND @original_ProductDetails IS NULL)) AND (([ProductQty] = @original_ProductQty) OR ([ProductQty] IS NULL AND @original_ProductQty IS NULL))" InsertCommand="INSERT INTO [Products] ([ProductName], [ProductPrice], [ProductBrand], [ProductDescription], [ProductDetails], [ProductQty]) VALUES (@ProductName, @ProductPrice, @ProductBrand, @ProductDescription, @ProductDetails, @ProductQty)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [ProductPrice] = @ProductPrice, [ProductBrand] = @ProductBrand, [ProductDescription] = @ProductDescription, [ProductDetails] = @ProductDetails, [ProductQty] = @ProductQty WHERE [PID] = @original_PID AND (([ProductName] = @original_ProductName) OR ([ProductName] IS NULL AND @original_ProductName IS NULL)) AND (([ProductPrice] = @original_ProductPrice) OR ([ProductPrice] IS NULL AND @original_ProductPrice IS NULL)) AND (([ProductBrand] = @original_ProductBrand) OR ([ProductBrand] IS NULL AND @original_ProductBrand IS NULL)) AND (([ProductDescription] = @original_ProductDescription) OR ([ProductDescription] IS NULL AND @original_ProductDescription IS NULL)) AND (([ProductDetails] = @original_ProductDetails) OR ([ProductDetails] IS NULL AND @original_ProductDetails IS NULL)) AND (([ProductQty] = @original_ProductQty) OR ([ProductQty] IS NULL AND @original_ProductQty IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_PID" Type="Int64" />
                    <asp:Parameter Name="original_ProductName" Type="String" />
                    <asp:Parameter Name="original_ProductPrice" Type="Int32" />
                    <asp:Parameter Name="original_ProductBrand" Type="String" />
                    <asp:Parameter Name="original_ProductDescription" Type="String" />
                    <asp:Parameter Name="original_ProductDetails" Type="String" />
                    <asp:Parameter Name="original_ProductQty" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductPrice" Type="Int32" />
                    <asp:Parameter Name="ProductBrand" Type="String" />
                    <asp:Parameter Name="ProductDescription" Type="String" />
                    <asp:Parameter Name="ProductDetails" Type="String" />
                    <asp:Parameter Name="ProductQty" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductPrice" Type="Int32" />
                    <asp:Parameter Name="ProductBrand" Type="String" />
                    <asp:Parameter Name="ProductDescription" Type="String" />
                    <asp:Parameter Name="ProductDetails" Type="String" />
                    <asp:Parameter Name="ProductQty" Type="Int32" />
                    <asp:Parameter Name="original_PID" Type="Int64" />
                    <asp:Parameter Name="original_ProductName" Type="String" />
                    <asp:Parameter Name="original_ProductPrice" Type="Int32" />
                    <asp:Parameter Name="original_ProductBrand" Type="String" />
                    <asp:Parameter Name="original_ProductDescription" Type="String" />
                    <asp:Parameter Name="original_ProductDetails" Type="String" />
                    <asp:Parameter Name="original_ProductQty" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <hr /> 

            <hr />
            </div>
                </div>
           
    </div>
        </div>
   

</asp:Content>

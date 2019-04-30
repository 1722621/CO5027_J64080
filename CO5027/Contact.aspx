<%@ Page Title="P0W3RBANK | Contact" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CO5027.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMaster" runat="server">
<!--CSS file link-->
<link href="Content/Login.css" rel="stylesheet" type="text/css"/>
<!--CSS file link-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8">
    <div class="container">
    <div class="row">
            <div class="well well-lg">
             <fieldset>
               <legend class="text-center header">MAP LOCATION</legend>
    <div id="map"></div>
                 </fieldset>
</div>

</div>
    <div class="row">   
       <div class="col-sm-6"> 
           <div class="well well-lg">
               <fieldset>
               <legend class="text-center header">LEAVE A MESSAGE</legend>
             <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-user"></i>
               <asp:TextBox ID="senderName" Cssclass="form-control" placeholder="Name" runat="server"></asp:TextBox>    
                          <asp:RequiredFieldValidator ValidationGroup="CONTACT" ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="senderName"
                    ErrorMessage="Name is a required field."
                    ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
                 </div>
                 </div>
             <div class="form-group">
                 <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-envelope"></i>
               <asp:TextBox ID="senderEmail" Cssclass="form-control" placeholder="Email Address" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ValidationGroup="CONTACT" ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="senderEmail"
                    ErrorMessage="Email address is a required field."
                    ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
             </div>
                 </div>
             <div class="form-group">
                  <div class="inner-addon left-addon">
                     <i class="glyphicon glyphicon-pencil"></i>
               <asp:TextBox ID="Subject" Cssclass="form-control" placeholder="Subject" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ValidationGroup="CONTACT" ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="Subject"
                    ErrorMessage="Subject is a required field."
                    ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
                       <div class="help-block with-errors"></div>
             </div>
                 </div>
             <div class="form-group">  
              <asp:TextBox ID="Message" Cssclass="form-control" placeholder="Message.." Textmode="Multiline" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ValidationGroup="CONTACT" ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="Message"
                    ErrorMessage="Message is a required field."
                    ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
             </div>
               <asp:Button ID="sendMessage" ValidationGroup="CONTACT" Cssclass="btn btn-primary btn-block" runat="server" Text="Send" OnClick="btnsend_Click1" CausesValidation="False"/>
                   <asp:Label ID="LblMessage" runat="server" Text="" ViewStateMode="Enabled"></asp:Label>
</fieldset>
          </div>  
           </div>

        <asp:ValidationSummary ID="CONTACT" runat="server" />
 
       <div class="col-sm-6"> 
           <div class="well well-lg">
               <fieldset>
               <legend class="text-center header">CONTACT INFO</legend>
                        <div id="contactinfo">
                        <h5><strong>OFFICE ADDRESS:</strong></h5>
                        <p>Brunei Muara,</p>
                        <p>Bandar Seri Begawan, Gadong</p>
                        <h5><strong>TEL. NO:</strong></h5>
                        <p>2266111</p>
                        <h5><strong>EMAIL:</strong></h5>
                        <p>Powerbanks.BN@gmail.com</p>
                        </div>
                   </fieldset>
               </div>
           </div>
                </div> 
            </div>    
     <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 4.905573, lng: 114.916970},
          zoom: 18
          });
          var marker = new google.maps.Marker({
              position: { lat: 4.905573, lng: 114.916970},
              map : map
          })
      }
    </script>
        <!--Google Maps-->
        <script type="text/javascript" async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoc52gfkMk6DGKBhJi0I5E1U1TFETPbno&callback=initMap" ></script>
</asp:Content>



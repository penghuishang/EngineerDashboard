<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EngineerDashboard.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>\n\n\n</p>
   
   <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4></h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Pawprint" CssClass="col-md-2 control-label">Pawprint</asp:Label>

                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Pawprint" CssClass="form-control"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Pawprint"
                                CssClass="text-danger" ErrorMessage="The pawprint field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>                  
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10">
                            <asp:Label runat="server" ID="LoginFailMessage" CssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10">
                            <asp:Label runat="server" ID="LoginSuccessMessage" CssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </section>
        </div> 
    </div>
</asp:Content>

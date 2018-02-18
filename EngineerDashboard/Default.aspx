<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EngineerDashboard._Default" Async="true" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <title>Login Page</title>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="container body-content">
            <div class="row">
                <div class="Header-wrapper">
                    <header id="header">
                        <div class="logo">
                            <asp:HyperLink ID="logolink" NavigateUrl="#" runat="server" ImageUrl="Assets/logo_mu.png" />
                        </div>
                        <div class="unit">
                            <asp:HyperLink NavigateUrl="#" runat="server" Text="Collage of Engineering" Font-Size="25px" ForeColor="Black" />
                        </div>
                        <asp:HyperLink NavigateUrl="https://engineering.missouri.edu/" runat="server" Text="University of Missouri" Font-Size="18px" ForeColor="Black" />
                    </header>
                </div>
            </div>
            <div class="row" style="margin-top: 100px;">
                <div class="col-md-8">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Pawprint" CssClass="col-md-2 control-label">Pawprint</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Pawprint" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <%--  <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                                </div>
                            </div>
                            <div class="col-md-10">
                                <asp:Label ID="loginValidLabel" runat="server" AssociatedControlID="Password"></asp:Label>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
             <hr />
             <footer>
                <p>Development by the Engineering Collage - Universtiy of Missouri</p>
            </footer>
        </div>
    </form>
</body>
</html>

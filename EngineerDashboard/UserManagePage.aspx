<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagePage.aspx.cs" Inherits="EngineerDashboard.UserManagePage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:20px">
        <p style="font-size: 20px"> User Management </p>
        <ej:Grid ID="User_Grid" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True">

        </ej:Grid>
    </div>
</asp:Content>

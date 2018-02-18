<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashboardPage.aspx.cs" Inherits="EngineerDashboard.DashboardPage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
      <div class="Dashboard_Left">
          <div>
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
              <ej:DropDownList ID="DropDownList1" runat="server"></ej:DropDownList>
              <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
          </div>
          <ej:Grid ID="Matric_Grid" runat='server'></ej:Grid>
        </div>
         <ej:Chart ID="Chart" runat="server"></ej:Chart>
        <div class="DeptCompare_Gird">
            <ej:Grid ID="Grid2" runat='server'></ej:Grid>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportExclePage.aspx.cs" Inherits="EngineerDashboard.ImportExclePage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <div class="row">

            <ej:Button ID="ImportExcel_Button" runat="server" Text="Import Excel" OnClick="ImportExcel_click" Type="Button"></ej:Button>
            <ej:Button ID="Button" runat="server" Text="Comfirm" OnClick="ConfirmImport_click" Type="Button"></ej:Button>

            <ej:Grid ID="ExcelImport_Grid" runat='server' AllowPaging="true" AllowResizeToFit="true">
                <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="Dialog"></EditSettings>
                <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            </ej:Grid>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportExclePage.aspx.cs" Inherits="EngineerDashboard.ImportExclePage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 20px">
        <p style="text-align: center; font-size: 14px"></p>
        <ej:Tab ID="ChartTabContent" runat="server">
            <Items>
                <ej:TabItem ID="QtrB" Text="Awards by Admin Unit">
                    <ContentSection>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnUnload="UpdatePanel_Unload">
                            <ContentTemplate>
                                <ej:Button Type="Button" ID="ImportExcel_Button" runat="server" Text="Import Excel" OnClick="ImportExcel_click"></ej:Button>
                                <ej:Button Type="Button" ID="Button" runat="server" Text="Comfirm" OnClick="ConfirmImport_click"></ej:Button>
                            </ContentTemplate>
                        </asp:UpdatePanel>                        
                        <ej:Grid ID="AwardsAdminUnit_Gird" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True" AllowScrolling="true"
                            AllowResizeToFit="true" AllowResizing="true">
                        </ej:Grid>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="QtrL" Text="Awards by Shared Credit">
                    <ContentSection>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnUnload="UpdatePanel_Unload">
                            <ContentTemplate>
                                <ej:Button Type="button" ID="Button1" runat="server" Text="Import Excel" OnClick="ConfirmImport_click"></ej:Button>
                                <ej:Button Type="button" ID="Button2" runat="server" Text="Comfirm" OnClick="ConfirmImport_click"></ej:Button>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <ej:Grid ID="AwardsSharedCredit_Gird" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True" AllowScrolling="true"
                            AllowResizeToFit="true" AllowResizing="true">
                        </ej:Grid>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="YoY" Text="Expenditures by Admin Unit">
                    <ContentSection>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" OnUnload="UpdatePanel_Unload">
                            <ContentTemplate>
                                <ej:Button Type="Button" ID="Button3" runat="server" Text="Import Excel" OnClick="ImportExcel_click"></ej:Button>
                                <ej:Button Type="Button" ID="Button4" runat="server" Text="Comfirm" OnClick="ConfirmImport_click"></ej:Button>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <ej:Grid ID="ExpendituresAdminUnit_Grid" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True" AllowScrolling="true"
                            AllowResizeToFit="true" AllowResizing="true">
                        </ej:Grid>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="RollB" Text="Expenditures by Shared Credit">
                    <ContentSection>
                        <ej:Button Type="Button" ID="Button5" runat="server" Text="Import Excel" OnClick="ImportExcel_click"></ej:Button>
                        <ej:Button Type="Button" ID="Button6" runat="server" Text="Comfirm" OnClick="ConfirmImport_click"></ej:Button>
                        <ej:Grid ID="ExpendituresSharedCredit_Grid" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True" AllowScrolling="true"
                            AllowResizeToFit="true" AllowResizing="true">
                        </ej:Grid>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="RollL" Text="Proposals">
                    <ContentSection>
                        <ej:Button Type="Button" ID="Button7" runat="server" Text="Import Excel" OnClick="ImportExcel_click"></ej:Button>
                        <ej:Button Type="Button" ID="Button8" runat="server" Text="Comfirm" OnClick="ConfirmImport_click"></ej:Button>
                        <ej:Grid ID="Proposals_Grid" runat='server' AllowFiltering="True" AllowPaging="True" AllowSorting="True" AllowScrolling="true"
                            AllowResizeToFit="true" AllowResizing="true">
                        </ej:Grid>
                    </ContentSection>
                </ej:TabItem>
            </Items>
        </ej:Tab>
    </div>
</asp:Content>

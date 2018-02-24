<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashboardPage.aspx.cs" Inherits="EngineerDashboard.DashboardPage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register Assembly="Syncfusion.EJ, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="ControlContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .selectLeft {
            float: left;
            text-align: right;
            width: 320px;
        }

        .selectRight {
            margin-left: 340px;
            text-align: left;
        }

        .e-menu {
            font-weight: 600;
        }

            .e-menu.e-horizontal .e-mhover, .e-menu.e-context .e-mhover, .e-menu.e-vertical .e-mhover, .e-menu.e-horizontal .e-mhover .e-menulink, .e-menu.e-context .e-mhover .e-menulink .e-menu.e-vertical .e-mhover .e-menulink .e-menu.e-horizontal .e-mfocused .e-menu.e-context .e-mfocused .e-menu.e-vertical .e-mfocused .e-menu.e-horizontal .e-mfocused .e-menulink .e-menu.e-context .e-mfocused .e-menulink .e-menu.e-vertical .e-mfocused .e-menulink .e-menu-res-wrap .e-menu-res-in-wrap .e-icon.e-check-wrap:hover {
                background: #ffd700;
            }

        .e-grid tr.e-hover {
            background: #ffd700;
        }

        .e-pager .e-currentitem {
            background: #ffd700;
        }

            .e-pager .e-currentitem.e-hover {
                background: #ffd700;
            }

            .e-pager .e-numericitem.e-hover, .e-pager .e-currentitem.e-hover {
                background: #ffd700;
            }

        .e-grid td.e-active, .e-grid .e-form-titlebar {
            background: #ffd700;
        }

        .e-btn.e-select:hover, .e-btn.e-select.e-active:hover {
            background: #ffd700;
        }

        .e-tab .e-header.e-addborderbottom .e-active {
            border-top: 3px #ffd700;
        }

        .e-tab.e-js .e-header > .e-active:hover, .e-tab.e-js .e-left > .e-active:hover, .e-tab.e-js .e-right > .e-active:hover, .e-tab.e-js .e-header.e-item:hover, .e-tab.e-js .e-left.e-item:hover, .e-tab.e-js .e-right.e-item:hover {
            background: #ffd700;
        }

        .e-tab .e-header > .e-active a, .e-tab .e-left > .e-active a, .e-tab .e-right > .e-active a {
            background: #ffd700;
        }

        .e-ddl-popup .e-hover {
            background: #ffd700;
        }
    </style>
    <div>
        <div class="row">
            <h1 style="text-align: center; font-size: 20px;">COE Research Metrics </h1>
        </div>
        <div class="row">
            <ej:Button Type="Button" runat="server" Text="Admin Unit" ClientSideOnClick="admin_unit_visiable" />
            <ej:Button Type="Button" runat="server" Text="Shared Credit" ClientSideOnClick="share_credit_visiable" />
        </div>
        <div id="admin_unit_div" class="row">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnUnload="UpdatePanel_Unload">
                <ContentTemplate>
                    <ej:Grid ID="MetricGrid" runat="server" AllowCellMerging="true" AllowSorting="True" AllowScrolling="true"
                        AllowResizeToFit="true" AllowResizing="true">
                        <SortedColumns>
                            <ej:SortedColumn Field="Category" Direction="Ascending" />
                            <ej:SortedColumn Field="DisplayOrder" Direction="Ascending" />
                        </SortedColumns>
                        <ClientSideEvents MergeCellInfo="mergeCellInfo" />
                        <Columns>
                            <ej:Column Field="Category" HeaderText="Category" />
                            <ej:Column Field="Measure" HeaderText="Metirc" TextAlign="Right" />
                            <ej:Column Field="Quarter" HeaderText="Quarter" TextAlign="Right" />
                            <ej:Column Field="Amount" HeaderText="Amount" TextAlign="Right" />
                        </Columns>
                        <ToolbarSettings ShowToolbar="True" ToolbarItems="search"></ToolbarSettings>
                    </ej:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="share_credit_div" class="row">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnUnload="UpdatePanel_Unload">
                <ContentTemplate>
                    <ej:Grid ID="Grid1" runat="server" AllowPaging="true" AllowCellMerging="true" AllowSorting="True" AllowScrolling="true"
                        AllowResizeToFit="true" AllowResizing="true">
                        <SortedColumns>
                            <ej:SortedColumn Field="Category" Direction="Ascending" />
                            <ej:SortedColumn Field="DisplayOrder" Direction="Ascending" />
                        </SortedColumns>
                        <ClientSideEvents MergeCellInfo="mergeCellInfo" />
                        <Columns>
                            <ej:Column Field="Category" HeaderText="Category" />
                            <ej:Column Field="Measure" HeaderText="Metirc" TextAlign="Right" />
                            <ej:Column Field="Quarter" HeaderText="Quarter" TextAlign="Right" />
                            <ej:Column Field="Amount" HeaderText="Amount" TextAlign="Right" />
                        </Columns>
                        <ToolbarSettings ShowToolbar="True" ToolbarItems="search"></ToolbarSettings>
                    </ej:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div>
            <div class="button_list">
                <ej:Button Type="Button" runat="server" Text="Log in" ClientSideOnClick="a" />
            </div>
            <div id="chartlist" class="chart_list">
                <script type="text/javascript" src="../Scripts/ChartData.js"></script>
                <ej:Chart ID="Chart" runat="server" ClientIDMode="Static" IsResponsive="true" OnClientLoad="onChartLoad" EnableCanvasRendering="false">
                    <PrimaryXAxis LabelIntersectAction="Trim"></PrimaryXAxis>
                    <Series>
                        <ej:Series XName="Quarter" YName="Value"></ej:Series>
                    </Series>
                    <Title Text="Total Full Credit Awards" />
                </ej:Chart>
                <ej:Chart ID="Chart1" runat="server">
                    <PrimaryXAxis LabelIntersectAction="Trim"></PrimaryXAxis>
                    <Series>
                        <ej:Series XName="Quarter" YName="Value"></ej:Series>
                    </Series>
                    <Title Text="Total Full Credit Awards" />
                </ej:Chart>
            </div>
            <p style="text-align: center; font-size: 14px"></p>
            <p style="text-align: center; font-size: 20px">Department Comparison</p>
            <div class="DeptCompare_Gird">
                <ej:Grid ID="DepartGrid" runat="server" AllowPaging="true">
                    <Columns>
                        <ej:Column Field="Deptid_Descr" HeaderText="Department" TextAlign="Left" />
                        <ej:Column Field="Quarter" HeaderText="Quarter" TextAlign="Right" />
                        <ej:Column Field="Amount" HeaderText="Amount" TextAlign="Right" />
                    </Columns>
                </ej:Grid>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function mergeCellInfo(args) {
            if (args.column.field == "Category" && args.rowData.Category == "Award" && args.rowData.Measure == "Total Award Amount")
                args.rowMerge(5);
            if (args.column.field == "Category" && args.rowData.Category == "Expenditure" && args.rowData.Measure == "Total Expenditure Amount")
                args.rowMerge(5);
            if (args.column.field == "Category" && args.rowData.Category == "Proposals" && args.rowData.Measure == "Total Proposals Amount")
                args.rowMerge(5);
        }

        function admin_unit_visiable(args) {
            document.getElementById("admin_unit_div").style.visibility = "visible";
            document.getElementById("share_credit_div").style.visibility = "hidden";
        }

        function share_credit_visiable(args) {
            document.getElementById("admin_unit_div").style.visibility = "hidden";
            document.getElementById("share_credit_div").style.visibility = "visible";
        }

    </script>
</asp:Content>

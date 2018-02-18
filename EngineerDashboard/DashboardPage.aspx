<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashboardPage.aspx.cs" Inherits="EngineerDashboard.DashboardPage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register assembly="Syncfusion.EJ, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" namespace="Syncfusion.JavaScript.Models" tagprefix="ej" %>

<asp:Content ID="ControlContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Dashboard_Left{
            float: left;
            width: 750px;
            height: 400px;
        }
        .Dashboard_Right{
            margin-left: 760px;
            margin-top: 10px;
            height: 400px;
        }
        .selectLeft{
            float: left;
            text-align: right;
            width: 320px;
        }
        .selectRight{
            margin-left: 340px;
            text-align: left;
        }
    </style>
    <div class="DashboardFrame">
        <div class="row">
            <div class="Dashboard_Left">
               <div>
                   <h1 style="text-align:center;font-size:20px;"> SOM Research Metrics </h1>
                   <div class="selectDepart">
                       <div class="selectLeft">
                           <span> Select a Department </span>
                       </div>
                       <div class="selectRight">
                           <ej:DropDownList ID="DropDownList" runat="server" DataTextField="text" DataValueField="Deptid_Descr" DataSourceID="SqlDataSource1" />
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [Deptid_Descr] FROM [Department]" ConnectionString='<%$ ConnectionStrings:EngineeringConnection %>'/>
                       </div>
                   </div>
                   <p style="text-align:center;font-size:14px">Select a Metric from the List to update the charts and department comparisons to the right.</p>
                   <p style="text-align:center;font-size:12px"> Arrows next to FYTD values indicate either a 5% increase or decrease compared to the prior FYTD. </p>
               </div>
               <ej:Grid ID="MetricGrid" runat="server" AllowPaging="true" AllowCellMerging="true" >
                   <ClientSideEvents MergeCellInfo="cellmerge" />
                   <Columns>
                       <ej:Column Field="Category" HeaderText="Category" TextAlign="Right"/>
                       <ej:Column Field="Measure" HeaderText="Metirc" TextAlign="Right"/>
                       <ej:Column Field="VALUE" HeaderText="Value" TextAlign="Right"/>
                   </Columns>
               </ej:Grid>
               <asp:Button ID="button" runat="server" Text="Click for the Definition of the Selected Measure" OnClick="button_Click"/>
             </div>
             <div class="Dashboard_Right">
                <div class="chart_list">
                    <ej:Tab ID="ChartTabContent" runat="server">
                        <Items>
                            <ej:TabItem ID="QtrB" Text="QtrB">
                                <ContentSection>
                                    <ej:Chart ID="Chart" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                            <ej:TabItem ID="QtrL" Text="QtrL">

                            </ej:TabItem>
                            <ej:TabItem ID="YoY" Text="YoY">

                            </ej:TabItem>
                            <ej:TabItem ID="RollB" Text="RollB">

                            </ej:TabItem>
                            <ej:TabItem ID="RollL" Text="RollL">

                            </ej:TabItem>
                            <ej:TabItem ID="FY" Text="FY">

                            </ej:TabItem>
                        </Items>
                    </ej:Tab>
                </div>
                <div class="DeptCompare_Gird">
                    <ej:Grid ID="DepartGrid" runat="server" AllowPaging="true">
                        <Columns>
                           <ej:Column Field="ID" HeaderText="Order ID" TextAlign="Right" />
                           <ej:Column Field="Department" HeaderText="Department" TextAlign="Right" />
                           <ej:Column Field="Deptid_Descr" HeaderText="Description" TextAlign="Right" />
                        </Columns>
                    </ej:Grid>
                </div>
             </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function cellmerge(args) { }
    </script>
</asp:Content>
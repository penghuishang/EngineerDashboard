<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DashboardPage.aspx.cs" Inherits="EngineerDashboard.DashboardPage" %>

<%@ Register Assembly="Syncfusion.EJ.Web, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register assembly="Syncfusion.EJ, Version=15.4460.0.17, Culture=neutral, PublicKeyToken=3d67ed1f87d44c89" namespace="Syncfusion.JavaScript.Models" tagprefix="ej" %>

<asp:Content ID="ControlContent" ContentPlaceHolderID="MainContent" runat="server">
    <style> 
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
        <div class="row">
            <div class="col-md-7" >
               <div class="row">
                   <h1 style="text-align:center;font-size:20px;"> SOM Research Metrics </h1>
                   <div class="selectDepart">
                       <div class="selectLeft">
                           <asp:Label ID="Label1" runat="server" Text="Select a Department "></asp:Label>
                       </div>
                       <div class="selectRight">
                           <ej:DropDownList ID="DropDownList" runat="server" DataTextField="text" DataValueField="Deptid_Descr" DataSourceID="SqlDataSource1" Width="200px" />
                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [Deptid_Descr] FROM [Department]" ConnectionString='<%$ ConnectionStrings:EngineeringConnection %>'/>
                       </div>
                   </div>
                   <p style="text-align:center;font-size:14px">Select a Metric from the List to update the charts and department comparisons to the right.</p>
                   <p style="text-align:center;font-size:12px"> Arrows next to FYTD values indicate either a 5% increase or decrease compared to the prior FYTD. </p>
               </div>
               <div class="row">
               <ej:Grid ID="MetricGrid" runat="server" AllowPaging="true" AllowCellMerging="true" >
                   <ClientSideEvents MergeCellInfo="cellmerge" />
                   <Columns>
                       <ej:Column Field="Category" HeaderText="Category" TextAlign="Right"/>
                       <ej:Column Field="Measure" HeaderText="Metirc" TextAlign="Right"/>
                       <ej:Column Field="VALUE" HeaderText="Value" TextAlign="Right"/>
                   </Columns>
               </ej:Grid>
               </div>
                 <p style="text-align:center;font-size:14px"></p>
               <ej:Button Type="Button" ID="button" runat="server" Text="Click for the Definition of the Selected Measure" OnClick="button_Click" ></ej:Button>
             </div>
             <div class="col-md-5">
                <div class="chart_list">
                    <p style="text-align:center;font-size:14px"></p>
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
                                 <ContentSection>
                                    <ej:Chart ID="Chart1" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                            <ej:TabItem ID="YoY" Text="YoY">
                                 <ContentSection>
                                    <ej:Chart ID="Chart2" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                            <ej:TabItem ID="RollB" Text="RollB">
                                 <ContentSection>
                                    <ej:Chart ID="Chart3" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                            <ej:TabItem ID="RollL" Text="RollL">
                                 <ContentSection>
                                    <ej:Chart ID="Chart4" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                            <ej:TabItem ID="FY" Text="FY">
                                 <ContentSection>
                                    <ej:Chart ID="Chart5" runat="server">
                                        <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
                                        <Series>
                                            
                                        </Series>
                                        <Title Text="Total Full Credit Awards" />
                                    </ej:Chart>
                                </ContentSection>
                            </ej:TabItem>
                        </Items>
                    </ej:Tab>
                </div>
                <p style="text-align:center;font-size:14px"></p>
                <p style="text-align:center;font-size:20px">Department Comparison</p>
                <p style="text-align:center;font-size:14px">Click Column Heading to Sort </p>
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
    <script type="text/javascript">
        function cellmerge(args) { }
    </script>
</asp:Content>
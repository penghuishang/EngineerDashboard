using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Windows.Forms;
using System.Reflection;

namespace EngineerDashboard
{
    public partial class DashboardPage : System.Web.UI.Page
    {

        public static DataTable MetricDt;
        public static DataTable chartDt;
        public static DataTable DepartDt;
        public static SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
                {
                    conn.Open();
                    try
                    {
                        string query = "SELECT [Deptid_Descr] FROM Department;";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DepartDt = new DataTable();
                        sda.Fill(DepartDt);
                        DepartmentList.DataSource = DepartDt;
                        DepartmentList.DataBind();

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "SELECT [Fiscal Year], [Quarter],[Measure],[Category],[DisplayOrder],sum([VALUE]) as Amount FROM " +
                            "Engineering.dbo.Quater_ResearchAllAggregated where [Quarter]='Q2' and [Fiscal Year] = '2018' " +
                            "GROUP BY [Fiscal Year],[Quarter], [Measure],[Category],[DisplayOrder]";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        MetricDt = new DataTable();
                        sda.Fill(MetricDt);
                        MetricGrid.DataSource = MetricDt;
                        MetricGrid.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "SELECT [Fiscal Year], [Quarter], sum([VALUE]) as Amount FROM " +
                            "Engineering.dbo.Quater_ResearchAllAggregated where [Fiscal Year] = '2018'" +
                            "GROUP BY [Fiscal Year],[Quarter]";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        chartDt = new DataTable();
                        sda.Fill(chartDt);
                        DataRow dr = null;
                        List<ChartData> data = new List<ChartData>();
                        for (int i = 0; i < chartDt.Rows.Count; i++)
                        {
                            dr = chartDt.Rows[i];
                            data.Add(new ChartData(dr["Quarter"].ToString(), double.Parse(dr["Amount"].ToString())));
                        }

                        this.Chart.Series[0].DataSource = data;
                        this.Chart.DataBind();

                        this.Chart1.Series[0].DataSource = data;
                        this.Chart1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    conn.Close();
                }
            }
        }

        protected void button_Click(object sender, EventArgs e)
        {

        }     

        protected void UpdatePanel_Unload(object sender, EventArgs e)
        {
            MethodInfo methodInfo = typeof(ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance)
                .Where(i => i.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")).First();
            methodInfo.Invoke(ScriptManager.GetCurrent(Page),
                new object[] { sender as UpdatePanel });
        }

        protected void RefreshButton_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            string text = DepartmentList.Value;

            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
            {
                conn.Open();
                try
                {
                    string query;

                    if (text == "ALL")
                        query = "SELECT [Fiscal Year], [Quarter],[Measure],[Category],[DisplayOrder],sum([VALUE]) as Amount FROM " +
                            "Engineering.dbo.Quater_ResearchAllAggregated where [Quarter]='Q2' and [Fiscal Year] = '2018'" +
                            "GROUP BY [Fiscal Year],[Quarter], [Measure],[Category],[DisplayOrder]";
                    else
                        query = "SELECT [Fiscal Year], [Quarter],[Measure],[Category],[DisplayOrder],sum([VALUE]) as Amount FROM " +
                            "Engineering.dbo.Quater_ResearchAllAggregated where [Quarter]='Q2' and [Fiscal Year] = '2018' and [Dept] = '" + text + "' " +
                            "GROUP BY [Fiscal Year],[Quarter], [Measure],[Category],[DisplayOrder]";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    MetricDt.Clear();
                    sda.Fill(MetricDt);
                    MetricGrid.DataSource = MetricDt;
                    MetricGrid.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

                conn.Close();
            }
        }
    }

    [Serializable]
    public class ChartData
    {
        public string Quarter;
        public double Value;
        public ChartData(string quarter, double value)
        {
            this.Quarter = quarter;
            this.Value = value;
        }
    }
}
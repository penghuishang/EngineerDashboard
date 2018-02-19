using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace EngineerDashboard
{
    public partial class DashboardPage : System.Web.UI.Page
    {

        public DataTable depart;
        public DataTable metric;
        public DataTable dep_des;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connString = "Data Source=engineeringdashboard.csop8pundmxb.us-west-2.rds.amazonaws.com,1433;Initial Catalog=Engineering;User ID=admin;Password=123456";
                SqlConnection myConnection = new SqlConnection(connString);
                depart = new DataTable("Depart");
                metric = new DataTable("Metirc");
                dep_des = new DataTable("dep_des");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.Connection = myConnection;
                cmd.CommandText = "select * from Department";
                cmd.CommandType = CommandType.Text;
                da.SelectCommand = cmd;
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                da.Fill(depart);
                cmd.CommandText = "select Category,Measure,VALUE from Month_ResearchAllAggregated";
                da.SelectCommand = cmd;
                da.Fill(metric);

                Session["SqlDepartment"] = depart;
                Session["SqlMetric"] = metric;
                dataBind();
            }
        }

        protected void dataBind()
        {
            DepartGrid.DataSource = (DataTable)Session["SqlDepartment"];
            DepartGrid.DataBind();
            MetricGrid.DataSource = (DataTable)Session["SqlMetric"];
            MetricGrid.DataBind();
        }

        protected void button_Click(object sender, EventArgs e)
        {

        }
    }
}
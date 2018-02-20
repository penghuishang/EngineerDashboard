using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Collections;
using System.Data.OleDb;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web;
using System.Net.Mail;
using System.IO;
using System.Web.Mail;
using Microsoft.Office;
using Microsoft.Office.Core;
using Outlook = Microsoft.Office.Interop.Outlook;
using Excel = Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using System.Security.Principal;
using System.Threading;
using System.Configuration;
using System.Linq;
using Microsoft.Ajax.Utilities;
using System.Windows.Forms;
using Syncfusion.JavaScript.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.Entity;
using System.Web.UI;
using System.Reflection;

namespace EngineerDashboard
{


    public partial class ImportExclePage : System.Web.UI.Page
    {
        private static string Path;
        private static string fileNameWithoutExtension;
        private static DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
                {
                    conn.Open();
                    try
                    {
                        string query = "select * from dbo.[Awards_by_Admin_Unit]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        AwardsAdminUnit_Gird.DataSource = dt;
                        AwardsAdminUnit_Gird.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "select * from dbo.[Awards_by_Shared_Credit]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        AwardsSharedCredit_Gird.DataSource = dt;
                        AwardsSharedCredit_Gird.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "select * from dbo.[Expenditures_by_Admin_Unit]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ExpendituresAdminUnit_Grid.DataSource = dt;
                        ExpendituresAdminUnit_Grid.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "select * from dbo.[Expenditures_by_Shared_Credit]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ExpendituresSharedCredit_Grid.DataSource = dt;
                        ExpendituresSharedCredit_Grid.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    try
                    {
                        string query = "select * from dbo.[Proposal]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Proposals_Grid.DataSource = dt;
                        Proposals_Grid.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                    conn.Close();
                }
            }
        }

        protected void ImportExcel_click(Object sender, EventArgs e)
        {
            Thread InvokeThread = new Thread(new ThreadStart(InvokeMethod));
            InvokeThread.SetApartmentState(ApartmentState.STA);
            InvokeThread.Start();
            InvokeThread.Join();          
        }

        private void InvokeMethod()
        {
            OpenFileDialog InvokeDialog = new OpenFileDialog();

            if (InvokeDialog.ShowDialog() == DialogResult.OK)
            {
                Path = InvokeDialog.FileName;
                fileNameWithoutExtension = System.IO.Path.GetFileNameWithoutExtension(Path);
                bind(Path, fileNameWithoutExtension);
            }
        }

        private void bind(string Path, string fileNameWithoutExtension)
        {
            string strConn = "Provider=Microsoft.Ace.OLEDB.12.0;" + "Data Source=" + Path + ";" + "Extended Properties='Excel 12.0;IMEX=1;hdr=yes;'";
             OleDbDataAdapter da = new OleDbDataAdapter("SELECT *  FROM [Sheet1$]", strConn);
             DataSet ds = new DataSet();        
             try
             {
                 da.Fill(ds);
                 dt = ds.Tables[0];
                 AwardsAdminUnit_Gird.DataSource = dt;
                 AwardsAdminUnit_Gird.DataBind();

                //if (dt != null)
                //{
                //    if (dt.Rows.Count > 0)
                //    {
                //        DataRow dr = null;
                //        for (int i = 0; i < dt.Rows.Count; i++)
                //        {
                //            dr = dt.Rows[i];
                //            string unit = dr["Unit"].ToString();
                //            string proposal = dr["Project"].ToString();
                //            string PI_name = dr["Principal Investigator Name"].ToString();
                //            string Dept = dr["Deptid Descr"].ToString();
                //            string purpose = dr["Purpose"].ToString();
                //            string sponsorName = dr["Sponsor Name"].ToString();
                //            string type = dr["Type"].ToString();
                //            string cfda = dr["CFDA"].ToString();
                //            string amount = dr["Sum Amount"].ToString();
                //            string contract = dr["Contract"].ToString();
                //            string customer = dr["Customer"].ToString();
                //            string dept = dr["Dept"].ToString();
                //            string Budget = dr["Budget Period"].ToString();
                //            string Ref = dr["Ref Awd"].ToString();
                //            string PI = dr["PI ID"].ToString();
                //            string LongDescr = dr["Long Descr"].ToString();
                //            string CSD = dr["CSD"].ToString();
                //            string CSDDescr = dr["CSD Descr"].ToString();
                //            string Department = dr["Department"].ToString();
                            
                //            DateTime Date = DateTime.Parse(dr["Date"].ToString());
                //            string format = "yyyy-MM-dd HH:mm:ss";
                //            string quarter = getQuarter(Date);

                //            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
                //            {
                //                conn.Open();

                //                string sql = "INSERT INTO[dbo].[Proposal]([Project],[Principal Investigator Name],[Deptid Descr],[Purpose]," +
                //                    "[Sponsor],[Type],[CFDA],[Sum Amount],[Contract],[Date],[Customer],[Dept],[Budget Period],[Ref Awd],[PI ID]," +
                //                    "[Long Descr],[CSD],[CSD Descr],[Department],[ID],[Quarter])" +
                //                    "values('" + unit + "','" + proposal + "','" + PI_name + "','" + Dept + "'," +
                //                    "'" + purpose + "','" + sponsorName + "','" + type + "','" + cfda + "','" + amount + "','" + contract + "','" + Date.ToString(format) + ""+
                //                    "'" + customer + "','" + dept + "','" + Budget + "','" + Ref + "','" + PI + "','" + LongDescr + "','" + CSD + "','" +
                //                    "'" + CSDDescr + "','" + Department + "',NEXT VALUE FOR dbo.Sequence,'" + quarter + "')";

                //                SqlCommand cmd = new SqlCommand(sql, conn);
                //                cmd.ExecuteNonQuery();
                //                conn.Close();
                //            }
                //        }
                    }
                }
                 }
             catch (Exception err)
             {
                 MessageBox.Show("Fail:" + err.ToString());
             }

        }

        protected void ConfirmImport_click(Object sender, EventArgs e)
        {
            MessageBox.Show("Happy");
        }


        protected void UpdatePanel_Unload(object sender, EventArgs e)
        {
            MethodInfo methodInfo = typeof(ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance)
                .Where(i => i.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")).First();
            methodInfo.Invoke(ScriptManager.GetCurrent(Page),
                new object[] { sender as UpdatePanel });
        }

        private string getQuarter(DateTime date)
        {
            string quarter = null;
            switch (date.Month)
            {
                case 1:
                    quarter = "Q1";
                    break;
                case 2:
                    quarter = "Q1";
                    break;
                case 3:
                    quarter = "Q1";
                    break;
                case 4:
                    quarter = "Q2";
                    break;
                case 5:
                    quarter = "Q2";
                    break;
                case 6:
                    quarter = "Q2";
                    break;
                case 7:
                    quarter = "Q3";
                    break;
                case 8:
                    quarter = "Q3";
                    break;
                case 9:
                    quarter = "Q3";
                    break;
                case 10:
                    quarter = "Q4";
                    break;
                case 11:
                    quarter = "Q4";
                    break;
                case 12:
                    quarter = "Q4";
                    break;
            }

            return quarter;
        }

        private void Insert_Proposal()
        {
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    dr = dt.Rows[i];
            //    string unit = dr["Unit"].ToString();
            //    string proposal = dr["Proposal"].ToString();
            //    string PI_name = dr["Principal Investigator Name"].ToString();
            //    string Dept = dr["Deptid Descr"].ToString();
            //    string status = dr["Status"].ToString();
            //    string type = dr["Type"].ToString();
            //    string sponsorName = dr["Sponsor Name"].ToString();
            //    string targetSponsor = dr["Target Sponsor"].ToString();
            //    string purpose = dr["Purpose"].ToString();
            //    string sponsorType = dr["Sponsor Type"].ToString();
            //    DateTime due = DateTime.Parse(dr["Due"].ToString());
            //    string format = "yyyy-MM-dd HH:mm:ss";
            //    string quarter = null;

            //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
            //    {
            //        conn.Open();

            //        string sql = "INSERT INTO[dbo].[Proposal]([ID],[Unit],[Proposal],[Principal Investigator Name]," +
            //            "[Deptid Descr],[Status],[Type],[Sponsor],[Target Sponsor],[Purpose],[Sponsor Type],[Due],[Quarter])" +
            //            "values(NEXT VALUE FOR dbo.Sequence,'" + unit + "','" + proposal + "','" + PI_name + "','" + Dept + "'," +
            //            "'" + status + "','" + type + "','" + sponsorName + "','" + targetSponsor + "','" + purpose + "','" +
            //            "" + sponsorType + "','" + due.ToString(format) + "','" + quarter + "')";

            //        SqlCommand cmd = new SqlCommand(sql, conn);
            //        cmd.ExecuteNonQuery();
            //        conn.Close();
            //    }
            }
        private void Insert_AwardsAminUnit()
        {
            //for (int i = 0; i < dt.Rows.Count; i++)
            //{
            //    dr = dt.Rows[i];
            //    string unit = dr["Unit"].ToString();
            //    string proposal = dr["Project"].ToString();
            //    string PI_name = dr["Principal Investigator Name"].ToString();
            //    string Dept = dr["Deptid Descr"].ToString();
            //    string purpose = dr["Purpose"].ToString();
            //    string sponsorName = dr["Sponsor Name"].ToString();
            //    string type = dr["Type"].ToString();
            //    string cfda = dr["CFDA"].ToString();
            //    string amount = dr["Sum Amount"].ToString();
            //    string contract = dr["Contract"].ToString();
            //    string customer = dr["Customer"].ToString();
            //    string dept = dr["Dept"].ToString();
            //    string Budget = dr["Budget Period"].ToString();
            //    string Ref = dr["Ref Awd"].ToString();
            //    string PI = dr["PI ID"].ToString();
            //    string LongDescr = dr["Long Descr"].ToString();
            //    string CSD = dr["CSD"].ToString();
            //    string CSDDescr = dr["CSD Descr"].ToString();
            //    string Department = dr["Department"].ToString();

            //    DateTime Date = DateTime.Parse(dr["Date"].ToString());
            //    string format = "yyyy-MM-dd HH:mm:ss";
            //    string quarter = getQuarter(Date);

            //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
            //    {
            //        conn.Open();

            //        string sql = "INSERT INTO[dbo].[Proposal]([Project],[Principal Investigator Name],[Deptid Descr],[Purpose]," +
            //            "[Sponsor],[Type],[CFDA],[Sum Amount],[Contract],[Date],[Customer],[Dept],[Budget Period],[Ref Awd],[PI ID]," +
            //            "[Long Descr],[CSD],[CSD Descr],[Department],[ID],[Quarter])" +
            //            "values('" + unit + "','" + proposal + "','" + PI_name + "','" + Dept + "'," +
            //            "'" + purpose + "','" + sponsorName + "','" + type + "','" + cfda + "','" + amount + "','" + contract + "','" + Date.ToString(format) + "" +
            //            "'" + customer + "','" + dept + "','" + Budget + "','" + Ref + "','" + PI + "','" + LongDescr + "','" + CSD + "','" +
            //            "'" + CSDDescr + "','" + Department + "',NEXT VALUE FOR dbo.Sequence,'" + quarter + "')";

            //        SqlCommand cmd = new SqlCommand(sql, conn);
            //        cmd.ExecuteNonQuery();
            //        conn.Close();
            //    }
            //}
        }

    }
}
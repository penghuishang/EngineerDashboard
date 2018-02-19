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
            }
            catch (Exception err)
            {
                MessageBox.Show("Fail:" + err.ToString());
            }
        }

        protected void ConfirmImport_click(Object sender, EventArgs e)
        {
            if (dt != null)
            {
                //if (dt.Rows.Count > 0)
                //{
                //    DataRow dr = null;
                //    for (int i = 0; i < dt.Rows.Count; i++)
                //    {
                //        dr = dt.Rows[i];
                //        string name = dr[""].ToString();
                //        string sex = dr[""].ToString();
                //        string no = dr[""].ToString();
                //        string major = dr[""].ToString();

                //        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
                //        {
                //            conn.Open();
                //            string sql = "insert into dbo.t values('" + name + "','" + sex + "','" + no + "','" + major + "')";
                //            SqlCommand cmd = new SqlCommand(sql, conn);
                //            cmd.ExecuteNonQuery();
                //            conn.Close();
                //        }
                //    }                   
                //}               
            }         
        }
    }
}
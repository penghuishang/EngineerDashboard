using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace EngineerDashboard
{
    public partial class UserManagePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
                {
                    conn.Open();
                    try
                    {
                        string query = "select * from dbo.[User]";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        User_Grid.DataSource = dt;
                        User_Grid.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                    conn.Close();
                }                                       
            }
        }
    }
}
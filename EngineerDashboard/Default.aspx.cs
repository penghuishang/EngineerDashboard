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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LogIn(Object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EngineeringConnection"].ConnectionString))
            {
                con.Open();
                try
                {
                    string pawprint = Pawprint.Text;
                    string pwd = Password.Text;            
                    string query = "select Pawprint from dbo.[User] where Pawprint='" + pawprint + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        loginValidLabel.Text = "Login Sucess ";
                    }
                    else
                    {
                        loginValidLabel.Text = "Your User ID and/or Password are invalid ";

                    }                  
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                con.Close();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}
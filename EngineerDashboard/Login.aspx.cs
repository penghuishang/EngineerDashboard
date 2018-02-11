using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using EngineerDashboard.Models;


namespace EngineerDashboard
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(Object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
            try
            {
                string uid = Pawprint.Text;
                string pass = Password.Text;
                con.Open();
                string qry = "select Pawprint from dbo.User where Pawprint='" + uid + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    LoginSuccessMessage.Text = "Login Sucess ";
                }
                else
                {
                    LoginFailMessage.Text = "Your User ID and/or Password are invalid ";

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}
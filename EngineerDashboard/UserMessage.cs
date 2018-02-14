using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace EngineerDashboard
{
    public class UserMessage
    {
        string UserPawprint;
        string UserName;
        string UserEmail;
        string UserSecurity_Id;

        protected void GetUser(Object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.
                ConnectionStrings["EngineeringConnect"].ConnectionString))
            {
                con.Open();
                try
                {
                    string pawprint = Pawprint.Text;
                    string query = "select Pawprint,Name, Email, Security_Id from dbo.[User] where Pawprint='" + pawprint + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader reader = cmd.ExecuteReader();

                    UserPawprint = reader["Pawprint"].ToString();
                    UserName = reader["Name"].ToString();
                    UserEmail = reader["Email"].ToString();
                    UserSecurity_Id = reader["Security_Id"].ToString();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                con.Close();
            }
        }

        protected void SetUser(string Pawprint, string Name, string Email, string Security_Id)
        {
            Session["UserPawprint"] = Pawprint;
            Session["UserName"] = Name;
            Session["UserEmail"] = Email;
            Session["UserSecurity_Id"] = Security_Id;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace EngineerDashboard
{
    public class User
    {
        public string Pawprint { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Security_Id { get; set; }
    }
}
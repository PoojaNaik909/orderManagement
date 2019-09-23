using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WebApplication4
{
    public class clsglobal
    {
       
        public static MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        public static void androidappnoticountoffer()
        {
            using (con)
            {
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                using (MySqlCommand cmdadd = new MySqlCommand("insert into tbl_count(notitype,count,todoc) values(@notitype,@count,@todoc)", con))
                {
                    cmdadd.Parameters.AddWithValue("@notitype", "Offer");
                    cmdadd.Parameters.AddWithValue("@count", "1");
                    cmdadd.Parameters.AddWithValue("@todoc", "All");
                    cmdadd.ExecuteNonQuery();
                }
            }
        }
    }
}
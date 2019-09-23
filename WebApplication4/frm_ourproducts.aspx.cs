using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WebApplication4
{
    public partial class frm_ourproducts : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillrepeter("select * from tbl_products order by prodid desc");
            }
        }
        private void fillrepeter(string query)
        {
            using (con)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                using (MySqlDataAdapter da = new MySqlDataAdapter(query, con))
                {
                    da.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }



        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Select")
            {
                try
                {
                    string[] arg = new string[2];
                    arg = e.CommandArgument.ToString().Split('^');
                    Session["prodname"] = arg[0];
                    Session["prodamount"] = arg[1];
                    Response.Redirect("frm_makepayment.aspx");
                }
                catch
                {

                }
            }
        }
    }
}
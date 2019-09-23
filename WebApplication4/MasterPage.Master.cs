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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
      
        public Int32 noticount_glob = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if ("User" == Server.HtmlEncode(Request.Cookies["name"].Value))
                {
                    lbl_name.Text = Server.HtmlEncode(Request.Cookies["username"].Value);
                }
                else if ("Admin" == Server.HtmlEncode(Request.Cookies["name"].Value))
                {
                    lbl_name.Text = Server.HtmlEncode(Request.Cookies["username"].Value);
                }
                else
                {
                    lbl_name.Text = Server.HtmlEncode(Request.Cookies["name"].Value);
                }
            }

            if (lbl_name.Text=="pooja")
            {
                li_ourproducts.Visible = true;
                li_addproducts.Visible = false;

            }
            else if (lbl_name.Text == "Admin")
            {

                li_ourproducts.Visible = false;
                li_addproducts.Visible = true;
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);

                string struserid = "";

                if (Request.Cookies["uid"] != null)
                {
                    struserid = Request.Cookies["uid"].Value;
                }

                using (con)
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (MySqlCommand cmdupdate = new MySqlCommand("update tbl_user set flag = 0 where uid = @uid", con))
                    {
                        cmdupdate.Parameters.AddWithValue("@uid", struserid);
                        cmdupdate.ExecuteNonQuery();
                    }
                }
            }
            if (Request.Cookies["name"] != null)
            {
                Response.Cookies["name"].Expires = DateTime.Now.AddDays(-1);
            }
            Session.Abandon();
            Session.Clear();
            Response.Redirect("frm_login.aspx");
        }
    }
}
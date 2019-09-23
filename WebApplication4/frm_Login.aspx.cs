using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Net.NetworkInformation;
using System.Runtime.InteropServices;
using System.Net;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        MySqlDataReader dr;
        string str_username, str_password, str_name, str_docid, str_mobile;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                Response.Redirect("frm_home.aspx");
            }
        }
        public string GetMACAddress()
        {
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            String sMacAddress = string.Empty;
            foreach (NetworkInterface adapter in nics)
            {
                if (sMacAddress == String.Empty)// only return MAC Address from first card  
                {
                    IPInterfaceProperties properties = adapter.GetIPProperties();
                    sMacAddress = adapter.GetPhysicalAddress().ToString();
                }
            }
            return sMacAddress;
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            bool checkmac = false;
            if (txt_username.Text == "")
            {
                Label1.Text = "Enter Mobile No.";
                return;
            }
            if (txt_password.Text == "")
            {
                Label1.Text = "Enter Password";
                return;
            }

            if (ddl_type.Text == "User")
            {
                Response.Cookies["logintype"].Value = "user";
                Response.Cookies["logintype"].Expires = DateTime.Now.AddMinutes(45);
                using (con)
                {
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    using (MySqlCommand cmdselect = new MySqlCommand("Select * from tbl_user where mobile=@mobile", con))
                    {
                        cmdselect.Parameters.AddWithValue("@mobile", txt_username.Text);
                        using (dr = cmdselect.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    str_docid = dr["uid"].ToString();
                                    str_name = dr["username"].ToString();
                                    str_username = dr["emailid"].ToString();
                                    str_password = dr["pwd"].ToString();
                                    str_mobile = dr["mobile"].ToString();

                                    //Response.Cookies["cookie"].Value = "cookie value";
                                    //Response.Cookies["cookie"].Expires = DateTime.Now.AddMinutes(30); // add expiry time
                                }
                            }
                        }
                    }
                }

                if (txt_username.Text == str_mobile && txt_password.Text == str_password)
                {
                    Response.Cookies["name"].Value = str_name;
                    Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["user"].Value = str_username;
                    Response.Cookies["user"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["username"].Value = str_username;
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["docname"].Value = str_name;
                    Response.Cookies["docname"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["mobile"].Value = str_mobile;
                    Response.Cookies["mobile"].Expires = DateTime.Now.AddMinutes(45);
                    //Session["name"] = str_name;
                    //Session["user"] = str_username;
                    Response.Redirect("frm_home.aspx");
                }
                else
                {
                    Label1.Text = "Invalid Credentials";
                }
            }
            else if (ddl_type.Text == "Admin")
            {
                Response.Cookies["logintype"].Value = "Admin";
                Response.Cookies["logintype"].Expires = DateTime.Now.AddMinutes(45);

                using (con)
                {
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    using (MySqlCommand cmdselect = new MySqlCommand("Select * from tbl_login where username=@username", con))
                    {
                        cmdselect.Parameters.AddWithValue("@username", txt_username.Text);
                        using (dr = cmdselect.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    str_username = dr["username"].ToString();
                                    str_password = dr["password"].ToString();

                                    //Response.Cookies["cookie"].Value = "cookie value";
                                    //Response.Cookies["cookie"].Expires = DateTime.Now.AddMinutes(30); // add expiry time
                                }
                            }
                        }
                    }
                }

                if (txt_username.Text == str_username && txt_password.Text == str_password)
                {
                    Response.Cookies["name"].Value = "Admin";
                    Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["user"].Value = str_username;
                    Response.Cookies["user"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies["username"].Value = str_username;
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(45);
                    Response.Redirect("frm_home.aspx");
                }
                else
                {
                    Label1.Text = "Invalid Credentials";
                }
            }
           
        }
    }
}
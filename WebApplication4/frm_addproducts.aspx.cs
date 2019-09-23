using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Data;
using System.IO;
namespace WebApplication4
{
    public partial class frm_addproducts : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        DataTable dt = new DataTable();
        public static string strproductid = "";
        MySqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ("Admin" == (string)Session["name"])
            if ("Admin" == Server.HtmlEncode(Request.Cookies["name"].Value) || "User" == Server.HtmlEncode(Request.Cookies["name"].Value))
            {
                fillrepeter("select * from tbl_products order by prodid desc");
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Directory.Exists(Server.MapPath("~/products")))
                {
                    // Try to create the directory.
                    DirectoryInfo di = Directory.CreateDirectory(Server.MapPath("~/products"));
                }
            }
            catch
            {

            }

            String filename = "";
            if (FileUpload1.HasFile)
            {
                filename = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/products/" + filename));
            }
            using (con)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                using (MySqlCommand cmdadd = new MySqlCommand("insert into tbl_products(prodname,prodprice,proddescr,prodimg) values (@prodname,@prodprice,@proddescr,@prodimg)", con))
                {
                    cmdadd.Parameters.AddWithValue("@prodname", txt_productname.Text);
                    cmdadd.Parameters.AddWithValue("@prodprice", txt_productprice.Text);
                    cmdadd.Parameters.AddWithValue("@proddescr", txt_productdescr.Text);
                    cmdadd.Parameters.AddWithValue("@prodimg", filename);
                    cmdadd.ExecuteNonQuery();
                }
            }
            clsglobal.androidappnoticountoffer();
            string script = "alert(\"Product Added Successfully...\");";
            ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);
            txt_productname.Text = string.Empty;
            txt_productdescr.Text = string.Empty;
            txt_productprice.Text = string.Empty;
            fillrepeter("select * from tbl_products order by prodid desc");
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

        protected void btn_yes_del_Click(object sender, EventArgs e)
        {
            try
            {
                string file_name = "";
                using (con)
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (MySqlCommand cmdget = new MySqlCommand("select prodimg from tbl_products where prodid = @id", con))
                    {
                        cmdget.Parameters.AddWithValue("@id", strproductid);
                        using (dr = cmdget.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    file_name = dr["prodimg"].ToString();
                                }
                            }
                        }
                    }
                }

                string path = Server.MapPath("~/products/" + file_name);
                FileInfo file = new FileInfo(path);
                if (file.Exists)
                {
                    file.Delete();
                }

                using (con)
                {
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    using (MySqlCommand cmddelete = new MySqlCommand("Delete from tbl_products where prodid = @id", con))
                    {
                        cmddelete.Parameters.AddWithValue("@id", strproductid);
                        cmddelete.ExecuteNonQuery();

                    }
                    fillrepeter("select * from tbl_products order by prodid desc");

                }
            }
            catch (Exception)
            {

            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "View")
            {
                try
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('../products/" + e.CommandArgument.ToString() + "','_blank');", true);
                }
                catch (Exception)
                {

                }
            }
            if (e.CommandName == "Delete")
            {
                strproductid = (Convert.ToInt64(e.CommandArgument)).ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openmodeld();", true);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using MySql.Data.MySqlClient;

namespace WebApplication4
{
    public partial class frm_makepayment : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        public string action1 = string.Empty;
        public string txnid1 = string.Empty;
        public string hash1 = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                getdocdetails();
                if (!IsPostBack)
                {

                }
                else
                {
                    //frmError.Visible = true;
                }
                if (string.IsNullOrEmpty(Request.Form["hash"]))
                {
                    btn_makepayment.Visible = true;
                }
                else
                {
                    btn_makepayment.Visible = false;
                }

                if ((string)Session["prodamount"] != null)
                {
                    div_prodname.Visible = true;
                    txt_amount.ReadOnly = true;
                    txt_productname.ReadOnly = true;
                    txt_amount.Text = (string)Session["prodamount"];
                    txt_productname.Text = (string)Session["prodname"];

                }
                else
                {
                    div_prodname.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<span style='color:red'>" + ex.Message + "</span>");
            }
        }
        private void getdocdetails()
        {
            MySqlDataReader dr;

            string strmobile = Request.Cookies["mobile"].Value.ToString();

            using (con)
            {
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                using (MySqlCommand cmdget = new MySqlCommand("select username,mobile,emailid from tbl_user where mobile =@mobile", con))
                {
                    cmdget.Parameters.AddWithValue("@mobile", strmobile);
                    using (dr = cmdget.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                txt_docname.Text = dr["username"].ToString();
                                txt_mobile.Text = dr["mobile"].ToString();
                                txt_email.Text = dr["emailid"].ToString();
                            }
                        }
                    }
                }
            }
        }

        public string Generatehash512(string text)
        {

            byte[] message = Encoding.UTF8.GetBytes(text);

            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            return hex;

        }

        private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
        {
            //Set a name for the form
            string formID = "PostForm";
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" +
                           formID + "\" action=\"" + url +
                           "\" method=\"POST\">");

            foreach (System.Collections.DictionaryEntry key in data)
            {

                strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                               "\" value=\"" + key.Value + "\">");
            }


            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." + formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated.
            //(The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }


        protected void btn_makepayment_Click(object sender, EventArgs e)
        {
            // payment getway code will be here 

        }
    }
}
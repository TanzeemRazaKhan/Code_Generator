using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CodeGenerator : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null  )
        {           
            Response.Redirect("~/FrmLoginSA.aspx", false);
            return;
        }

    }

    protected void linkButton_Logout_Click(object sender, EventArgs e)
    {
        if (!Page.ClientScript.IsStartupScriptRegistered("confirmLogout"))
        {

            // Clear the cookies
            Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            // Redirect to the login page
            Response.Redirect("FrmLoginSA.aspx", false);
        }
        
    }
}

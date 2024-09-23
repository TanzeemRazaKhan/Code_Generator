using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public partial class IBPTLogin : System.Web.UI.Page
{
	SmartWeb a = new SmartWeb();
	protected void Page_Load(object sender, EventArgs e)
	{
        if (!IsPostBack)
        {
            if (Session["UserName"] != null )
            {
                txtUserName.Text = Session["UserName"].ToString();
              
               
            }
        }

    }


    // Function to get client IP address
    // Function to get client IP address
 //   private string GetClientIpAddress()
	//{
	//	string ipAddress = string.Empty;

	//	if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
	//	{
	//		ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
	//	}
	//	else if (Request.ServerVariables["REMOTE_ADDR"] != null)
	//	{
	//		ipAddress = Request.ServerVariables["REMOTE_ADDR"].ToString();
	//	}

	//	return ipAddress;
	//}

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string UserName = txtUserName.Text;
        string Password = txtPassword.Text;
        if(string.IsNullOrEmpty(UserName)|| string.IsNullOrEmpty(Password))
        {
            lblMessage.Text = "Please enter username and password.";
            divErrorMessage.Visible = true;
            return;
        }
        string storedUserName = "sa";
        string storedPassword = "123";

        if (UserName == storedUserName && Password == storedPassword)
        {
            Session["UserName"] = UserName;
            Response.Redirect("Default.aspx");
        }
        else
        {
            // Invalid username or password
            lblMessage.Text = "Invalid username/password. Please try again.";
            divErrorMessage.Visible = true;
        }
    }
}
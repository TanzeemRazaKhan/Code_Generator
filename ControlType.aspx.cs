using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlType : System.Web.UI.Page
{


    // This code Is Grid View Code
    SmartWeb a = new SmartWeb();

    // This code Is Grid View Code

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PanelGrdView.Visible = true;
            PanelAdd.Visible = false;
            PanelEdit.Visible = false;
            FillGrdView();
            if (Request.QueryString["action"] == null && Request.QueryString["Id"] != null)
            {
                EditReadData();
            }
        }
    }
    public void FillGrdView()
    {
        DataTable dummy = new DataTable();
        dummy.Columns.Add("ValidationType");
        dummy.Columns.Add("ControlType");
        dummy.Columns.Add("Edit");
        dummy.Columns.Add("Delete");
        dummy.Rows.Add();
        gvv.DataSource = dummy;
        gvv.DataBind();
        gvv.UseAccessibleHeader = true;
        gvv.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (Request.QueryString["action"] != null && Request.QueryString["Id"] != null)
        {
            litmsg.Text = "<i class='fas fa-trash-alt' style='color: red;'></i> Delete Record";
            litid2.Text = "Are you sure to delete record?";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myconfirm", "OpenConfirmDialog('');", true);
        }
    }
    [WebMethod(EnableSession = true)]
    public static List<myView> GetData()
    {
       
        List<myView> listView = new List<myView>();
        string constr = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
        string query = "SELECT Id, ISNULL(ValidationType, 'Nullable ') AS ValidationType, ISNULL(ControlType, 'Nullable ') AS ControlType FROM GDMstValidation WHERE IsDeleted = 0 ORDER BY Id DESC;";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            listView.Add(new myView
            {
                ValidationType = sdr["ValidationType"].ToString(),
                ControlType = sdr["ControlType"].ToString(),
                Id = Convert.ToInt32(sdr["Id"].ToString())
            });
        }
        sdr.Close();
        con.Close();
        return listView;
    }
    public class myView
    {
        public string ValidationType { get; set; }
        public string ControlType { get; set; }
        public int Id { get; set; }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        PanelGrdView.Visible = false;
        PanelAdd.Visible = true;
        PanelEdit.Visible = false;
    }

    protected void BtnDelete_Click(object sender, EventArgs e)
    {
        PanelAdd.Visible = false;
        PanelEdit.Visible = false;
        if (Request.QueryString["action"] != null && Request.QueryString["Id"] != null)
        {
            a.execute_query("UPDATE GDMstValidation SET IsDeleted = 1 where Id='" + Request.QueryString["Id"].ToString() + "' ");
            Response.Redirect("ControlType.aspx", false);
        }
    }

    //End Code Of GridView

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
        string selectedTable = "GDMstValidation";
        string insertQuery = "INSERT INTO " + selectedTable + " (ValidationType,ControlType) VALUES (@ValidationType,@ControlType)";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
            {
                cmd.Parameters.AddWithValue("@ValidationType", txtValidationType.Text);
                cmd.Parameters.AddWithValue("@ControlType", txtControlType.Text);
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                bool passwordChangeSuccessful = true;
                if (passwordChangeSuccessful)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "successWithRedirect('Saved Successfully', 'green', 'success');", true);
                }
                // You can add further logic or redirect the user as needed
            }
        }
    }

    // This code Is EditReadData 

    public void EditReadData()
    {
        if (Request.QueryString["Id"] != null)
        {
            int pid = Convert.ToInt32(Request.QueryString["Id"].ToString());
            PanelEdit.Visible = true;
            PanelGrdView.Visible = false;
            string selectedTable = "GDMstValidation";
            string primaryKeyID = "Id";
            SqlDataReader rd = a.GetDatareader("SELECT ValidationType,ControlType FROM GDMstValidation WHERE Id  = '" + pid + "'");
            while (rd.Read())
            {
                txtEditValidationType.Text = rd["ValidationType"].ToString();
                txtEditControlType.Text = rd["ControlType"].ToString();
            }
            rd.Close();
        }
    }
    protected void btnEditUpdate_Click(object sender, EventArgs e)
    {
        int pid = Convert.ToInt32(Request.QueryString["Id"].ToString());
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
        cmd.Connection = conn;
        string selectedTable = "GDMstValidation";
        string insqry = "update " + selectedTable + " set ValidationType = @ValidationType, ControlType = @ControlType WHERE Id  = '" + pid + "'";
        cmd = new SqlCommand(insqry, conn);
        cmd.Parameters.AddWithValue("@ValidationType", txtEditValidationType.Text);
        cmd.Parameters.AddWithValue("@ControlType", txtEditControlType.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        bool passwordChangeSuccessful = true;
        if (passwordChangeSuccessful)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "successWithRedirect('Update Data Saved Successfully', 'green', 'success');", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        PanelGrdView.Visible = true;
        PanelAdd.Visible = false;
        PanelEdit.Visible = false;
        Response.Redirect("ControlType.aspx");
    }



}
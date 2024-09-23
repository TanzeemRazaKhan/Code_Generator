
// This code Is Grid View Code

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PanelGrdView.Visible = true;
            PanelAdd.Visible = false;
            PanelEdit.Visible = false;
            FillGrdView();
            if (Request.QueryString["action"] == null && Request.QueryString["RABillId"] != null)
            {
                EditReadData();
            }
        }
    }
    public void FillGrdView()
    {
        DataTable dummy = new DataTable();
        dummy.Columns.Add("RABillNo");
        dummy.Columns.Add("OrgCode");
        dummy.Columns.Add("UserId");
        dummy.Columns.Add("CustCode");
        dummy.Columns.Add("ProjectCode");
        dummy.Columns.Add("BOQCode");
        dummy.Columns.Add("RABillDate");
        dummy.Columns.Add("ContraCode");
        dummy.Columns.Add("HeadNum");
        dummy.Columns.Add("SubHeadNum");
        dummy.Columns.Add("Unit");
        dummy.Columns.Add("WorkDoneAmount");
        dummy.Columns.Add("PreviousWorkAmount");
        dummy.Columns.Add("TotalWorkAmount");
        dummy.Columns.Add("Deductions");
        dummy.Columns.Add("NetPayableAmount");
        dummy.Columns.Add("CreatedByEmpCode");
        dummy.Columns.Add("Remark");
        dummy.Columns.Add("PaymentStatus");
        dummy.Columns.Add("Status");
        dummy.Columns.Add("Edit");
        dummy.Columns.Add("Delete");
        dummy.Rows.Add();
        gvv.DataSource = dummy;
        gvv.DataBind();
        gvv.UseAccessibleHeader = true;
        gvv.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (Request.QueryString["action"] != null && Request.QueryString["RABillId"] != null)
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
string query = "SELECT RABillId, RABillNo,OrgCode,UserId,CustCode,ProjectCode,BOQCode,RABillDate,ContraCode,HeadNum,SubHeadNum,Unit,WorkDoneAmount,PreviousWorkAmount,TotalWorkAmount,Deductions,NetPayableAmount,CreatedByEmpCode,Remark,PaymentStatus,Status FROM PMMstRABill WHERE IsDeleted = 0 ORDER BY RABillId DESC";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            listView.Add(new myView
            {
 RABillNo = sdr["RABillNo"].ToString(),
 OrgCode = sdr["OrgCode"].ToString(),
 UserId = sdr["UserId"].ToString(),
 CustCode = sdr["CustCode"].ToString(),
 ProjectCode = sdr["ProjectCode"].ToString(),
 BOQCode = sdr["BOQCode"].ToString(),
 RABillDate = Convert.ToDateTime(sdr["RABillDate"]).ToString("dd-MM-yyyy"),
 ContraCode = sdr["ContraCode"].ToString(),
 HeadNum = sdr["HeadNum"].ToString(),
 SubHeadNum = sdr["SubHeadNum"].ToString(),
 Unit = sdr["Unit"].ToString(),
 WorkDoneAmount = sdr["WorkDoneAmount"].ToString(),
 PreviousWorkAmount = sdr["PreviousWorkAmount"].ToString(),
 TotalWorkAmount = sdr["TotalWorkAmount"].ToString(),
 Deductions = sdr["Deductions"].ToString(),
 NetPayableAmount = sdr["NetPayableAmount"].ToString(),
 CreatedByEmpCode = sdr["CreatedByEmpCode"].ToString(),
 Remark = sdr["Remark"].ToString(),
 PaymentStatus = sdr["PaymentStatus"].ToString(),
 Status = sdr["Status"].ToString(),
                RABillId = Convert.ToInt32(sdr["RABillId"].ToString())
            });
        }
        sdr.Close();
        con.Close();
        return listView;
    }
    public class myView
    {
public string RABillNo { get; set; }
public string OrgCode { get; set; }
public string UserId { get; set; }
public string CustCode { get; set; }
public string ProjectCode { get; set; }
public string BOQCode { get; set; }
public string RABillDate { get; set; }
public string ContraCode { get; set; }
public string HeadNum { get; set; }
public string SubHeadNum { get; set; }
public string Unit { get; set; }
public string WorkDoneAmount { get; set; }
public string PreviousWorkAmount { get; set; }
public string TotalWorkAmount { get; set; }
public string Deductions { get; set; }
public string NetPayableAmount { get; set; }
public string CreatedByEmpCode { get; set; }
public string Remark { get; set; }
public string PaymentStatus { get; set; }
public string Status { get; set; }
        public int RABillId { get; set; }
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
    if (Request.QueryString["action"] != null && Request.QueryString["RABillId"] != null)
    {
        a.execute_query("UPDATE PMMstRABill SET IsDeleted = 1 where RABillId='" + Request.QueryString["RABillId"].ToString() + "' ");
        Response.Redirect("FrmPMMstRABill.aspx", false);
    }
}

//End Code Of GridView

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
string selectedTable = "PMMstRABill";
string insertQuery = "INSERT INTO " + selectedTable + " (RABillNo,OrgCode,UserId,CustCode,ProjectCode,BOQCode,RABillDate,ContraCode,HeadNum,SubHeadNum,Unit,WorkDoneAmount,PreviousWorkAmount,TotalWorkAmount,Deductions,NetPayableAmount,CreatedByEmpCode,Remark,PaymentStatus,Status) VALUES (@RABillNo,@OrgCode,@UserId,@CustCode,@ProjectCode,@BOQCode,@RABillDate,@ContraCode,@HeadNum,@SubHeadNum,@Unit,@WorkDoneAmount,@PreviousWorkAmount,@TotalWorkAmount,@Deductions,@NetPayableAmount,@CreatedByEmpCode,@Remark,@PaymentStatus,@Status)";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
            {
cmd.Parameters.AddWithValue("@RABillNo", txtRABillNo.Text);
cmd.Parameters.AddWithValue("@CustCode", ddlCustCode.SelectedValue);
cmd.Parameters.AddWithValue("@ProjectCode", ddlProjectCode.SelectedValue);
cmd.Parameters.AddWithValue("@BOQCode", ddlBOQCode.SelectedValue);
cmd.Parameters.AddWithValue("@RABillDate", txtRABillDate.Text);
cmd.Parameters.AddWithValue("@ContraCode", txtContraCode.Text);
cmd.Parameters.AddWithValue("@HeadNum", ddlHeadNum.SelectedValue);
cmd.Parameters.AddWithValue("@SubHeadNum", ddlSubHeadNum.SelectedValue);
cmd.Parameters.AddWithValue("@Unit", ddlUnit.SelectedValue);
cmd.Parameters.AddWithValue("@WorkDoneAmount", txtWorkDoneAmount.Text);
cmd.Parameters.AddWithValue("@PreviousWorkAmount", txtPreviousWorkAmount.Text);
cmd.Parameters.AddWithValue("@TotalWorkAmount", txtTotalWorkAmount.Text);
cmd.Parameters.AddWithValue("@Deductions", txtDeductions.Text);
cmd.Parameters.AddWithValue("@NetPayableAmount", txtNetPayableAmount.Text);
cmd.Parameters.AddWithValue("@CreatedByEmpCode", ddlCreatedByEmpCode.SelectedValue);
cmd.Parameters.AddWithValue("@Remark", txtRemark.Text);
cmd.Parameters.AddWithValue("@PaymentStatus", ddlPaymentStatus.SelectedValue);
cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "successWithRedirect('Saved Successfully', 'green', 'success');", true);
                // You can add further logic or redirect the user as needed
            }
        }
    }

// This code Is EditReadData 

public void EditReadData()
{
    if (Request.QueryString["RABillId"] != null)
    {
        int pid = Convert.ToInt32(Request.QueryString["RABillId"].ToString());
        PanelEdit.Visible = true;
        PanelGrdView.Visible = false;
string selectedTable = "PMMstRABill";
string primaryKeyID = "RABillId";
SqlDataReader rd = a.GetDatareader("SELECT RABillNo, CustCode, ProjectCode, BOQCode, RABillDate, ContraCode, HeadNum, SubHeadNum, Unit, WorkDoneAmount, PreviousWorkAmount, TotalWorkAmount, Deductions, NetPayableAmount, CreatedByEmpCode, Remark, PaymentStatus, Status FROM PMMstRABill WHERE RABillId  = '"  +pid+  "'");
        while (rd.Read())
        {
txtEditRABillNo.Text = rd["RABillNo"].ToString();
ddlEditCustCode.SelectedValue  = rd["CustCode"].ToString();
ddlEditProjectCode.SelectedValue  = rd["ProjectCode"].ToString();
ddlEditBOQCode.SelectedValue  = rd["BOQCode"].ToString();
txtEditRABillDate.Text = rd["RABillDate"].ToString();
txtEditContraCode.Text = rd["ContraCode"].ToString();
ddlEditHeadNum.SelectedValue  = rd["HeadNum"].ToString();
ddlEditSubHeadNum.SelectedValue  = rd["SubHeadNum"].ToString();
ddlEditUnit.SelectedValue  = rd["Unit"].ToString();
txtEditWorkDoneAmount.Text = rd["WorkDoneAmount"].ToString();
txtEditPreviousWorkAmount.Text = rd["PreviousWorkAmount"].ToString();
txtEditTotalWorkAmount.Text = rd["TotalWorkAmount"].ToString();
txtEditDeductions.Text = rd["Deductions"].ToString();
txtEditNetPayableAmount.Text = rd["NetPayableAmount"].ToString();
ddlEditCreatedByEmpCode.SelectedValue  = rd["CreatedByEmpCode"].ToString();
txtEditRemark.Text = rd["Remark"].ToString();
ddlEditPaymentStatus.SelectedValue  = rd["PaymentStatus"].ToString();
ddlEditStatus.SelectedValue  = rd["Status"].ToString();
        }
        rd.Close();
    }
}
    protected void btnEditUpdate_Click(object sender, EventArgs e)
    {
int pid = Convert.ToInt32(Request.QueryString["RABillId"].ToString());
SqlConnection conn = new SqlConnection();
SqlCommand cmd = new SqlCommand();
conn.ConnectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
cmd.Connection = conn;
string selectedTable = "PMMstRABill";
string insqry = "update " + selectedTable + " set RABillNo = @RABillNo, CustCode = @CustCode, ProjectCode = @ProjectCode, BOQCode = @BOQCode, RABillDate = @RABillDate, ContraCode = @ContraCode, HeadNum = @HeadNum, SubHeadNum = @SubHeadNum, Unit = @Unit, WorkDoneAmount = @WorkDoneAmount, PreviousWorkAmount = @PreviousWorkAmount, TotalWorkAmount = @TotalWorkAmount, Deductions = @Deductions, NetPayableAmount = @NetPayableAmount, CreatedByEmpCode = @CreatedByEmpCode, Remark = @Remark, PaymentStatus = @PaymentStatus, Status = @Status WHERE RABillId  = '"  +pid+  "'";
    cmd = new SqlCommand(insqry, conn);
cmd.Parameters.AddWithValue("@RABillNo", txtEditRABillNo.Text);
cmd.Parameters.AddWithValue("@CustCode", ddlEditCustCode.SelectedValue);
cmd.Parameters.AddWithValue("@ProjectCode", ddlEditProjectCode.SelectedValue);
cmd.Parameters.AddWithValue("@BOQCode", ddlEditBOQCode.SelectedValue);
cmd.Parameters.AddWithValue("@RABillDate", txtEditRABillDate.Text);
cmd.Parameters.AddWithValue("@ContraCode", txtEditContraCode.Text);
cmd.Parameters.AddWithValue("@HeadNum", ddlEditHeadNum.SelectedValue);
cmd.Parameters.AddWithValue("@SubHeadNum", ddlEditSubHeadNum.SelectedValue);
cmd.Parameters.AddWithValue("@Unit", ddlEditUnit.SelectedValue);
cmd.Parameters.AddWithValue("@WorkDoneAmount", txtEditWorkDoneAmount.Text);
cmd.Parameters.AddWithValue("@PreviousWorkAmount", txtEditPreviousWorkAmount.Text);
cmd.Parameters.AddWithValue("@TotalWorkAmount", txtEditTotalWorkAmount.Text);
cmd.Parameters.AddWithValue("@Deductions", txtEditDeductions.Text);
cmd.Parameters.AddWithValue("@NetPayableAmount", txtEditNetPayableAmount.Text);
cmd.Parameters.AddWithValue("@CreatedByEmpCode", ddlEditCreatedByEmpCode.SelectedValue);
cmd.Parameters.AddWithValue("@Remark", txtEditRemark.Text);
cmd.Parameters.AddWithValue("@PaymentStatus", ddlEditPaymentStatus.SelectedValue);
cmd.Parameters.AddWithValue("@Status", ddlEditStatus.SelectedValue);
conn.Open();
cmd.ExecuteNonQuery();
conn.Close();
    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "successWithRedirect('Update Data Saved Successfully', 'green', 'success');", true);
}

protected void btnCancel_Click(object sender, EventArgs e)
{
    PanelGrdView.Visible = true;
    PanelAdd.Visible = false;
    PanelEdit.Visible = false;
    Response.Redirect("FrmPMMstRABill.aspx");
}


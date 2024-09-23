using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MultiCodeGenerator : System.Web.UI.Page
{
    Controaltype ControlType = new Controaltype();
    SmartWeb a = new SmartWeb();
    string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDatabaseNames();

            // GrdLoadColumnNames();
        }
    }

    // Retrieve database names
    private void LoadDatabaseNames()
    {
        ddlDatabases.Items.Clear(); // Clear existing items
        ddlDatabases.Items.Insert(0, "Select The Databases Name");
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT name FROM sys.databases", connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string databaseName = reader.GetString(0);
                ddlDatabases.Items.Add(databaseName);
            }
        }
    }

    // Get The Table Name From The Database
    private void LoadTableNames(string databaseName)
    {
        ddlTables.Items.Clear(); // Clear existing items
        ddlTables.Items.Insert(0, "Select The Table Name");
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            //SqlCommand command = new SqlCommand($"SELECT TABLE_NAME FROM {databaseName}.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", connection);
            SqlCommand command = new SqlCommand("SELECT TABLE_NAME FROM " + databaseName + ".INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", connection);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string tableName = reader.GetString(0);
                ddlTables.Items.Add(tableName);
            }
        }
        // ListBoxColuName.Text = "";
    }

    // Show Colunm Name For GridView
    protected void GrdLoadColumnNames()
    {
        string selectedTableName = ddlTables.SelectedValue;
        string databaseName = ddlDatabases.SelectedValue;
        string dataSource = "DESKTOP-82OSQ6M";
        string userID = "tanzeem";
        string password = "123";
        string connectionstring = "Data Source=" + dataSource + ";Initial Catalog=" + databaseName + "; User ID=" + userID + "; Password=" + password + ";MultipleActiveResultSets=True;Application Name=EntityFramework";

        using (SqlConnection connection = new SqlConnection(connectionstring))
        {
            connection.Open();
            SqlCommand command = new SqlCommand(@"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName AND COLUMN_NAME NOT IN ('TransDate', 'IsDeleted')  AND COLUMN_NAME NOT IN (SELECT column_name FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1 AND table_name = @TableName)", connection);

            command.Parameters.AddWithValue("@TableName", selectedTableName);
            SqlDataReader reader = command.ExecuteReader();

            // Create a DataTable to store the data
            DataTable dt = new DataTable();
            // Add your columns to the DataTable
            dt.Columns.Add("ColumnName", typeof(string));
            dt.Columns.Add("DataType", typeof(string));

            // Populate the DataTable with column names and data types from the database
            while (reader.Read())
            {
                string columnName = reader["COLUMN_NAME"].ToString();
                string dataType = reader["DATA_TYPE"].ToString();
                dt.Rows.Add(columnName, dataType);
            }

            // Bind the DataTable to the GridView
            GridViewColumns.DataSource = dt;
            GridViewColumns.DataBind();
            GridViewColumns.Visible = true;
        }
    }
    // Get The PrimaryKey From The Database
    public string GetPrimaryKey(string tableName)
    {
        string primaryKeyColumnName = "";
        string selectedTableName = ddlTables.SelectedValue;
        string databaseName = ddlDatabases.SelectedValue;
        string dataSource = "DESKTOP-82OSQ6M";
        string userID = "tanzeem";
        string password = "1234";
        string connectionstring = "Data Source=" + dataSource + ";Initial Catalog=" + databaseName + "; User ID=" + userID + "; Password=" + password + "; MultipleActiveResultSets=True; Application Name=EntityFramework";

        using (SqlConnection connection = new SqlConnection(connectionstring))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME), 'IsPrimaryKey') = 1 AND TABLE_NAME = @TableName", connection);
            command.Parameters.AddWithValue("@TableName", tableName);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                primaryKeyColumnName = reader.GetString(0);
            }
        }

        return primaryKeyColumnName;
    }
    // Start Validation DropDown Name Bind 
    protected void PopulateDropDownListsInGridView(string databaseName)
    {
        foreach (GridViewRow row in GridViewColumns.Rows)
        {
            DropDownList ddlValidation = (DropDownList)row.FindControl("ddlValidation");
            ddlListValidation(ddlValidation);
            DropDownList ddlControlType = (DropDownList)row.FindControl("ddlControlType");
            ddlListControlType(ddlControlType);
            DropDownList ddlTablesName = (DropDownList)row.FindControl("ddlTablesName");
            ddlGrdViewTable(ddlTablesName, databaseName);

        }
    }
    protected void ddlGrdViewTable(DropDownList ddl, string databaseName)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;

        ddl.Items.Clear(); // Clear existing items
        ddl.Items.Insert(0, new ListItem("-- Select Table Name--", ""));

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = String.Format("SELECT TABLE_NAME FROM {0}.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", databaseName);
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string tableName = reader.GetString(0);
                ddl.Items.Add(tableName);
            }
        }


    }
    protected void ddlListValidation(DropDownList ddl)
    {

        string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
        string query = "SELECT ValidationType  FROM GDMstValidation WHERE IsDeleted = 0";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {

                DataTable dt = new DataTable();
                connection.Open();
                adapter.Fill(dt);
                connection.Close();

                // Filter out NULL values from the DataTable
                DataTable filteredDt = dt.AsEnumerable()
                    .Where(row => !row.IsNull("ValidationType"))
                    .CopyToDataTable();
                ddl.DataSource = filteredDt;
                ddl.DataTextField = "ValidationType";
                ddl.DataValueField = "ValidationType";
                ddl.DataBind();

                //// Insert a default item in the DropDownList
                //ddl.Items.Insert(0, new ListItem("-- Select Validation --", ""));



            }
        }

        ddl.Items.Insert(0, new ListItem("-- Select Validation--", ""));
    }
    protected void ddlListControlType(DropDownList ddl)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
        string query = "SELECT ControlType FROM GDMstValidation WHERE IsDeleted = 0";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                DataTable dt = new DataTable();
                connection.Open();
                adapter.Fill(dt);
                connection.Close();
                // Filter out NULL values from the DataTable
                DataTable filteredDt = dt.AsEnumerable()
                    .Where(row => !row.IsNull("ControlType"))
                    .CopyToDataTable();
                ddl.DataSource = filteredDt;
                ddl.DataTextField = "ControlType";
                ddl.DataValueField = "ControlType";
                ddl.DataBind();
            }
        }
        ddl.Items.Insert(0, new ListItem("-- Select ControlType--", ""));
    }
    // End Validation DropDown Name Bind

    protected string GetColumnDataType(string selectedTableName, string columnName)
    {
        string dataType = string.Empty;
        string databaseName = ddlDatabases.SelectedValue;
        string dataSource = "DESKTOP-82OSQ6M";
        string userID = "tanzeem";
        string password = "1234";
        string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + databaseName + "; User ID=" + userID + "; Password=" + password + ";MultipleActiveResultSets=True;Application Name=EntityFramework";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName AND COLUMN_NAME = @ColumnName", connection);
            command.Parameters.AddWithValue("@TableName", selectedTableName);
            command.Parameters.AddWithValue("@ColumnName", columnName);

            object result = command.ExecuteScalar();
            if (result != null)
            {
                dataType = result.ToString();
            }
        }

        return dataType;
    }

    protected void ddlDatabases_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDatabase = ddlDatabases.SelectedValue;
        LoadTableNames(selectedDatabase);
        GridViewColumns.Visible = false;

    }
    protected void ddlTables_SelectedIndexChanged(object sender, EventArgs e)
    {
        string databaseName = ddlDatabases.SelectedValue;
        string SelectedTableName = ddlTables.SelectedValue;
        GrdLoadColumnNames();
        PopulateDropDownListsInGridView(databaseName);


    }
    protected void ddlTablesName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlTablesName = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddlTablesName.NamingContainer;
        CheckBox CheckAddFrom = row.FindControl("CheckAddFrom") as CheckBox;
        CheckBox CheckEditFrom = row.FindControl("CheckEditFrom") as CheckBox;
        if (CheckAddFrom != null && CheckAddFrom.Checked || CheckEditFrom != null && CheckEditFrom.Checked)
        {
            if (row != null)
            {
                DropDownList ddlColunm = (DropDownList)row.FindControl("ddlColunm");
                string selectedTableName = ddlTablesName.SelectedValue;
                string databaseName = ddlDatabases.SelectedValue;
                ddlColunm.Items.Clear();
                string dataSource = "DESKTOP-82OSQ6M";
                string userID = "tanzeem";
                string password = "123";
                string connectionstring = "Data Source=" + dataSource + ";Initial Catalog=" + databaseName + "; User ID=" + userID + "; Password=" + password + ";MultipleActiveResultSets=True;Application Name=EntityFramework";

                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(@"SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName AND COLUMN_NAME NOT IN ('TransDate', 'IsDeleted') AND COLUMN_NAME NOT IN (SELECT column_name FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1 AND table_name = @TableName)", connection);

                    command.Parameters.AddWithValue("@TableName", selectedTableName);
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        string columnName = reader.GetString(0);
                        ddlColunm.Items.Add(new ListItem(columnName, columnName));
                    }
                }
            }
        }

        else
        {
            ddlTablesName.ClearSelection();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "popup", "successWithRedirect('Select The Panel Check box Please', 'green', 'warning');", true);
        }
    }
    protected void btnGenerateAspx_Click(object sender, EventArgs e)
    {
        string selectedTableNameId = ddlTables.SelectedValue;
        string primaryKeyId = GetPrimaryKey(selectedTableNameId);

        // Get The Data Base Name 
        string selectedDatabase = ddlDatabases.SelectedValue;
        string selectedTable = ddlTables.SelectedValue;

        //User Input Page Name
        string pageName = txtName.Text.Trim();

        // Ensure the page name is not empty
        if (string.IsNullOrEmpty(pageName))
        {
            return;
        }
        string dynamicPageContent = "";

        bool isCheckViewChecked = false;
        bool isCheckEditChecked = false;
        bool isCheckAddChecked = false;

        foreach (GridViewRow row in GridViewColumns.Rows)
        {
            CheckBox chkView = row.FindControl("CheckView") as CheckBox;
            CheckBox chkEdit = row.FindControl("CheckEditFrom") as CheckBox;
            CheckBox chkAdd = row.FindControl("CheckAddFrom") as CheckBox;
            if (chkView != null && chkView.Checked)
            {
                isCheckViewChecked = true;
            }
            if (chkAdd != null && chkAdd.Checked)
            {
                isCheckAddChecked = true;
            }
            if (chkEdit != null && chkEdit.Checked)
            {
                isCheckEditChecked = true;
            }
        }

        if (isCheckViewChecked)
        {
            //Panel 1
            dynamicPageContent += "<%@ Register Assembly=\"AjaxControlToolkit\" Namespace=\"AjaxControlToolkit\" TagPrefix=\"ajaxToolkit\" %>\n";
            dynamicPageContent += "<asp:Panel ID=\"PanelGrdView\" runat=\"server\" Width=\"100 %\" Visible=\"false\">\n";
            dynamicPageContent += "<ajaxToolkit:ToolkitScriptManager ID=\"sm1\" ScriptMode=\"Release\" runat=\"server\"></ajaxToolkit:ToolkitScriptManager>\n";
            dynamicPageContent += "<div class=\"page-wrapper\" style=\"min-height: 568px;\">\n";
            dynamicPageContent += "<div class=\"content container-fluid\">\n";
            dynamicPageContent += "<div class=\"page-header\">\n";
            dynamicPageContent += "<div class=\"row align-items-center\">\n";
            dynamicPageContent += "<div class=\"col\">\n";
            dynamicPageContent += "<h3 class=\"page-title\">myView Master</h3>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "<div class=\"col-auto float-end ms-auto\">\n";
            dynamicPageContent += "<div class=\"form-group mb-0\">\n";
            dynamicPageContent += "<div class=\"settings-btns\">\n";
            dynamicPageContent += "<asp:Button ID=\"btnAdd\" Text=\"Add New\" class=\"btn btn-orange\" runat=\"server\" OnClick=\"btnAdd_Click\" />\n";
            dynamicPageContent += "<asp:HyperLink class=\"btn btn-grey\" Text=\"Return\" runat=\"server\" NavigateUrl=\"#\"></asp:HyperLink>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "<div id=\"table-datatables\" class=\"table-responsive\">\n";
            dynamicPageContent += "<asp:GridView ID=\"gvv\" runat=\"server\" class=\"table table-nowrap mb-0\" EmptyDataText=\"No records found\" AutoGenerateColumns=\"false\">\n";
            dynamicPageContent += "<Columns>\n";
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    dynamicPageContent += "<asp:BoundField DataField=\"" + columnName + "\" HeaderText=\"" + columnName + "\" SortExpression=\"" + columnName + "\" />\n";
                }
            }
            dynamicPageContent += "<asp:BoundField DataField=\"Edit\" HeaderText=\"Edit\" SortExpression=\"Edit\" />\n";
            dynamicPageContent += "<asp:BoundField DataField=\"Delete\" HeaderText=\"Delete\" SortExpression=\"Delete\" />\n";
            dynamicPageContent += "</Columns>\n";
            dynamicPageContent += "<RowStyle HorizontalAlign=\"Center\"></RowStyle>\n";
            dynamicPageContent += "<HeaderStyle HorizontalAlign=\"Center\" />\n";
            dynamicPageContent += "<PagerStyle HorizontalAlign=\"Center\" CssClass=\"gridpaging\" />\n";
            dynamicPageContent += "</asp:GridView>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "<link href=\"../assets/css/Gridview.css\" rel=\"stylesheet\" />\n";
            dynamicPageContent += "<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n";
            dynamicPageContent += "<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js\"></script>\n";
            dynamicPageContent += "<script type=\"text/javascript\" src=\"https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js\"></script>\n";
            dynamicPageContent += "<link href=\"https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css\" rel=\"stylesheet\" type=\"text/css\" />\n";
            dynamicPageContent += "<script src=\"https://cdn.datatables.net/buttons/1.4.1/js/dataTables.buttons.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"//cdn.datatables.net/buttons/1.4.1/js/buttons.flash.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"https://cdn.datatables.net/buttons/1.4.1/js/buttons.html5.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/feather.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/plugins/slimscroll/jquery.slimscroll.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/script.js\"></script>\n";
            dynamicPageContent += "<script type=\"text/javascript\">\n";
            dynamicPageContent += "$(function () {\n";
            dynamicPageContent += "$.ajax({\n";
            dynamicPageContent += "type: \"POST\",\n";
            dynamicPageContent += "url: \"" + pageName + ".aspx/GetData\",\n";
            dynamicPageContent += "beforeSend: function () {\n";
            dynamicPageContent += "},\n";
            dynamicPageContent += "contentType: \"application/json; charset=utf-8\",\n";
            dynamicPageContent += "dataType: \"json\",\n";
            dynamicPageContent += "success: OnSuccess,\n";
            dynamicPageContent += "complete: function (data) {\n";
            dynamicPageContent += "},\n";
            dynamicPageContent += "failure: function (response) {\n";
            dynamicPageContent += "},\n";
            dynamicPageContent += "error: function (response) {\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "});\n";
            dynamicPageContent += "});\n";
            dynamicPageContent += "function OnSuccess(response) {\n";
            dynamicPageContent += "$(\"[id*=gvv]\").DataTable({\n";
            dynamicPageContent += "dom: 'Blfrtip',\n";
            dynamicPageContent += "pageLength: 8,\n";
            dynamicPageContent += "buttons: [\n";
            dynamicPageContent += "{\n";
            dynamicPageContent += "extend: 'excelHtml5',\n";
            dynamicPageContent += "text: 'Download Excel'\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "],\n";
            dynamicPageContent += "lengthChange: true,\n";
            dynamicPageContent += "lengthMenu: [8, 15, 25],\n";
            dynamicPageContent += "searching: true,\n";
            dynamicPageContent += "sorting: true,\n";
            dynamicPageContent += "order: [],\n";
            dynamicPageContent += "paging: true,\n";
            dynamicPageContent += "data: response.d,\n";
            // dynamicPageContent += "columns: [\n";
            List<string> columnNames = new List<string>();
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    columnNames.Add(columnName);
                }
            }
            dynamicPageContent += "columns: [\n";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    dynamicPageContent += "{\n";
                    dynamicPageContent += "data: '" + columnName + "',\n";
                    dynamicPageContent += "name: '" + columnName + "',\n";
                    dynamicPageContent += "},\n";
                }
            }

            string selectedTableName = ddlTables.SelectedValue;
            string primaryKey = GetPrimaryKey(selectedTableName);
            dynamicPageContent += "{\n";
            dynamicPageContent += "data: '" + primaryKey + "',\n";
            dynamicPageContent += "name: '" + primaryKey + "',\n";
            dynamicPageContent += "render: function (data, type, row, meta) {\n";
            dynamicPageContent += "return '<a class=\"d-inline-block fw-normal w-100 h-100 pe-auto text-primary\" style=\"text-align:justify;\" href=\"" + pageName + ".aspx?" + primaryKey + "=' + row." + primaryKey + " + '\"><i class=\"fas fa-edit\"></i></a>';\n";
            dynamicPageContent += "},\n";
            dynamicPageContent += "},\n";

            dynamicPageContent += "{\n";
            dynamicPageContent += "data: '" + primaryKey + "',\n";
            dynamicPageContent += "name: '" + primaryKey + "',\n";
            dynamicPageContent += "render: function (data, type, row, meta) {\n";
            dynamicPageContent += "return '<a class=\"d-inline-block fw-normal w-100 h-100 pe-auto text-danger\" style=\"text-align:justify;\" href=\"" + pageName + ".aspx?action=delete&" + primaryKey + "=' + row." + primaryKey + " + '\"><i class=\"fas fa-trash-alt\"></i></a>';\n";
            dynamicPageContent += "},\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "]\n";
            dynamicPageContent += "});\n";
            dynamicPageContent += "};\n";
            dynamicPageContent += "</script>\n";

            dynamicPageContent += "<script>\n";
            dynamicPageContent += "function OpenConfirmDialog(a) {\n";
            dynamicPageContent += "    $(\"#myModal2\").modal('show');\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "</script>\n";

            dynamicPageContent += "<div id=\"myModal2\" class=\"modal fade\">\n";
            dynamicPageContent += "    <div class=\"modal-dialog\">\n";
            dynamicPageContent += "        <div class=\"modal-content\">\n";
            dynamicPageContent += "            <div class=\"modal-header\">\n";
            dynamicPageContent += "                <p>\n";
            dynamicPageContent += "                    <asp:Literal ID=\"litmsg\" runat=\"server\"></asp:Literal>\n";
            dynamicPageContent += "                </p>\n";
            dynamicPageContent += "            </div>\n";
            dynamicPageContent += "            <p style=\"margin-top: 15px; margin-left: 15px;\">\n";
            dynamicPageContent += "                <asp:Literal ID=\"litid2\" runat=\"server\"></asp:Literal>\n";
            dynamicPageContent += "            </p>\n";
            dynamicPageContent += "            <div class=\"modal-body\">\n";
            dynamicPageContent += "                <div class=\"row\" style=\"margin-top: -25px;\">\n";
            dynamicPageContent += "                    <div class=\"input-field col s2 l2 m2\">\n";
            dynamicPageContent += "                        <asp:Button ID=\"BtnDelete\" OnClick=\"BtnDelete_Click\" BackColor=\"Red\" ForeColor=\"White\" class=\"mt-4 right btn waves-effect waves-light Click-here\" runat=\"server\" Text=\"Delete\" />\n";
            dynamicPageContent += "                        &nbsp;&nbsp;\n";
            dynamicPageContent += "                        <asp:Button ID=\"btnCancel\" BackColor=\"#3D5EE1\" ForeColor=\"White\" OnClick=\"btnCancel_Click\" class=\"mt-4 right btn waves-effect waves-light Click-here\" runat=\"server\" Text=\"Cancel\" />\n";
            dynamicPageContent += "                    </div>\n";
            dynamicPageContent += "                </div>\n";
            dynamicPageContent += "            </div>\n";
            dynamicPageContent += "        </div>\n";
            dynamicPageContent += "    </div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</asp:Panel>\n";
        }

        if (isCheckAddChecked)
        {

            dynamicPageContent += "<asp:Panel ID=\"PanelAdd\" runat=\"server\" Width=\"100%\" Visible=\"false\">";
            dynamicPageContent += "<div class=\"page-wrapper\">";
            dynamicPageContent += "<div class=\"content container-fluid\">";
            dynamicPageContent += "<div class=\"row\">";
            dynamicPageContent += "<div class=\"col-sm-12\">";
            dynamicPageContent += "<div class=\"card comman-shadow\">";
            dynamicPageContent += "<div class=\"card-body\">";
            dynamicPageContent += "<div class=\"row\">";
            dynamicPageContent += "<div class=\"col-12\">";
            dynamicPageContent += "<h5 class=\"form-title student-info\">Add Your hand</h5>";
            dynamicPageContent += "</div>";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;
                //  CheckBox chkAdd = row.FindControl("CheckAddFrom") as CheckBox;
                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkAdd = row.FindControl("CheckAddFrom") as CheckBox;
                    if (chkAdd != null && chkAdd.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        switch (selectedControlType)
                        {
                            case "TextBox":
                                dynamicPageContent += ControlType.GenerateTextBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    if (ddlControlType != null && ddlValidation != null)
                                    {

                                        CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                        if (CheckReq != null && CheckReq.Checked)
                                        {
                                            dynamicPageContent += ControlType.GenerateRequiredFieldValidator(columnName);
                                            break;
                                        }
                                    }

                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateAlphabetRegularExpression(columnName);
                                        break;

                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GeneratePinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "DropDownList ":
                                dynamicPageContent += ControlType.GenerateDropDownList(columnName);
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "CheckBox":
                                dynamicPageContent += ControlType.GenerateCheckBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateAlphabetRegularExpression(columnName);
                                        break;


                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GeneratePinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "ReadioButton":
                                dynamicPageContent += ControlType.GenerateReadioButton(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateAlphabetRegularExpression(columnName);
                                        break;



                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GeneratePinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "FileUpload":
                                dynamicPageContent += ControlType.GenerateFileUpload(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateRequiredFileFieldValidator(columnName);
                                        break;
                                    }
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "ListBox ":
                                dynamicPageContent += ControlType.GenerateListBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateAlphabetRegularExpression(columnName);
                                        break;


                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GeneratePinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "BindDropDown":
                                CheckBox selectCol = row.FindControl("CheckSelect") as CheckBox;
                                if (selectCol != null && selectCol.Checked)
                                {
                                    dynamicPageContent += ControlType.GenerateBindDropDownList(columnName);
                                    dynamicPageContent += "</div>\n";
                                    dynamicPageContent += "</div>\n";

                                }
                                break;
                            case "DateTime":
                                dynamicPageContent += ControlType.GenerateDateTime(columnName);
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;
                        }
                    }
                }
            }

            dynamicPageContent += "<div class=\"col-12\">\n";
            dynamicPageContent += "<div class=\"form-group mb-0\">\n";
            dynamicPageContent += "<div class=\"settings-btns\">\n";
            dynamicPageContent += "<asp:Button ID=\"btnSave\" runat=\"server\" ValidationGroup=\"AddSave\" OnClick=\"btnSave_Click\" Text=\"Save\" CssClass=\"btn btn-orange\" />\n";
            dynamicPageContent += "<asp:Button ID=\"Button1\" runat=\"server\" OnClick=\"btnCancel_Click\" Text=\"Cancel\" class=\"btn btn-grey\" />\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\n";
            dynamicPageContent += "<script type=\"text/javascript\">\n";
            dynamicPageContent += "function successWithRedirect(message, color, status) {\n";
            dynamicPageContent += "Swal.fire({\n";
            dynamicPageContent += "title: message,\n";
            dynamicPageContent += "icon: status,\n";
            dynamicPageContent += "confirmButtonColor: color,\n";
            dynamicPageContent += "}).then((result) => {\n";
            dynamicPageContent += "if (result.isConfirmed) {\n";
            dynamicPageContent += "setTimeout(function () {\n";
            dynamicPageContent += "window.location.replace('" + pageName + ".aspx');\n";
            dynamicPageContent += "}, 1000);\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "});\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "</script>\n";
            dynamicPageContent += "<script src=\"../assets/js/jquery-3.7.1.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/feather.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/plugins/slimscroll/jquery.slimscroll.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/script.js\"></script>\n";
            dynamicPageContent += "</asp:Panel>\n";

        }

        if (isCheckEditChecked)
        {
            dynamicPageContent += "<asp:Panel ID=\"PanelEdit\" runat=\"server\" Width=\"100 %\" Visible=\"false\">\n";
            dynamicPageContent += "<div class=\"page-wrapper\">";
            dynamicPageContent += "<div class=\"content container-fluid\">";
            dynamicPageContent += "<div class=\"row\">";
            dynamicPageContent += "<div class=\"col-sm-12\">";
            dynamicPageContent += "<div class=\"card comman-shadow\">";
            dynamicPageContent += "<div class=\"card-body\">";
            dynamicPageContent += "<div class=\"row\">";
            dynamicPageContent += "<div class=\"col-12\">";
            dynamicPageContent += "<h5 class=\"form-title student-info\">Add Your hand</h5>";
            dynamicPageContent += "</div>";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;
                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkEdit = row.FindControl("CheckEditFrom") as CheckBox;
                    if (chkEdit != null && chkEdit.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        switch (selectedControlType)
                        {
                            case "TextBox":
                                dynamicPageContent += ControlType.GenerateEditTextBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateEditAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateEditNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateEditAlphabetRegularExpression(columnName);
                                        break;

                                    case "Required":
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;

                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEditEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateEditNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GenerateEditPinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateEditWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "DropDownList ":
                                dynamicPageContent += ControlType.GenerateEditDropDownList(columnName);
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "CheckBox":
                                dynamicPageContent += ControlType.GenerateEditCheckBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateEditAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateEditNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateEditAlphabetRegularExpression(columnName);
                                        break;

                                    case "Required":
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;

                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEditEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateEditNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GenerateEditPinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateEditWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "ReadioButton":
                                dynamicPageContent += ControlType.GenerateReadioButton(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateEditAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateEditNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateEditAlphabetRegularExpression(columnName);
                                        break;

                                    case "Required":
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;

                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEditEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateEditNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GenerateEditPinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateEditWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "FileUpload":
                                dynamicPageContent += ControlType.GenerateEditFileUpload(columnName);
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "ListBox ":
                                dynamicPageContent += ControlType.GenerateEditListBox(columnName);
                                foreach (GridViewRow Chekrow in GridViewColumns.Rows)
                                {
                                    CheckBox CheckReq = Chekrow.FindControl("CheckRequired") as CheckBox;
                                    if (CheckReq != null && CheckReq.Checked)
                                    {
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;
                                    }
                                }
                                switch (selectedValidationType)
                                {
                                    case "Aphanumeric":
                                        dynamicPageContent += ControlType.GenerateEditAlphanumericRe(columnName);
                                        break;

                                    case "Numeric":
                                        dynamicPageContent += ControlType.GenerateEditNumericRegularExpression(columnName);
                                        break;

                                    case "Alphabet":
                                        dynamicPageContent += ControlType.GenerateEditAlphabetRegularExpression(columnName);
                                        break;

                                    case "Required":
                                        dynamicPageContent += ControlType.GenerateEditRequiredFieldValidator(columnName);
                                        break;

                                    case "Email":
                                        dynamicPageContent += ControlType.GenerateEditEmailRegularExpression(columnName);
                                        break;

                                    case "PhoneNumber":
                                        dynamicPageContent += ControlType.GenerateEditNumberRegularExpression(columnName);
                                        break;

                                    case "pinCode":
                                        dynamicPageContent += ControlType.GenerateEditPinCodeRegularExpression(columnName);
                                        break;

                                    case "Web":
                                        dynamicPageContent += ControlType.GenerateEditWebsiteRegularExpression(columnName);
                                        break;

                                        // Add more validation types as needed
                                }
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;

                            case "BindDropDown":
                                CheckBox selectCol = row.FindControl("CheckSelect") as CheckBox;
                                if (selectCol != null && selectCol.Checked)
                                {
                                    dynamicPageContent += ControlType.GenerateEditBindDropDownList(columnName);
                                    dynamicPageContent += "</div>\n";
                                    dynamicPageContent += "</div>\n";
                                }
                                break;

                            case "DateTime":
                                dynamicPageContent += ControlType.GenerateEditDateTime(columnName);
                                dynamicPageContent += "</div>\n";
                                dynamicPageContent += "</div>\n";
                                break;
                        }
                    }
                }
            }

            dynamicPageContent += "<div class=\"col-12\">\n";
            dynamicPageContent += "<div class=\"form-group mb-0\">\n";
            dynamicPageContent += "<div class=\"settings-btns\">\n";
            dynamicPageContent += "<asp:Button ID=\"btnEditUpdate\" runat=\"server\" ValidationGroup=\"EditSave\" OnClick=\"btnEditUpdate_Click\" Text=\"Update\" CssClass=\"btn btn-orange\" />\n";
            dynamicPageContent += "<asp:Button ID=\"btnEditCancel\" runat=\"server\" OnClick=\"btnCancel_Click\" Text=\"Cancel\" class=\"btn btn-grey\" />\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "</div>\n";
            dynamicPageContent += "<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\n";
            dynamicPageContent += "<script type=\"text/javascript\">\n";
            dynamicPageContent += "function successWithRedirect(message, color, status) {\n";
            dynamicPageContent += "Swal.fire({\n";
            dynamicPageContent += "title: message,\n";
            dynamicPageContent += "icon: status,\n";
            dynamicPageContent += "confirmButtonColor: color,\n";
            dynamicPageContent += "}).then((result) => {\n";
            dynamicPageContent += "if (result.isConfirmed) {\n";
            dynamicPageContent += "setTimeout(function () {\n";
            dynamicPageContent += "window.location.replace('" + pageName + ".aspx');\n";
            dynamicPageContent += "}, 1000);\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "});\n";
            dynamicPageContent += "}\n";
            dynamicPageContent += "</script>\n";
            dynamicPageContent += "<script src=\"../assets/js/jquery-3.7.1.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/feather.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/plugins/slimscroll/jquery.slimscroll.min.js\"></script>\n";
            dynamicPageContent += "<script src=\"../assets/js/script.js\"></script>\n";
            dynamicPageContent += "</asp:Panel>\n";
        }

        string codeBehindContent = "\n";

        if (isCheckViewChecked)
        {
            string selectedTableNameID = ddlTables.SelectedValue;
            string primaryKeyID = GetPrimaryKey(selectedTableNameID);
            codeBehindContent += "\n";
            codeBehindContent += "// This code Is Grid View Code\n";
            codeBehindContent += "\n";

            codeBehindContent += "    protected void Page_Load(object sender, EventArgs e)\n";
            codeBehindContent += "    {\n";
            codeBehindContent += "        if (!Page.IsPostBack)\n";
            codeBehindContent += "        {\n";
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                CheckBox Select = row.FindControl("CheckSelect") as CheckBox;
                if (Select != null && Select.Checked && ddlControlType != null)
                {
                    DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                    DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;
                    string selectedddlTablesName = ddlTablesName.SelectedValue;
                    string selectedddlColunm = ddlColunm.SelectedValue;
                    CheckBox CheckSelect = row.FindControl("CheckSelect") as CheckBox;
                    if (ddlTablesName != null && ddlColunm != null && CheckSelect != null && CheckSelect.Checked)
                    {
                        codeBehindContent += "Bind" + selectedddlColunm + "();\n";
                    }
                }
            }

            codeBehindContent += "            PanelGrdView.Visible = true;\n";
            codeBehindContent += "            PanelAdd.Visible = false;\n";
            codeBehindContent += "            PanelEdit.Visible = false;\n";
            codeBehindContent += "            FillGrdView();\n";
            codeBehindContent += "            if (Request.QueryString[\"action\"] == null && Request.QueryString[\"" + primaryKeyID + "\"] != null)\n";
            codeBehindContent += "            {\n";
            codeBehindContent += "                EditReadData();\n";
            codeBehindContent += "            }\n";
            codeBehindContent += "        }\n";
            codeBehindContent += "    }\n";
            codeBehindContent += "    public void FillGrdView()\n";
            codeBehindContent += "    {\n";
            codeBehindContent += "        DataTable dummy = new DataTable();\n";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    codeBehindContent += "        dummy.Columns.Add(\"" + columnName + "\");\n";
                }
            }

            codeBehindContent += "        dummy.Columns.Add(\"Edit\");\n";
            codeBehindContent += "        dummy.Columns.Add(\"Delete\");\n";
            codeBehindContent += "        dummy.Rows.Add();\n";
            codeBehindContent += "        gvv.DataSource = dummy;\n";
            codeBehindContent += "        gvv.DataBind();\n";
            codeBehindContent += "        gvv.UseAccessibleHeader = true;\n";
            codeBehindContent += "        gvv.HeaderRow.TableSection = TableRowSection.TableHeader;\n";
            codeBehindContent += "        if (Request.QueryString[\"action\"] != null && Request.QueryString[\"" + primaryKeyID + "\"] != null)\n";
            codeBehindContent += "        {\n";
            codeBehindContent += "            litmsg.Text = \"<i class='fas fa-trash-alt' style='color: red;'></i> Delete Record\";\n";
            codeBehindContent += "            litid2.Text = \"Are you sure to delete record?\";\n";
            codeBehindContent += "            ScriptManager.RegisterStartupScript(this, this.GetType(), \"myconfirm\", \"OpenConfirmDialog('');\", true);\n";
            codeBehindContent += "        }\n";
            codeBehindContent += "    }\n";


            codeBehindContent += "    [WebMethod(EnableSession = true)]\n";
            codeBehindContent += "    public static List<myView> GetData()\n";
            codeBehindContent += "    {\n";

            codeBehindContent += "        List<myView> listView = new List<myView>();\n";
            codeBehindContent += "        string constr = ConfigurationManager.ConnectionStrings[\"SmartWebConnectionString\"].ConnectionString;\n";
            List<string> columnNames = new List<string>();
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    Label lblColumnName = row.FindControl("lblColumnName") as Label;

                    if (lblColumnName != null)
                    {
                        string columnName = lblColumnName.Text;
                        columnNames.Add(columnName);
                    }
                }
            }


            string selectedColumns = string.Join(",", columnNames);
            string dynamicQuery = "SELECT " + primaryKeyID + ", " + selectedColumns + " FROM " + selectedTable + " WHERE IsDeleted = 0 ORDER BY " + primaryKeyID + " DESC";
            codeBehindContent += "string query = \"" + dynamicQuery + "\";\n";
            codeBehindContent += "        SqlConnection con = new SqlConnection(constr);\n";
            codeBehindContent += "        SqlCommand cmd = new SqlCommand(query, con);\n";
            codeBehindContent += "        con.Open();\n";
            codeBehindContent += "        SqlDataReader sdr = cmd.ExecuteReader();\n";
            codeBehindContent += "        while (sdr.Read())\n";
            codeBehindContent += "        {\n";
            codeBehindContent += "            listView.Add(new myView\n";
            codeBehindContent += "            {\n";

            //foreach (GridViewRow row in GridViewColumns.Rows)
            //{
            //    CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
            //    if (chkBox != null && chkBox.Checked)
            //    {
            //        string columnName = (row.FindControl("lblColumnName") as Label).Text;
            //        codeBehindContent += " " + columnName + " = sdr[\"" + columnName + "\"].ToString(),\n";
            //    }
            //}


            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    string selectedTableName = ddlTables.SelectedValue;
                    string columnDataType = GetColumnDataType(selectedTableName, columnName);
                    // Process the column based on the checkbox and data type
                    if (columnDataType == "date" || columnDataType == "datetime")
                    {
                        codeBehindContent += " " + columnName + " = Convert.ToDateTime(sdr[\"" + columnName + "\"]).ToString(\"dd-MM-yyyy\"),\n";
                    }
                    else
                    {
                        codeBehindContent += " " + columnName + " = sdr[\"" + columnName + "\"].ToString(),\n";
                    }
                }
            }
            codeBehindContent += "                " + primaryKeyID + " = Convert.ToInt32(sdr[\"" + primaryKeyID + "\"].ToString())\n";
            codeBehindContent += "            });\n";
            codeBehindContent += "        }\n";
            codeBehindContent += "        sdr.Close();\n";
            codeBehindContent += "        con.Close();\n";
            codeBehindContent += "        return listView;\n";
            codeBehindContent += "    }\n";
            codeBehindContent += "    public class myView\n";
            codeBehindContent += "    {\n";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckView") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    codeBehindContent += "public string " + columnName + " { get; set; }\n";
                }
            }
            codeBehindContent += "        public int " + primaryKeyID + " { get; set; }\n";
            codeBehindContent += "    }\n";

            codeBehindContent += "protected void btnAdd_Click(object sender, EventArgs e)\n";
            codeBehindContent += "{\n";
            codeBehindContent += "    PanelGrdView.Visible = false;\n";
            codeBehindContent += "    PanelAdd.Visible = true;\n";
            codeBehindContent += "    PanelEdit.Visible = false;\n";
            codeBehindContent += "}\n\n";

            codeBehindContent += "protected void BtnDelete_Click(object sender, EventArgs e)\n";
            codeBehindContent += "{\n";
            codeBehindContent += "    PanelAdd.Visible = false;\n";
            codeBehindContent += "    PanelEdit.Visible = false;\n";
            codeBehindContent += "    if (Request.QueryString[\"action\"] != null && Request.QueryString[\"" + primaryKeyId + "\"] != null)\n";
            codeBehindContent += "    {\n";
            codeBehindContent += "        a.execute_query(\"UPDATE " + selectedTable + " SET IsDeleted = 1 where " + primaryKeyId + "='\" + Request.QueryString[\"" + primaryKeyId + "\"].ToString() + \"' \");\n";
            codeBehindContent += "        Response.Redirect(\"" + pageName + ".aspx\", false);\n";
            codeBehindContent += "    }\n";
            codeBehindContent += "}\n\n";

            codeBehindContent += "//End Code Of GridView\n\n";
        }

        if (isCheckAddChecked)
        {
            string selectedTableNameID = ddlTables.SelectedValue;
            string primaryKeyID = GetPrimaryKey(selectedTableNameID);
            codeBehindContent += "    protected void btnSave_Click(object sender, EventArgs e)\n";
            codeBehindContent += "    {\n";
            codeBehindContent += "        string connectionString = ConfigurationManager.ConnectionStrings[\"SmartWebConnectionString\"].ConnectionString;\n";
            codeBehindContent += "string selectedTable = \"" + selectedTable + "\";\n";
            codeBehindContent += "string insertQuery = \"INSERT INTO \" + selectedTable + \" (";

            List<string> columnNames = new List<string>();
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckAddFrom") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    Label lblColumnName = row.FindControl("lblColumnName") as Label;

                    if (lblColumnName != null)
                    {
                        string columnName = lblColumnName.Text;
                        columnNames.Add(columnName);
                    }
                }
            }

            // Append column names to the insert query string
            foreach (string columnName in columnNames)
            {

                codeBehindContent += columnName + ","; // Without square brackets
            }

            // Remove the last comma and complete the insert query string
            codeBehindContent = codeBehindContent.TrimEnd(',') + ") VALUES (";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckAddFrom") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    codeBehindContent += "@" + columnName + ",";
                }
            }

            // Remove the last comma and complete the insert query string
            codeBehindContent = codeBehindContent.TrimEnd(',') + ")\";\n";



            codeBehindContent += "        using (SqlConnection connection = new SqlConnection(connectionString))\n";
            codeBehindContent += "        {\n";
            codeBehindContent += "            using (SqlCommand cmd = new SqlCommand(insertQuery, connection))\n";
            codeBehindContent += "            {\n";


            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;

                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkAdd = row.FindControl("CheckAddFrom") as CheckBox;

                    if (chkAdd != null && chkAdd.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        switch (selectedControlType)
                        {
                            case "TextBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", txt" + columnName + ".Text);\n";
                                break;

                            case "DropDownList ":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", ddl" + columnName + ".SelectedValue);\n";
                                break;

                            case "CheckBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", cheBox" + columnName + ".Checked);\n";
                                break;

                            case "RadioButton":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", rdBtn" + columnName + ".Checked);\n";
                                break;

                            case "FileUpload":
                                codeBehindContent += "if (fu" + columnName + ".HasFile)\n";
                                codeBehindContent += "{\n";
                                codeBehindContent += "\tstring fileName = Path.GetFileName(fu" + columnName + ".FileName);\n";
                                codeBehindContent += "\tstring fileExtension = Path.GetExtension(fileName);\n\n";
                                codeBehindContent += "\tif (fileExtension == \".jpg\" || fileExtension == \".jpeg\" || fileExtension == \".png\")\n";
                                codeBehindContent += "\t{\n";
                                codeBehindContent += "\t\tstring photoDirectory = Server.MapPath(\"~/Uploads/\");\n";
                                codeBehindContent += "\t\tstring filePath = Path.Combine(photoDirectory, fileName);\n";
                                codeBehindContent += "\t\tfu" + columnName + ".SaveAs(filePath);\n";
                                codeBehindContent += "\t\tcmd.Parameters.AddWithValue(\"@" + columnName + "\", fileName);\n";
                                codeBehindContent += "\t}\n";
                                codeBehindContent += "}\n";
                                break;

                            case "ListBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", listBox" + columnName + ".SelectedValue);\n";
                                break;

                            case "BindDropDown":
                                DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                                DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;

                                if (ddlTablesName != null && ddlColunm != null)
                                {
                                    CheckBox CheckSelect = row.FindControl("CheckSelect") as CheckBox;
                                    CheckBox CheckAdd = row.FindControl("CheckAddFrom") as CheckBox;
                                    if (CheckSelect != null && CheckSelect.Checked && CheckAdd != null && CheckAdd.Checked)
                                    {
                                        codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", ddl" + columnName + ".SelectedValue);\n";
                                    }
                                }
                                break;

                            case "DateTime":
                                codeBehindContent += "string[] asdx = txt" + columnName + ".Text.Split('-');\n";
                                codeBehindContent += "string DateTime" + columnName + " = \"\";\n";
                                codeBehindContent += "if (!string.IsNullOrWhiteSpace(txt" + columnName + ".Text))\n";
                                codeBehindContent += "{\n";
                                codeBehindContent += "    if (asdx.Length == 3)\n";
                                codeBehindContent += "    {\n";
                                codeBehindContent += "        DateTime" + columnName + " = asdx[2] + \"-\" + asdx[1] + \"-\" + asdx[0];\n";
                                codeBehindContent += "    }\n";
                                codeBehindContent += "}\n";
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", DateTime" + columnName + ");\n";
                                break;
                        }
                    }
                }
            }


            codeBehindContent += "                connection.Open();\n";
            codeBehindContent += "                cmd.ExecuteNonQuery();\n";
            codeBehindContent += "                connection.Close();\n";

            codeBehindContent += "    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), \"popup\", \"successWithRedirect('Saved Successfully', 'green', 'success');\", true);\n";


            codeBehindContent += "                // You can add further logic or redirect the user as needed\n";
            codeBehindContent += "            }\n";
            codeBehindContent += "        }\n";
            codeBehindContent += "    }\n";
            //codeBehindContent += "}\n";
        }

        if (isCheckEditChecked)
        {
            List<string> columnNamess = new List<string>();
            string selectedTableNameID = ddlTables.SelectedValue;
            string primaryKeyID = GetPrimaryKey(selectedTableNameID);
            codeBehindContent += "\n";
            codeBehindContent += "// This code Is EditReadData \n";
            codeBehindContent += "\n";
            codeBehindContent += "public void EditReadData()\n";
            codeBehindContent += "{\n";
            codeBehindContent += "string fuEditFileUpload= \"\";\n";
            codeBehindContent += "    if (Request.QueryString[\"" + primaryKeyID + "\"] != null)\n";
            codeBehindContent += "    {\n";
            codeBehindContent += "        int pid = Convert.ToInt32(Request.QueryString[\"" + primaryKeyID + "\"].ToString());\n";
            codeBehindContent += "        PanelEdit.Visible = true;\n";
            codeBehindContent += "        PanelGrdView.Visible = false;\n";

            // Assuming you have selectedTable as the table name and primaryKeyID as the primary key column
            codeBehindContent += "string selectedTable = \"" + selectedTable + "\";\n";
            codeBehindContent += "string primaryKeyID = \"" + primaryKeyID + "\";\n";

            string selectQuery = "SELECT ";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckEditFrom") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    selectQuery += columnName + ", ";
                }
            }

            // Trim the trailing comma and add the rest of the query
            selectQuery = selectQuery.TrimEnd(',', ' ') + " FROM " + selectedTable + " WHERE " + primaryKeyID + "  = '\"  " + "+pid+" + "  \"'";
            codeBehindContent += "SqlDataReader rd = a.GetDatareader(\"" + selectQuery + "\");\n";

            codeBehindContent += "        while (rd.Read())\n";
            codeBehindContent += "        {\n";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;

                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkAdd = row.FindControl("CheckEditFrom") as CheckBox;

                    if (chkAdd != null && chkAdd.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        switch (selectedControlType)
                        {
                            case "TextBox":
                                codeBehindContent += "txtEdit" + columnName + ".Text = rd[\"" + columnName + "\"].ToString();\n";
                                break;

                            case "DropDownList ":
                                codeBehindContent += "ddlEdit" + columnName + ".SelectedValue  = rd[\"" + columnName + "\"].ToString();\n";
                                break;

                            case "CheckBox":
                                codeBehindContent += "CheckEdit" + columnName + ".SelectedValue  = rd[\"" + columnName + "\"].ToString();\n";
                                break;

                            case "RadioButton":
                                codeBehindContent += "rdBtnEdit" + columnName + ".SelectedValue  = rd[\"" + columnName + "\"].ToString();\n";
                                break;

                            case "FileUpload":
                                // fuEditFileUpload.. / Uploads / + = rd["FileUpload"].ToString();

                                codeBehindContent += "fuEdit" + columnName + " = \"../Uploads/\" + rd[\"" + columnName + "\"].ToString();\n";

                                break;


                            case "ListBox":
                                codeBehindContent += "LbEdit" + columnName + ".SelectedValue  = rd[\"" + columnName + "\"].ToString();\n";
                                break;
                            case "BindDropDown":

                                DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                                DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;
                                CheckBox CheckSelect = row.FindControl("CheckSelect") as CheckBox;
                                CheckBox chkCheckEditFrom = row.FindControl("CheckEditFrom") as CheckBox;
                                if (CheckSelect != null && CheckSelect.Checked || chkCheckEditFrom != null && chkCheckEditFrom.Checked)
                                {
                                    if (ddlTablesName != null && ddlColunm != null)
                                    {
                                        codeBehindContent += "ddlEdit" + columnName + ".SelectedValue  = rd[\"" + columnName + "\"].ToString();\n";
                                    }
                                }
                                break;

                            case "DateTime":
                                codeBehindContent += "DateTime  " + columnName + " = Convert.ToDateTime(rd[\"" + columnName + "\"]);\n";
                                codeBehindContent += "string validFrom = " + columnName + ".ToString(\"dd-MM-yyyy\");\n";
                                codeBehindContent += "txtEdit" + columnName + ".Text = validFrom;\n";
                                break;
                        }
                    }
                }
            }


            codeBehindContent += "        }\n";
            codeBehindContent += "        rd.Close();\n";

            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;

                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkAdd = row.FindControl("CheckEditFrom") as CheckBox;

                    if (chkAdd != null && chkAdd.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        if (selectedControlType == "FileUpload" && !string.IsNullOrEmpty(columnName))
                        {
                            //codeBehindContent += "imgEditFileUpload.ImageUrl = fuEdit" + columnName + "  \"+?+\""" DateTime.Now.Ticks ";" "\";\n";
                            codeBehindContent += "imgEditFileUpload.ImageUrl = fuEdit" + columnName + " + \"?\" + DateTime.Now.Ticks;\n";

                        }
                    }
                }
            }


            codeBehindContent += "    }\n";
            codeBehindContent += "}\n";


            codeBehindContent += "    protected void btnEditUpdate_Click(object sender, EventArgs e)\n";
            codeBehindContent += "    {\n";
            // Start generating dynamic code
            codeBehindContent += "";

            // Convert pid from Request.QueryString["BankId"]
            codeBehindContent += "int pid = Convert.ToInt32(Request.QueryString[\"" + primaryKeyID + "\"].ToString());\n";

            codeBehindContent += "SqlConnection conn = new SqlConnection();\n";
            codeBehindContent += "SqlCommand cmd = new SqlCommand();\n";

            codeBehindContent += "conn.ConnectionString = ConfigurationManager.ConnectionStrings[\"SmartWebConnectionString\"].ConnectionString;\n";
            codeBehindContent += "cmd.Connection = conn;\n";
            codeBehindContent += "string selectedTable = \"" + selectedTable + "\";\n";
            codeBehindContent += "string insqry = \"update \" + selectedTable + \" set ";

            // Iterate through the GridView columns
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                CheckBox chkBox = row.FindControl("CheckEditFrom") as CheckBox;
                if (chkBox != null && chkBox.Checked)
                {
                    string columnName = (row.FindControl("lblColumnName") as Label).Text;
                    codeBehindContent += columnName + " = @" + columnName + ", ";
                }
            }

            // Trim the trailing comma and space
            codeBehindContent = codeBehindContent.TrimEnd(',', ' ') + " WHERE " + primaryKeyID + "  = '\"  " + "+pid+" + "  \"'";
            codeBehindContent += "\";";
            codeBehindContent += "\n";
            codeBehindContent += "    cmd = new SqlCommand(insqry, conn);\n";
            foreach (GridViewRow row in GridViewColumns.Rows)
            {
                DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
                DropDownList ddlValidation = row.FindControl("ddlValidation") as DropDownList;
                if (ddlControlType != null && ddlValidation != null)
                {
                    CheckBox chkAdd = row.FindControl("CheckEditFrom") as CheckBox;

                    if (chkAdd != null && chkAdd.Checked)
                    {
                        string selectedControlType = ddlControlType.SelectedValue;
                        string selectedValidationType = ddlValidation.SelectedValue;
                        string columnName = (row.FindControl("lblColumnName") as Label).Text;
                        switch (selectedControlType)
                        {
                            case "TextBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", txtEdit" + columnName + ".Text);\n";
                                break;

                            case "DropDownList ":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", ddlEdit" + columnName + ".SelectedValue);\n";
                                break;

                            case "CheckBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", cheBoxEdit" + columnName + ".Checked);\n";
                                break;

                            case "RadioButton":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", rdBtnEdit" + columnName + ".Checked);\n";
                                break;

                            case "FileUpload":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + primaryKeyId + "\", pid);\n";
                                // Handle File Upload
                                codeBehindContent += "if (fuEdit" + columnName + ".HasFile)\n";
                                codeBehindContent += "{\n";
                                codeBehindContent += "    string newFileName = Path.GetFileName(fuEdit" + columnName + ".FileName);\n";
                                codeBehindContent += "    string uploadsDirectory = Server.MapPath(\"~/Uploads/\");\n";
                                codeBehindContent += "    string " + columnName + "Path = Path.Combine(uploadsDirectory, newFileName);\n";
                                codeBehindContent += "    fuEdit" + columnName + ".SaveAs(" + columnName + "Path);\n";
                                codeBehindContent += "    string oldfilecv = \"\";\n";
                                codeBehindContent += "    SqlDataReader rdx = a.GetDatareader(\"select " + columnName + " from " + selectedTable + " where " + primaryKeyId + "='\" + pid.ToString() + \"'\");\n";
                                codeBehindContent += "    while (rdx.Read())\n";
                                codeBehindContent += "    {\n";
                                codeBehindContent += "        oldfilecv = rdx[\"" + columnName + "\"].ToString();\n";
                                codeBehindContent += "    }\n";
                                codeBehindContent += "    rdx.Close();\n";
                                codeBehindContent += "    cmd.Parameters.AddWithValue(\"@" + columnName + "\", newFileName);\n";
                                codeBehindContent += "    string oldFileName =  Server.MapPath(\"~/Uploads/\" + oldfilecv); ;\n";
                                codeBehindContent += "    // Delete the old file if it exists\n";
                                codeBehindContent += "    string oldFilePath = Path.Combine(uploadsDirectory, oldFileName);\n";
                                codeBehindContent += "    if (File.Exists(oldFilePath))\n";
                                codeBehindContent += "    {\n";
                                codeBehindContent += "        File.Delete(oldFilePath);\n";
                                codeBehindContent += "    }\n";
                                codeBehindContent += "}\n";
                                break;


                            case "ListBox":
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", listBox" + columnName + ".SelectedValue);\n";
                                break;

                            case "BindDropDown":
                                DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                                DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;

                                if (ddlTablesName != null && ddlColunm != null)
                                {
                                    CheckBox CheckSelect = row.FindControl("CheckSelect") as CheckBox;
                                    CheckBox CheckEditFrom = row.FindControl("CheckEditFrom") as CheckBox;
                                    if (CheckSelect != null && CheckSelect.Checked && CheckEditFrom != null && CheckEditFrom.Checked)
                                    {
                                        codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", ddlEdit" + columnName + ".SelectedValue);\n";
                                    }
                                }
                                break;

                            case "DateTime":
                                codeBehindContent += "string[] asdx =txtEdit" + columnName + ".Text.Split('-');\n";
                                codeBehindContent += "string DateTime" + columnName + " = \"\";\n";
                                codeBehindContent += "if (!string.IsNullOrWhiteSpace(txtEdit" + columnName + ".Text))\n";
                                codeBehindContent += "{\n";
                                codeBehindContent += "    if (asdx.Length == 3)\n";
                                codeBehindContent += "    {\n";
                                codeBehindContent += "        DateTime" + columnName + " = asdx[2] + \"-\" + asdx[1] + \"-\" + asdx[0];\n";
                                codeBehindContent += "    }\n";
                                codeBehindContent += "}\n";
                                codeBehindContent += "cmd.Parameters.AddWithValue(\"@" + columnName + "\", DateTime" + columnName + ");\n";
                                break;
                        }
                    }
                }
            }
            codeBehindContent += "conn.Open();\n";
            codeBehindContent += "cmd.ExecuteNonQuery();\n";
            codeBehindContent += "conn.Close();\n";

            // Indicate a successful password change

            codeBehindContent += "    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), \"popup\", \"successWithRedirect('Update Data Saved Successfully', 'green', 'success');\", true);\n";
            codeBehindContent += "}\n\n";
        }

        foreach (GridViewRow row in GridViewColumns.Rows)
        {
            DropDownList ddlControlType = row.FindControl("ddlControlType") as DropDownList;
            CheckBox Select = row.FindControl("CheckSelect") as CheckBox;
            if (Select != null && Select.Checked && ddlControlType != null)
            {
                DropDownList ddlTablesName = row.FindControl("ddlTablesName") as DropDownList;
                DropDownList ddlColunm = row.FindControl("ddlColunm") as DropDownList;
                string selectedddlTablesName = ddlTablesName.SelectedValue;
                string selectedddlColunm = ddlColunm.SelectedValue;
                string columnName = (row.FindControl("lblColumnName") as Label).Text;
                CheckBox chkAdd = row.FindControl("CheckAddFrom") as CheckBox;
                CheckBox chkCheckEditFrom = row.FindControl("CheckEditFrom") as CheckBox;

                if (ddlTablesName != null && ddlColunm != null)
                {
                    codeBehindContent += "private void Bind" + selectedddlColunm + "()\n";
                    codeBehindContent += "{\n";
                    codeBehindContent += "    string connectionString = ConfigurationManager.ConnectionStrings[\"SmartWebConnectionString\"].ConnectionString;\n";
                    codeBehindContent += "    string selectQuery = \"SELECT " + selectedddlColunm + " FROM " + selectedddlTablesName + "\";\n\n";

                    codeBehindContent += "    using (SqlConnection connection = new SqlConnection(connectionString))\n";
                    codeBehindContent += "    {\n";
                    codeBehindContent += "        using (SqlCommand cmd = new SqlCommand(selectQuery, connection))\n";
                    codeBehindContent += "        {\n";
                    codeBehindContent += "            connection.Open();\n";
                    codeBehindContent += "            SqlDataReader reader = cmd.ExecuteReader();\n";

                    if (chkAdd != null && chkAdd.Checked && chkCheckEditFrom != null && chkCheckEditFrom.Checked)
                    {
                        codeBehindContent += "            ddlEdit" + columnName + ".Items.Clear();\n";
                        codeBehindContent += "ddl" + columnName + ".Items.Clear();\n";
                        codeBehindContent += "            ddlEdit" + columnName + ".Items.Add(new ListItem(\"Select " + columnName + "\", \"\"));\n\n";
                        codeBehindContent += "ddl" + columnName + ".Items.Add(new ListItem(\"Select " + columnName + "\", \"\"));\n";
                    }
                    else if (chkAdd != null && chkAdd.Checked)
                    {
                        codeBehindContent += "ddl" + columnName + ".Items.Clear();\n";
                        codeBehindContent += "ddl" + columnName + ".Items.Add(new ListItem(\"Select " + columnName + "\", \"\"));\n";


                    }
                    else if (chkCheckEditFrom != null && chkCheckEditFrom.Checked)
                    {
                        codeBehindContent += "            ddlEdit" + columnName + ".Items.Clear();\n";
                        codeBehindContent += "            ddlEdit" + columnName + ".Items.Add(new ListItem(\"Select " + columnName + "\", \"\"));\n\n";
                    }


                    codeBehindContent += "            while (reader.Read())\n";
                    codeBehindContent += "            {\n";
                    codeBehindContent += "                string " + columnName + " = reader[\"" + selectedddlColunm + "\"].ToString();\n";
                    if (chkAdd != null && chkAdd.Checked && chkCheckEditFrom != null && chkCheckEditFrom.Checked)
                    {
                        codeBehindContent += " ddl" + columnName + ".Items.Add(new ListItem(" + columnName + ", " + columnName + "));\n";
                        codeBehindContent += "ddlEdit" + columnName + ".Items.Add(new ListItem(" + columnName + ", " + columnName + "));\n";

                    }
                    else if (chkAdd != null && chkAdd.Checked)
                    {

                        codeBehindContent += " ddl" + columnName + ".Items.Add(new ListItem(" + columnName + ", " + columnName + "));\n";
                    }
                    else if (chkCheckEditFrom != null && chkCheckEditFrom.Checked)
                    {
                        codeBehindContent += "ddlEdit" + columnName + ".Items.Add(new ListItem(" + columnName + ", " + columnName + "));\n";
                    }
                    codeBehindContent += "            }\n\n";

                    codeBehindContent += "            reader.Close();\n";
                    codeBehindContent += "            connection.Close();\n";
                    codeBehindContent += "        }\n";
                    codeBehindContent += "    }\n";
                    codeBehindContent += "}\n";

                }
            }
        }


        codeBehindContent += "protected void btnCancel_Click(object sender, EventArgs e)\n";
        codeBehindContent += "{\n";
        codeBehindContent += "    PanelGrdView.Visible = true;\n";
        codeBehindContent += "    PanelAdd.Visible = false;\n";
        codeBehindContent += "    PanelEdit.Visible = false;\n";
        codeBehindContent += "    Response.Redirect(\"" + pageName + ".aspx\");\n";
        codeBehindContent += "}\n\n";

        // Set the combined content to the InnerText of the txtGeneratedCode TextBox
        txtGeneratedCode.InnerText = dynamicPageContent;

        txtGeneratedCodecs.InnerText = codeBehindContent;

        btnSave.Visible = true;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect("MultiCodeGeneratorCopy.aspx");
        btnSave.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        string codeBehindContentaspx = txtGeneratedCode.InnerText;
        string codeBehindContentcs = txtGeneratedCodecs.InnerText;

        string pageName = txtName.Text.Trim();

        string aspxFilePath = Server.MapPath("~/Output/" + pageName + ".aspx");
        System.IO.File.WriteAllText(aspxFilePath, codeBehindContentaspx);


        string codeBehindFilePath = Server.MapPath("~/Output/" + pageName + ".aspx.cs");
        System.IO.File.WriteAllText(codeBehindFilePath, codeBehindContentcs);


    }

}
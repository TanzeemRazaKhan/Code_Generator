using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Controaltype
/// </summary>
public class Controaltype
{
    public string GymsoftConnection()
    {
        string str = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString.ToString();
        return str;
    }

    string connectionString = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString;
    public Controaltype()
    {
        //
        // TODO: Add constructor logic here
        //
    }

   //Get The PrimaryKey
    public string GetPrimaryKey(string tableName)
    {
        string primaryKeyColumnName = "";

        using (SqlConnection connection = new SqlConnection(connectionString))
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

    //Loadte The table Name 
    public void LoadTableNames(string databaseName, DropDownList ddlName)
    {
        ddlName.Items.Clear();
        ddlName.Items.Insert(0, "Select The Table Name");
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT TABLE_NAME FROM " + databaseName + ".INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", connection);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string tableName = reader.GetString(0);
                ddlName.Items.Add(tableName);
            }
            reader.Close(); // Close the SqlDataReader
        }
    }

    public void LoadColumnNames(string tableName, ListControl itembox)
    {
        // Clear existing items in the list control
        itembox.Items.Clear();
     
        // Establish connection and execute SQL query
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand(@"SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName AND COLUMN_NAME NOT IN ('TransDate', 'IsDeleted') ", connection);
            command.Parameters.AddWithValue("@TableName", tableName);

            SqlDataReader reader = command.ExecuteReader();

            // Add column names to the list control
            while (reader.Read())
            {
                string columnName = reader.GetString(0);
                itembox.Items.Add(columnName);
            }
        }
    }
    //Add /Edit Control Type 
    public string GenerateTextBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:TextBox ID=\"txt" + columnName + "\" runat=\"server\" CssClass=\"form-control\"></asp:TextBox>\n";
        //dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqtxt" + columnName + "\" ControlToValidate=\"txt" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"City\" ErrorMessage=\"Enter " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";

        return dynamicPageContent;
    }
    public string GenerateEditTextBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:TextBox ID=\"txtEdit" + columnName + "\" runat=\"server\" CssClass=\"form-control\"></asp:TextBox>\n";
        //dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqtxt" + columnName + "\" ControlToValidate=\"txt" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"City\" ErrorMessage=\"Enter " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";

        return dynamicPageContent;
    }
    public string GenerateDropDownList(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:UpdatePanel ID='UpdatePanel2' runat='server'>\n";
        dynamicPageContent += "<ContentTemplate>\n";
        dynamicPageContent += "<asp:DropDownList ID=\"ddl" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\" CssClass=\"form-control form-select\">\n";
        dynamicPageContent += "<asp:ListItem>Active</asp:ListItem>\n";
        dynamicPageContent += "<asp:ListItem>Inactive</asp:ListItem>\n";
        dynamicPageContent += "</asp:DropDownList>\n";
        dynamicPageContent += "</ContentTemplate>\n";
        dynamicPageContent += "</asp:UpdatePanel>\n";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqddl" + columnName + "\" ControlToValidate=\"ddl" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"AddSave\" ErrorMessage=\"Select " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";

        return dynamicPageContent;
    }
    public string GenerateEditDropDownList(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:UpdatePanel ID='UpdatePanel2' runat='server'>\n";
        dynamicPageContent += "<ContentTemplate>\n";
        dynamicPageContent += "<asp:DropDownList ID=\"ddlEdit" + columnName + "\" runat=\"server\" ValidationGroup=\"EditSave\" CssClass=\"form-control form-select\">\n";
        dynamicPageContent += "<asp:ListItem>Active</asp:ListItem>\n";
        dynamicPageContent += "<asp:ListItem>Inactive</asp:ListItem>\n";
        dynamicPageContent += "</asp:DropDownList>\n";
        dynamicPageContent += "</ContentTemplate>\n";
        dynamicPageContent += "</asp:UpdatePanel>\n";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqddl" + columnName + "\" ControlToValidate=\"ddlEdit" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"EditSave\" ErrorMessage=\"Select " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";

        return dynamicPageContent;
    }
    public string GenerateCheckBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-3\">\n";
        dynamicPageContent += "    <div class=\"col-sm-9\">\n";
        dynamicPageContent += "        <label class=\"custom_check\">\n";
        dynamicPageContent += "            <asp:CheckBox ID=\"Check " + columnName + "\" runat=\"server\" />\n";
        dynamicPageContent += "            <span class=\"checkmark" + columnName + "\"></span>Name</label>\n";

        return dynamicPageContent;
    }
    public string GenerateEditCheckBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-3\">\n";
        dynamicPageContent += "    <div class=\"col-sm-9\">\n";
        dynamicPageContent += "        <label class=\"custom_check\">\n";
        dynamicPageContent += "            <asp:CheckBox ID=\"CheckEdit" + columnName + "\" runat=\"server\" />\n";
        dynamicPageContent += "            <span class=\"checkmark" + columnName + "\"></span>Name</label>\n";

        return dynamicPageContent;
    }
    public string GenerateReadioButton(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-3\">\n";
        dynamicPageContent += "    <div class=\"col-sm-9\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:RadioButton ID=\"rdBtn" + columnName + "\" runat=\"server\" Text=\"Option\" />";

        return dynamicPageContent;
    }
    public string GenerateEditReadioButton(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-3\">\n";
        dynamicPageContent += "    <div class=\"col-sm-9\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:RadioButton ID=\"rdBtnEdit" + columnName + "\" runat=\"server\" Text=\"Option\" />";

        return dynamicPageContent;
    }
    public string GenerateFileUpload(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "    <div class=\"form-group students-up-files\">\n";
        dynamicPageContent += "        <asp:FileUpload ID=\"fu" + columnName + "\" runat=\"server\" CssClass=\"form-control\" />\n";

        return dynamicPageContent;
    }
    public string GenerateEditFileUpload(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "    <asp:Image ID=\"imgEdit" + columnName + "\" Width=\"100px\" Height=\"100px\" runat=\"server\" />\n";
        dynamicPageContent += "    <p style=\"margin-left: -11px;\">Choose New Photo</p>\n";
        dynamicPageContent += "    <div class=\"form-group students-up-files\">\n";
        dynamicPageContent += "        <asp:FileUpload ID=\"fuEdit" + columnName + "\" runat=\"server\" CssClass=\"form-control\" />\n";

        return dynamicPageContent;
    }
    public string GenerateListBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:ListBox ID=\"Lb" + columnName + "\" runat=\"server\" CssClass=\"form-control\">";
        dynamicPageContent += "<asp:ListItem Text=\"Item 1\"></asp:ListItem>";
        dynamicPageContent += "<asp:ListItem Text=\"Item 2\"></asp:ListItem>";
        dynamicPageContent += "<asp:ListItem Text=\"Item 3\"></asp:ListItem>";
        dynamicPageContent += "</asp:ListBox>";

        return dynamicPageContent;
    }
    public string GenerateEditListBox(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + ":</label>\n";
        dynamicPageContent += "<asp:ListBox ID=\"LbEdit" + columnName + "\" runat=\"server\" CssClass=\"form-control\">";
        dynamicPageContent += "<asp:ListItem Text=\"Item 1\"></asp:ListItem>";
        dynamicPageContent += "<asp:ListItem Text=\"Item 2\"></asp:ListItem>";
        dynamicPageContent += "<asp:ListItem Text=\"Item 3\"></asp:ListItem>";
        dynamicPageContent += "</asp:ListBox>";

        return dynamicPageContent;
    }
    public string GenerateDateTime(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "    <div class=\"form-group local-forms calendar-icon\">\n";
        dynamicPageContent += "        <label>" + columnName + ":<span class=\"login-danger\">*</span></label>\n";
        dynamicPageContent += "        <asp:TextBox ID=\"txt" + columnName + "\" Placeholder=\"DD-MM-YYYY\" class=\"form-control datetimepicker\" runat=\"server\"></asp:TextBox>\n";
        dynamicPageContent += "        <span class=\"input-group-addon\">\n";
        dynamicPageContent += "            <span class=\"glyphicon glyphicon-calendar\"></span>\n";
        dynamicPageContent += "        </span>\n";



        return dynamicPageContent;
    }
    public string GenerateEditDateTime(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "    <div class=\"form-group local-forms calendar-icon\">\n";
        dynamicPageContent += "        <label>" + columnName + ":<span class=\"login-danger\">*</span></label>\n";
        dynamicPageContent += "        <asp:TextBox ID=\"txtEdit" + columnName + "\" Placeholder=\"DD-MM-YYYY\" class=\"form-control datetimepicker\" runat=\"server\"></asp:TextBox>\n";
        dynamicPageContent += "        <span class=\"input-group-addon\">\n";
        dynamicPageContent += "            <span class=\"glyphicon glyphicon-calendar\"></span>\n";
        dynamicPageContent += "        </span>\n";



        return dynamicPageContent;
    }
    public string GenerateBindDropDownList(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + "<span class=\"login-danger\">*</span></label>\n";
        dynamicPageContent += "<asp:DropDownList ID=\"ddl" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\" CssClass=\"form-select form-control\" AppendDataBoundItems=\"true\">\n";
        
        dynamicPageContent += "</asp:DropDownList>\n";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rq1ddl" + columnName + "\" ControlToValidate=\"ddl" + columnName + "\" runat=\"server\" ValidationGroup=\"AddSave\" Display=\"Dynamic\" ErrorMessage=\"Select  " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";
        return dynamicPageContent;
    }
    public string GenerateEditBindDropDownList(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<div class=\"col-12 col-sm-4\">\n";
        dynamicPageContent += "<div class=\"form-group local-forms\">\n";
        dynamicPageContent += "<label>" + columnName + "<span class=\"login-danger\">*</span></label>\n";
        dynamicPageContent += "<asp:DropDownList ID=\"ddlEdit" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\" CssClass=\"form-select form-control\" AppendDataBoundItems=\"true\">\n";        
        dynamicPageContent += "</asp:DropDownList>\n";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rq1ddl" + columnName + "\" InitialValue=\"Select " + columnName + "\" ControlToValidate=\"ddlEdit" + columnName + "\" runat=\"server\" ValidationGroup=\"EditSave\" Display=\"Dynamic\" ErrorMessage=\"Select  " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";
        return dynamicPageContent;
    }


    //Add Required Filed
    public string GenerateRequiredFieldValidator(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqtxt" + columnName + "\" ControlToValidate=\"txt" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"AddSave\" ErrorMessage=\"Enter " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";
        return dynamicPageContent;
    } 
    public string GenerateRequiredFileFieldValidator(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqtxt" + columnName + "\" ControlToValidate=\"fu" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"AddSave\" ErrorMessage=\"Enter " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";
        return dynamicPageContent;
    }
    public string GenerateNumericRegularExpression(string columnName)
    {
        // Here you generate the RegularExpressionValidator control
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^\\d+$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateAlphanumericRe(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
       // dynamicPageContent += " ValidationExpression=\"^[a-zA-Z0-9\s]*$\";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z0-9\\s]*$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEmailRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateNumberRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[6-9]\\d{9}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateAlphabetRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z]*$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateWebsiteRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^(https?://)?([\\da-z.-]+)\\.([a-z.]{2,6})([/\\w .-]*)*/?$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GeneratePinCodeRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"AddSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[1-9][0-9]{5}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }

    //Edit Required Filed
    public string GenerateEditRequiredFieldValidator(string columnName)
    {
        string dynamicPageContent = "";
        dynamicPageContent += "<asp:RequiredFieldValidator ID=\"rqtxt" + columnName + "\" ControlToValidate=\"txtEdit" + columnName + "\" runat=\"server\" Display=\"Dynamic\" ValidationGroup=\"EditSave\" ErrorMessage=\"Enter " + columnName + "\" ForeColor=\"Red\"></asp:RequiredFieldValidator>\n";
        return dynamicPageContent;
    }
    public string GenerateEditNumericRegularExpression(string columnName)
    {
        // Here you generate the RegularExpressionValidator control
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^\\d+$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditAlphanumericRe(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z0-9](?: [a-zA-Z0-9])*$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditEmailRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditNumberRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[6-9]\\d{9}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditAlphabetRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[a-zA-Z]+(?: [a-zA-Z]+)*$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditWebsiteRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^(https?://)?([\\da-z.-]+)\\.([a-z.]{2,6})([/\\w .-]*)*/?$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }
    public string GenerateEditPinCodeRegularExpression(string columnName)
    {
        string dynamicPageContent = "<asp:RegularExpressionValidator ID=\"rev" + columnName + "\" ValidationGroup=\"EditSave\" runat=\"server\"";
        dynamicPageContent += " ControlToValidate=\"txt" + columnName + "\"";
        dynamicPageContent += " ErrorMessage=\"Invalid " + columnName + "\"";
        dynamicPageContent += " ValidationExpression=\"^[1-9][0-9]{5}$\"";
        dynamicPageContent += " ForeColor=\"Red\" />";
        return dynamicPageContent;
    }


    public SqlDataReader GetDropDatareader(string str)
    {
        SqlDataReader rd;
        SqlConnection con = new SqlConnection(GymsoftConnection());
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        rd = cmd.ExecuteReader();
        return rd;
    }

}
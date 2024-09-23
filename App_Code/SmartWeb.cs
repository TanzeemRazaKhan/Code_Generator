using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for SmartWeb
/// </summary>
public class SmartWeb
{
	//private Page page;
	//SmartWeb() -- Constructor --- Pending.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public SmartWeb()
	{
		//this.page = page;
		//
		// TODO: Add constructor logic here
		//
	}

	//MyDBConnection() -- this function is used for establishing the connection with DB.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public string MyDBConnection()
	{
		string str = ConfigurationManager.ConnectionStrings["SmartWebConnectionString"].ConnectionString.ToString();
		return str;
	}

	//GetDatareader (String) -- this function is used for establishing the connection with DB and retrieving the data as per the query passed throgh parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public SqlDataReader GetDatareader(string str)
	{
		SqlDataReader rd;
		SqlConnection con = new SqlConnection(MyDBConnection());
		SqlCommand cmd = new SqlCommand(str, con);
		con.Open();
		rd = cmd.ExecuteReader();
		return rd;
	}

	//execute_query (String) -- this function is used for executing query as per the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public int execute_query(string query)
	{
		SqlConnection con = new SqlConnection(MyDBConnection());

		SqlCommand cmd = new SqlCommand(query, con);
		con.Open();
		int rowsaffected = (int)cmd.ExecuteNonQuery();
		con.Close();
		return rowsaffected;
	}

	//Encrypt (String) -- this function is used for encrypting data passed through parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public string Encrypt(string clearText)
	{
		string strmsg = string.Empty;
		byte[] encode = new byte[clearText.Length];
		encode = Encoding.UTF8.GetBytes(clearText);
		strmsg = Convert.ToBase64String(encode);
		return strmsg;
	}
	//Decrypt (String) -- this function is used for decrypt data passed through parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public string Decrypt(string cipherText)
	{
		string decryptpwd = string.Empty;
		UTF8Encoding encodepwd = new UTF8Encoding();
		Decoder Decode = encodepwd.GetDecoder();
		cipherText = cipherText.Replace('-', '+').Replace('_', '/').PadRight(4 * ((cipherText.Length + 3) / 4), '=');
		byte[] todecode_byte = Convert.FromBase64String(cipherText);
		int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
		char[] decoded_char = new char[charCount];
		Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
		decryptpwd = new String(decoded_char);
		return decryptpwd;
	}

	//GetDashboardItem (String) -- this function is used for getting Dashboard Data executing query as per the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public int checkrow_intable(string qry)
	{
		SqlConnection con = new SqlConnection(MyDBConnection());
		SqlCommand cmd = new SqlCommand(qry, con);
		con.Open();
		int count = (int)cmd.ExecuteScalar();
		con.Close();
		return count;
	}


	//InsertRecord (String, String) -- this function is used for inserting a new record in the Table with the contents passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14 
	public int insert_Content(string tablename, string content)
	{
		SqlConnection objcon = new SqlConnection(MyDBConnection());
		string del = "insert into " + tablename + "  values ('" + content + "')";
		SqlCommand cmd11 = new SqlCommand(del, objcon);
		objcon.Open();
		int roweffect = cmd11.ExecuteNonQuery();
		objcon.Close();
		return roweffect;
	}

	//UpdateRecord (String, String, String) -- this function is used for updating an existing record in the Table with the contents passed as the parameter with specific ID.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public int Update_Content(string tablename, string columnname, string content, string id)
	{
		SqlConnection objcon = new SqlConnection(MyDBConnection());
		string del = "update " + tablename + " set " + columnname + "='" + content + "' where id='" + id + "'";
		SqlCommand cmd11 = new SqlCommand(del, objcon);
		objcon.Open();
		int roweffect = cmd11.ExecuteNonQuery();
		objcon.Close();
		return roweffect;
	}

	//DeleteRecord (String) -- this function is used for inserting a new record in the Table with the contents passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public int Delete_Content(string tablename)
	{
		SqlConnection objcon = new SqlConnection(MyDBConnection());
		string del = "delete from " + tablename;
		SqlCommand cmd = new SqlCommand(del, objcon);
		objcon.Open();
		int roweffect = cmd.ExecuteNonQuery();
		objcon.Close();
		return roweffect;
	}

	//FillCountry (DDL) -- this function is used for filling country name and storing country code into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillCountry(DropDownList ddl)
	{
		using (SqlDataReader rd = GetDatareader("SELECT * FROM GDMstCountry"))
		{
			if (rd.HasRows)
			{
				//ddl.Items.Clear();
				//ddl.Items.Insert(0, "Select Country");
				ddl.DataSource = rd;
				ddl.DataTextField = "CountryName";
				ddl.DataValueField = "CountryCode";
				ddl.DataBind();
			}
		}
	}
	//FillState (DDL,int) --SelectIndexChange-- this function is used for filling state name as selected country in ddl and storing state id into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillState(DropDownList ddl, int countryid)
	{
		using (SqlDataReader rd = GetDatareader("select * from GDMstState where CountryCode='" + countryid + "'"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select State");
				ddl.DataSource = rd;
				ddl.DataTextField = "StateName";
				ddl.DataValueField = "StateID";
				ddl.DataBind();
			}
		}
	}

	//FillCity (DDL,int) --SelectIndexChange-- this function is used for filling city name as selected country in ddl and storing city id into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillCity(DropDownList ddl, int stateid)
	{
		using (SqlDataReader rd = GetDatareader("select * from GDMstCity where StateId='" + stateid + "'"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select City");
				ddl.DataSource = rd;
				ddl.DataTextField = "CityName";
				ddl.DataValueField = "CityId";
				ddl.DataBind();
			}
		}
	}

	//FillOrgType (DDL) -- this function is used for filling Org Type and storing Org Type into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillOrgType(DropDownList ddl)
	{
		using (SqlDataReader rd = GetDatareader("select * from MstOrgType"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select Org Type");
				ddl.DataSource = rd;
				ddl.DataTextField = "OrganisationType";
				ddl.DataValueField = "OrganisationType";
				ddl.DataBind();
			}
		}
	}

	//FillBankName (DDL) -- this function is used for filling Bank Name and storing Bank Id into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillBankName(DropDownList ddl)
	{
		ddl.Items.Clear();
		using (SqlDataReader rd = GetDatareader("select * from GDMstBanks"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select Bank Name");
				ddl.DataSource = rd;
				ddl.DataTextField = "BankName";
				ddl.DataValueField = "BankId";
				ddl.DataBind();
			}
		}
	}

	//FillSubscriptionType (DDL) -- this function is used for filling Subs Name and storing Subs Name into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillSubscriptionType(DropDownList ddl)
	{
		ddl.Items.Clear();
		using (SqlDataReader rd = GetDatareader("select * from MstSubscType"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select Subscription Type");
				ddl.DataSource = rd;
				ddl.DataTextField = "SubsCName";
				ddl.DataValueField = "SubsCName";
				ddl.DataBind();
			}
		}
	}

	//FillUnit (DDL) -- this function is used for filling Unit Name and storing Unit Code into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillUnit(DropDownList ddl)
	{
		ddl.Items.Clear();
		using (SqlDataReader rd = GetDatareader("select * from GDMstUnit"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select Unit");
				ddl.DataSource = rd;
				ddl.DataTextField = "UnitName";
				ddl.DataValueField = "UnitCode";
				ddl.DataBind();
			}
		}
	}

	//FillOrgName (DDL) -- this function is used for filling Org Name and storing Org Code into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillOrgName(DropDownList ddl)
	{
		ddl.Items.Clear();
		using (SqlDataReader rd = GetDatareader("select * from MstOrganization"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select Org Name");
				ddl.DataSource = rd;
				ddl.DataTextField = "OrgName";
				ddl.DataValueField = "OrgName";
				ddl.DataBind();
			}
		}
	}

	//FillOrgName (DDL) -- this function is used for filling Org Name and storing Org Code into the DDL passed as the parameter.
	//Developed by: Sameer
	//Created on: 2024.02.14 Modified on 2024.02.14
	public void FillUserType(DropDownList ddl)
	{
		ddl.Items.Clear();
		using (SqlDataReader rd = GetDatareader("select * from MstUserType"))
		{
			if (rd.HasRows)
			{
				ddl.Items.Clear();
				ddl.Items.Insert(0, "Select User Type");
				ddl.DataSource = rd;
				ddl.DataTextField = "UserTypeName";
				ddl.DataValueField = "UserTypeName";
				ddl.DataBind();
			}
		}
	}
}
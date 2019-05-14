using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;

/// <summary>
/// Summary description for CSDL
/// </summary>
public class CSDL
{
    public CSDL()
    {
    }

    public string chuoiketnoi = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();
    public DataTable GetData(string sql)
    {
        SqlConnection cnn = new SqlConnection(chuoiketnoi);
        try
        {
            SqlDataAdapter sqlDa = new SqlDataAdapter(sql, cnn);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
       
        
    }
    public void Execute(string sql)
    {
        SqlConnection cnn = new SqlConnection(chuoiketnoi);
        cnn.Open();
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.ExecuteNonQuery();
        cnn.Close();
    }
    public string GetValue(string sql)
    {
        using (SqlConnection sqlCon = new SqlConnection(chuoiketnoi))
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand(sql, sqlCon);
            string val = cmd.ExecuteScalar().ToString();
            sqlCon.Close();
            return (val);
        }
    }
}
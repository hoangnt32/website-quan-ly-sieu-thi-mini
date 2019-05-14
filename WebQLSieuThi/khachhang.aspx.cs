using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class khachhang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("/trangchu.aspx");
            else
                LoadKH();
            if (Request.QueryString["id"] != null)
            {
                int makh = int.Parse(Request.QueryString["id"].ToString());
                string s = "delete from KhachHang where MaKH=" + makh;
                string sql = "delete from TaiKhoan where MaND=" + makh;
                try
                {
                    kn.Execute(s);
                    kn.Execute(sql);
                    Response.Write("<script> alert('Xóa khách hàng thành công.');window.location='khachhang.aspx'; </script>");
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
        }
    }
    CSDL kn = new CSDL();
    private void LoadKH()
    {
        DataTable dt = kn.GetData("select * from KhachHang");
        gvKhachhang.DataSource = dt;
        gvKhachhang.DataBind();
    }
    public static bool IsValidPhone(string value)
    {
        string pattern = @"^0\d{9}$";
        return Regex.IsMatch(value, pattern);
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (IsValidPhone(txtsdt.Text.Trim())==true)
        {
            string sql = "select MaKH from KhachHang where SDT='" + txtsdt.Text.Trim() + "'";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
                Response.Write("<script type='text/javascript'> alert('Số điện thoại đã tồn tại. Vui lòng kiểm tra lại.') </script>");
            else
                try
                {
                    SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "Proc_ThemKH";
                    cmd.Parameters.Add("@TenKH", SqlDbType.NVarChar, 50).Value = txttenkh.Text.Trim();
                    cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = txtsdt.Text.Trim();
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = "";
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script type='text/javascript'>alert('Thêm khách hàng thành công');window.location='khachhang.aspx';</script>");
                }
                catch
                {
                    Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
        }
        else Response.Write("<script type='text/javascript'> alert('Số điện thoại không hợp lệ. Vui lòng kiểm tra lại.') </script>");
    }

    

    protected void gvKhachhang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvKhachhang.EditIndex = -1;
        LoadKH();
    }

    protected void gvKhachhang_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvKhachhang.EditIndex = e.NewEditIndex;
        LoadKH();
    }

    protected void gvKhachhang_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int makh = int.Parse(gvKhachhang.DataKeys[e.RowIndex].Value.ToString());
        string tenkh = (gvKhachhang.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string email = (gvKhachhang.Rows[e.RowIndex].Cells[3].FindControl("txtemail") as TextBox).Text;
        try
        {
            if (tenkh == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else
            {
                if (ktraEmail(makh, email))
                {
                    lbltb.Text = "";
                    SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "Proc_CapNhatKH";
                    cmd.Parameters.Add("@MaKH", SqlDbType.Int).Value = makh;
                    cmd.Parameters.Add("@TenKH", SqlDbType.NVarChar, 50).Value = tenkh.Trim();
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email.Trim();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    gvKhachhang.EditIndex = -1;
                    LoadKH();
                }
                else
                {
                    Response.Write("<script> alert('Email đã tồn tại.') </script>");
                }
            }

        }
        catch
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }
    private bool ktraEmail(int makh, string email)
    {
        string sql = " select Email from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB1 EXCEPT select Email from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where MaKH=" + makh;
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString()!="" && dt.Rows[i][0].ToString() == email.Trim())
                {
                    return false;
                }
            }
        }
        return true;

    }
    protected void gvKhachhang_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
            lbltb.Text = "";
    }

    protected void gvKhachhang_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script> alert('Xóa thành công.') </script>");
        }
    }

    protected void gvKhachhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvKhachhang.PageIndex = e.NewPageIndex;
        LoadKH();
    }
}
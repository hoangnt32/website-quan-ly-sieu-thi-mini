using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nhanvien : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("dangnhap.aspx");
            else
            {
                LoadNV();
            }
            if (Request.QueryString["id"] != null)
            {
                int manv = int.Parse(Request.QueryString["id"].ToString());
                string s = "delete from NhanVien where MaNV=" + manv;
                string sql = "delete from TaiKhoan where MaND=" + manv;
                try
                {
                    kn.Execute(s);
                    kn.Execute(sql);
                    Response.Write("<script> alert('Xóa nhân viên thành công.');window.location='nhanvien.aspx'; </script>");
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
        }
       
    }
    public static bool IsValidPhone(string value)
    {
        string pattern = @"^0\d{9}$";
        return Regex.IsMatch(value, pattern);
    }
    private void LoadNV()
    {
        DataTable dt = kn.GetData("select * from NhanVien");
        gvNhanvien.DataSource = dt;
        gvNhanvien.DataBind();
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (cmbgtinh.Text == "Giới tính")
            Response.Write("<script type='text/javascript'> alert('Vui lòng chọn giới tính.')</script>");
        else if (cmbchucvu.Text == "Chức vụ")
            Response.Write("<script type='text/javascript'> alert('Vui lòng chọn chức vụ.')</script>");
        else if(IsValidPhone(txtsdt.Text.Trim()))
        
        {
            string sql = "select MaKH from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where Email='" + txtemail.Text.Trim() + "'";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
                Response.Write("<script type='text/javascript'> alert('Email đã tồn tại. Vui lòng kiểm tra lại.') </script>");
            else
            {
                sql = "select MaNV from NhanVien where SDT='" + txtsdt.Text.Trim() + "'";
                dt = kn.GetData(sql);
                if (dt.Rows.Count > 0)
                    Response.Write("<script type='text/javascript'> alert('Số điện thoại đã tồn tại. Vui lòng kiểm tra lại.') </script>");
                else
                    themNV();
            }
        }
        else
            Response.Write("<script type='text/javascript'> alert('Số điện thoại không hợp lệ. Vui lòng kiểm tra lại.') </script>");

    }
    private void themNV()
    {
        try
        {
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ThemNV";
            DateTime date = Convert.ToDateTime(txtngsinh.Text.ToString());
            cmd.Parameters.Add("@TenNV", SqlDbType.NVarChar, 50).Value = txttennv.Text.Trim();
            cmd.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = date;
            cmd.Parameters.Add("@GioiTinh", SqlDbType.NVarChar, 3).Value = cmbgtinh.Text.Trim();
            cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = txtdiachi.Text.Trim();
            cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = txtsdt.Text.Trim();
            cmd.Parameters.Add("@ChucVu", SqlDbType.NVarChar, 50).Value = cmbchucvu.Text.Trim();
            cmd.Parameters.Add("@Luong", SqlDbType.Float).Value = float.Parse(txtluong.Text.ToString());
            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = txtemail.Text.Trim();
            cmd.ExecuteNonQuery();
            con.Close();
            DataTable dt = kn.GetData("select MaNV,ChucVu from NhanVien where MaNV=(select Max(MaNV) from NhanVien)");
            int manv = int.Parse(dt.Rows[0][0].ToString());
            string chucvu = dt.Rows[0][1].ToString();
            try
            {
                kn.Execute(@"INSERT INTO TaiKhoan VALUES(" + manv + ",'" + manv + "','" + MaHoaMatKhau(manv.ToString()) + "','" + chucvu + "')");
                Response.Write("<script type='text/javascript'>alert('Thêm nhân viên thành công');window.location='nhanvien.aspx';</script>");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
        catch
        {
            Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
        }

    }

    protected void gvNhanvien_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvNhanvien.EditIndex = e.NewEditIndex;
        LoadNV();
    }

   
    protected void gvNhanvien_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int manv = int.Parse(gvNhanvien.DataKeys[e.RowIndex].Value.ToString());
        string tennv = (gvNhanvien.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string ngsinh = (gvNhanvien.Rows[e.RowIndex].Cells[2].FindControl("txtngsinh") as TextBox).Text;
        string gtinh = (gvNhanvien.Rows[e.RowIndex].Cells[3].FindControl("cmbgt") as DropDownList).Text;
        string diachi = (gvNhanvien.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
        string sdt = (gvNhanvien.Rows[e.RowIndex].Cells[5].FindControl("txtsodt") as TextBox).Text;
        string email = (gvNhanvien.Rows[e.RowIndex].Cells[6].FindControl("txtemail") as TextBox).Text;
        string chucvu = (gvNhanvien.Rows[e.RowIndex].Cells[7].FindControl("cmbcv") as DropDownList).Text;
        string luong = (gvNhanvien.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text;
        
            try
            {
                if (tennv == "")
                    Response.Write("<script> alert('Tên không được rỗng.') </script>");
                else if (ngsinh == "")
                    Response.Write("<script> alert('Ngày sinh không được rỗng.') </script>");
                else if (gtinh == "")
                    Response.Write("<script> alert('Giới tính không được rỗng.') </script>");
                else if (diachi == "")
                    Response.Write("<script> alert('Địa chỉ không được rỗng.') </script>");
                else if (sdt == "")
                    Response.Write("<script> alert('Số điện thoại không được rỗng.') </script>");
                else if (email == "")
                    Response.Write("<script> alert('Email không được rỗng.') </script>");
                else if (chucvu == "")
                    Response.Write("<script> alert('Chức vụ không được rỗng.') </script>");
                else if (luong == "")
                    Response.Write("<script> alert('Lương không được rỗng.') </script>");
                else if(IsValidPhone(sdt))
                {
                    if (ktraEmail(manv, email))
                        if (ktraSDT(manv, sdt))
                            capnhatNV(manv, tennv, ngsinh, gtinh, diachi, sdt, email, chucvu, luong);
                        else
                            lbltb.Text = "Số điện thoại đã tồn tại.";
                    else
                        lbltb.Text = "Email đã tồn tại.";

                }
                else
                    lbltb.Text = "Số điện thoại không hợp lệ.";

        }
            catch
            {
                lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
            }
       
                
    

    }
    private bool ktraEmail(int manv,string email)
    {
        string sql = " select Email from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB1 EXCEPT select Email from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where MaKH=" + manv;
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i][0].ToString() == email.Trim())
                {
                    return false;
                }
            }
        }
        return true;

    }
    private bool ktraSDT(int manv,string sdt)
    {
        {
            string sql = "select SDT from NhanVien except select SDT from NhanVien where MaNV=" + manv;
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["SDT"].ToString() == sdt.Trim())
                    {
                       
                        return false;

                    }

                }

            }
            return true;

        }
    }
    private void capnhatNV(int manv, string tennv,string ngsinh,string gtinh, string diachi,string sdt,string email, string chucvu, string luong)
    {
        lbltb.Text = "";
        SqlConnection con = new SqlConnection(kn.chuoiketnoi);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "Proc_CapNhatNV";
        cmd.Parameters.Add("@MaNV", SqlDbType.Int).Value = manv;
        cmd.Parameters.Add("@TenNV", SqlDbType.NVarChar, 50).Value = tennv.Trim();
        cmd.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = Convert.ToDateTime(ngsinh);
        cmd.Parameters.Add("@GioiTinh", SqlDbType.NVarChar, 3).Value = gtinh.Trim();
        cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = diachi.Trim();
        cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = sdt.Trim();
        cmd.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = email.Trim();
        cmd.Parameters.Add("@ChucVu", SqlDbType.NVarChar, 50).Value = chucvu.Trim();
        cmd.Parameters.Add("@Luong", SqlDbType.Float).Value = float.Parse(luong);
        cmd.ExecuteNonQuery();
        con.Close();
        gvNhanvien.EditIndex = -1;
        LoadNV();
    }
    public string MaHoaMatKhau(string password)
    {
        UnicodeEncoding mahoa = new UnicodeEncoding();
        Byte[] hashBytes = mahoa.GetBytes(password);
        // Compute the SHA-1 hash 
        SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
        Byte[] cryptPassword = sha1.ComputeHash(hashBytes);
        return BitConverter.ToString(cryptPassword);
    }
    protected void gvNhanvien_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {      
        gvNhanvien.EditIndex = -1;
        lbltb.Text = "";
        LoadNV();
       
    }

    protected void gvNhanvien_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvNhanvien_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if(e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'> alert('Xóa thành công.');window.location='nhanvien.aspx'; </script>");
        }
    }

    protected void gvNhanvien_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNhanvien.PageIndex = e.NewPageIndex;
        LoadNV();
    }
}
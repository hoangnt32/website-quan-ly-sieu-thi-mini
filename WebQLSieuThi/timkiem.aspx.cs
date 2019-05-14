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

public partial class timkiem : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
    if(!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("dangnhap.aspx");
            else
            {
                if (Request.QueryString["manv"] == null)
                    gvTimKiem.Visible = false;
                else
                {
                    LoadNV(int.Parse(Request.QueryString["manv"].ToString()));
                    if (gvTimKiem.Rows.Count == 0)
                        lblkqtimkiem.Text = "Không tìm thấy nhân viên có mã " + Request.QueryString["manv"].ToString();
                }

                if (Request.QueryString["makh"] == null)
                    gvTKkhachhang.Visible = false;
                else
                {
                    LoadKH(int.Parse(Request.QueryString["makh"].ToString()));
                    if (gvTKkhachhang.Rows.Count == 0)
                        lblkqtimkiem.Text = "Không tìm thấy khách hàng có mã " + Request.QueryString["makh"].ToString();
                }

                if (Request.QueryString["nhacc"] == null)
                    gvNhaCC.Visible = false;
                else
                {
                    LoadNCC(Request.QueryString["nhacc"].ToString());
                    if (gvNhaCC.Rows.Count == 0)
                        lblkqtimkiem.Text = "Không tìm thấy nhà cung cấp có từ khóa " + Request.QueryString["nhacc"].ToString();
                }
                if (Request.QueryString["loaisp"] == null)
                    gvLoaiSP.Visible = false;
                else
                   if (gvLoaiSP.Rows.Count == 0)
                        lblkqtimkiem.Text = "Không tìm thấy loại sản phẩm có tên " + Request.QueryString["loaisp"].ToString();

                if (Request.QueryString["tensp"] == null)
                    gvSanPham.Visible = false;
                else
                   if (gvSanPham.Rows.Count == 0)
                    lblkqtimkiem.Text = "Không tìm thấy sản phẩm có tên " + Request.QueryString["tensp"].ToString();

                if (Request.QueryString["tennd"] == null)
                    gvNguoiDung.Visible = false;
                else
                {
                    LoadNguoiDung(Request.QueryString["tennd"].ToString());
                    if (gvNguoiDung.Rows.Count == 0)  
                        lblkqtimkiem.Text = "Không tìm thấy người dùng có tên " + Request.QueryString["tennd"].ToString();
                }
                if (Request.QueryString["tukhoa"] == null)
                    gvHD.Visible = false;
                else
                 if (gvHD.Rows.Count == 0)
                    lblkqtimkiem.Text = "Không tìm thấy hóa đơn có từ khóa  " + Request.QueryString["tukhoa"].ToString();

                if (Request.QueryString["mapn"] == null)
                    gvPN.Visible = false;
                else
                 if (gvPN.Rows.Count == 0)
                    lblkqtimkiem.Text = "Không tìm thấy phiếu nhập có mã  " + Request.QueryString["mapn"].ToString();

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
                if (Request.QueryString["id_"] != null)
                {
                    int makh = int.Parse(Request.QueryString["id_"].ToString());
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
                if (Request.QueryString["idncc"] != null)
                {
                    int mancc = int.Parse(Request.QueryString["idncc"].ToString());
                    string s = "delete from NhaCungCap where MaNCC=" + mancc;
                    try
                    {
                        kn.Execute(s);
                        Response.Write("<script> alert('Xóa nhà cung cấp thành công.');window.location='nhacungcap.aspx'; </script>");
                    }

                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
                }
            }
        }
    }
    private void LoadNV(int manv)
    {
        DataTable dt = kn.GetData("select * from NhanVien where MaNV="+manv);
        gvTimKiem.DataSource = dt;
        gvTimKiem.DataBind();
    }
    private void LoadKH(int makh)
    {
        DataTable dt = kn.GetData("select * from KhachHang where MaKH=" + makh+ " or SDT=concat('0',"+makh+")");
        gvTKkhachhang.DataSource = dt;
        gvTKkhachhang.DataBind();
    }
    protected void LoadNguoiDung(string tennd)
    {
        gvNguoiDung.DataSource = kn.GetData("select * from TaiKhoan where TenND='"+tennd.Trim()+"'");
        gvNguoiDung.DataBind();
    }
    protected void LoadNCC(string str)
    {
        int a;
        string sql = "";
        if (int.TryParse(str.Trim(),out a)==false)
           sql= "select * from NhaCungCap where TenNCC like N'%" + str.Trim() + "%'";
        else
           sql = "select * from NhaCungCap where MaNCC ="+str;
        gvNhaCC.DataSource = kn.GetData(sql);
        gvNhaCC.DataBind();
    }
    public static bool IsValidPhone(string value)
    {
        string pattern = @"^0\d{9}$";
        return Regex.IsMatch(value, pattern);
    }
    protected void gvTimKiem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvTimKiem.EditIndex = -1;
        LoadNV(int.Parse(Request.QueryString["manv"].ToString()));
    }

    protected void gvTimKiem_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa nhân viên thành công');window.location='nhanvien.aspx';</script>");
        }
    }

    protected void gvTimKiem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTimKiem.EditIndex = e.NewEditIndex;
        LoadNV(int.Parse(Request.QueryString["manv"].ToString()));
    }

    protected void gvTimKiem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int manv = int.Parse(gvTimKiem.DataKeys[e.RowIndex].Value.ToString());
        string tennv = (gvTimKiem.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string ngsinh = (gvTimKiem.Rows[e.RowIndex].Cells[2].FindControl("txtngsinh") as TextBox).Text;
        string gtinh = (gvTimKiem.Rows[e.RowIndex].Cells[3].FindControl("cmbgt") as DropDownList).Text;
        string diachi = (gvTimKiem.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
        string sdt = (gvTimKiem.Rows[e.RowIndex].Cells[5].FindControl("txtsodt") as TextBox).Text;
        string email = (gvTimKiem.Rows[e.RowIndex].Cells[6].FindControl("txtemail") as TextBox).Text;
        string chucvu = (gvTimKiem.Rows[e.RowIndex].Cells[7].FindControl("cmbcv") as DropDownList).Text;
        string luong = (gvTimKiem.Rows[e.RowIndex].Cells[8].Controls[0] as TextBox).Text;
        
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
            else if (IsValidPhone(sdt))
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
    private bool ktraEmail(int manv, string email)
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
    private bool ktraSDT(int manv, string sdt)
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
    private void capnhatNV(int manv, string tennv, string ngsinh, string gtinh, string diachi, string sdt, string email, string chucvu, string luong)
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
        gvTimKiem.EditIndex = -1;
        LoadNV(int.Parse(Request.QueryString["manv"].ToString()));
    }
    protected void gvTimKiem_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

   

    protected void gvTKkhachhang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvTKkhachhang.EditIndex = -1;
        LoadKH(int.Parse(Request.QueryString["makh"].ToString()));
    }

    protected void gvTKkhachhang_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa khách hàng thành công');window.location='khachhang.aspx';</script>");
        }
    }

    protected void gvTKkhachhang_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTKkhachhang.EditIndex = e.NewEditIndex;
        LoadKH(int.Parse(Request.QueryString["makh"].ToString()));
    }

    protected void gvTKkhachhang_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvTKkhachhang_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int makh = int.Parse(gvTKkhachhang.DataKeys[e.RowIndex].Value.ToString());
        string tenkh = (gvTKkhachhang.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string email = (gvTKkhachhang.Rows[e.RowIndex].Cells[3].FindControl("txtemail") as TextBox).Text;
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
                    gvTKkhachhang.EditIndex = -1;
                    LoadKH(int.Parse(Request.QueryString["makh"].ToString()));
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


    protected void gvNhaCC_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa nhà cung cấp thành công');window.location='nhacungcap.aspx';</script>");
        }
    }

    protected void gvNhaCC_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvNhaCC.EditIndex = e.NewEditIndex;
        LoadNCC(Request.QueryString["nhacc"].ToString());
    }

    protected void gvNhaCC_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvNhaCC_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int mancc = int.Parse(gvNhaCC.DataKeys[e.RowIndex].Value.ToString());
        string tenncc = (gvNhaCC.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string diachi = (gvNhaCC.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
        string sdt = (gvNhaCC.Rows[e.RowIndex].Cells[3].FindControl("txtsodt") as TextBox).Text;

        try
        {
            if (tenncc == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else if (sdt == "")
                Response.Write("<script> alert('Số điện thoại không được rỗng.') </script>");
            else if (diachi == "")
                Response.Write("<script> alert('Địa chỉ không được rỗng.') </script>");
            else if(IsValidPhone(sdt))
            {
                lbltb.Text = "";
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_CapNhatNCC";
                cmd.Parameters.Add("@MaNCC", SqlDbType.Int).Value = mancc;
                cmd.Parameters.Add("@TenNCC", SqlDbType.NVarChar, 100).Value = tenncc.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = diachi.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = sdt.Trim();
                cmd.ExecuteNonQuery();
                con.Close();
                gvNhaCC.EditIndex = -1;
                LoadNCC(Request.QueryString["nhacc"].ToString());
            }
            else
                Response.Write("<script> alert('Số điện thoại không hợp lệ.') </script>");

        }
        catch
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }

    protected void gvNhaCC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvNhaCC.EditIndex = -1;
        LoadNCC(Request.QueryString["nhacc"].ToString());
    }

    protected void gvLoaiSP_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa loại sản phẩm thành công');window.location='loaisanpham.aspx';</script>");
        }
    }

    protected void gvLoaiSP_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLoaiSP.EditIndex = e.NewEditIndex;
    }

    protected void gvLoaiSP_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvLoaiSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int maloai = int.Parse(gvLoaiSP.DataKeys[e.RowIndex].Value.ToString());
        string tenloai = (gvLoaiSP.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        try
        {
            if (tenloai == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else
            {
                lbltb.Text = "";
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_CapNhatLoaiSP";
                cmd.Parameters.Add("@MaLoai", SqlDbType.Int).Value = maloai;
                cmd.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = tenloai.Trim();
                cmd.ExecuteNonQuery();
                con.Close();
                gvLoaiSP.EditIndex = -1;
            }

        }
        catch
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }

    protected void gvLoaiSP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của loại sản phẩm có mã= " + DataBinder.Eval(e.Row.DataItem, "MaLoai") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }


        }
    }

    protected void gvLoaiSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvLoaiSP.EditIndex = -1;
    }

    protected void gvSanPham_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa sản phẩm thành công');window.location='sanpham.aspx';</script>");
        }
    }

    protected void gvSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của sản phẩm có mã= " + DataBinder.Eval(e.Row.DataItem, "MaSP") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }

        }
    }


    
    protected void gvHD_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của hóa đơn có mã= " + DataBinder.Eval(e.Row.DataItem, "MaHD") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }

        }
    }

    protected void gvHD_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script type='text/javascript'>alert('Xóa hóa đơn thành công');window.location='hoadon.aspx';</script>");
        }
    }

    protected void gvPN_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của phiếu nhập có mã= " + DataBinder.Eval(e.Row.DataItem, "MaPhieu") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }

    

    protected void gvDDH_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của đơn hàng có mã= " + DataBinder.Eval(e.Row.DataItem, "MaDH") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }
}
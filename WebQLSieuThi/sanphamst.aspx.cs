using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sanphamst : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("dangnhap.aspx");
            else
            {
                if (Request.QueryString["masp"] == null)
                {
                    lblhinh.Text = "";
                    btnCapNhat.Visible = false;
                    btnLuu.Visible = true;
                    txtkm.Text = "0";
                    LoadCmb("select MaLoai,TenLoai from LoaiSP", "TenLoai", "MaLoai", cmbloai, "Loại sản phẩm");
                    LoadCmb("select MaNCC,TenNCC from NhaCungCap", "TenNCC", "MaNCC", cmbncc, "Nhà cung cấp");
                }
                else
                {
                    btnLuu.Visible = false;
                    btnCapNhat.Visible = true;
                    LoadCmb("select MaLoai,TenLoai from LoaiSP", "TenLoai", "MaLoai", cmbloai, "Loại sản phẩm");
                    LoadCmb("select MaNCC,TenNCC from NhaCungCap", "TenNCC", "MaNCC", cmbncc, "Nhà cung cấp");
                    int masp = int.Parse(Request.QueryString["masp"].ToString());
                    DataTable dt = kn.GetData("select TenSP,MaLoai,MaNCC,DVT,HinhAnh,ChiTiet,GiaBan,KhuyenMai from SanPham where MaSP="+masp );
                    if (dt.Rows.Count > 0)
                    {
                        txttensp.Text = dt.Rows[0][0].ToString();
                        cmbloai.SelectedValue= dt.Rows[0][1].ToString();
                        cmbncc.SelectedValue = dt.Rows[0][2].ToString();
                        cmbdvt.SelectedValue = dt.Rows[0][3].ToString();
                        int vt = dt.Rows[0][4].ToString().LastIndexOf("/");
                        string hinh = dt.Rows[0][4].ToString().Substring(vt);
                        lblhinh.Text = hinh.Substring(hinh.LastIndexOf("/") + 1);
                        editor.Text = dt.Rows[0][5].ToString();
                        txtgiaban.Text = dt.Rows[0][6].ToString();
                        txtkm.Text = dt.Rows[0][7].ToString();
                    }
                }
            }
        }
       
    }
    CSDL kn = new CSDL();
    protected void LoadCmb(string sql, string textfield, string valuefield, DropDownList cmb, string name)
    {
        DataTable dt = kn.GetData(sql);
        DataTable dt1 = new DataTable();
        dt1.Columns.Add(valuefield);
        dt1.Columns.Add(textfield);
        DataRow dr = dt1.NewRow();
        dr[valuefield] = 1;
        dr[textfield] = name;
        dt1.Rows.Add(dr);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr1 = dt.Rows[i];
            dt1.ImportRow(dr1);
        }

        cmb.DataSource = dt1;
        cmb.DataTextField = textfield;
        cmb.DataValueField = valuefield;
        cmb.DataBind();
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && hinhmh.HasFile && CheckFileType(hinhmh.FileName))
        {
            string fileName = "img/" + hinhmh.FileName;
            string filePath = MapPath(fileName);
            hinhmh.SaveAs(filePath);
            try
            {
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_ThemSP";
                cmd.Parameters.Add("@TenSP", SqlDbType.NVarChar, 50).Value = txttensp.Text.Trim();
                cmd.Parameters.Add("@MaLoai", SqlDbType.Int).Value = cmbloai.SelectedValue.ToString().Trim();
                cmd.Parameters.Add("@MaNCC", SqlDbType.Int).Value = cmbncc.SelectedValue.ToString().Trim();
                cmd.Parameters.Add("@DVT", SqlDbType.NVarChar, 10).Value = cmbdvt.SelectedValue.ToString().Trim();
                cmd.Parameters.Add("@HinhAnh", SqlDbType.NVarChar, 100).Value = "/"+fileName;
                cmd.Parameters.Add("@ChiTiet", SqlDbType.NVarChar, 4000).Value = editor.Text;
                cmd.Parameters.Add("@GiaBan", SqlDbType.Float).Value = Convert.ToDecimal(txtgiaban.Text.ToString());
                cmd.Parameters.Add("@KhuyenMai", SqlDbType.Int).Value = Convert.ToInt32(txtkm.Text.ToString());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script type='text/javascript'>alert('Thêm sản phẩm thành công');window.location='sanpham.aspx';</script>");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
        else
            lbltbao.Text = "lỗi";
        
    }
    bool CheckFileType(string fileName)
    {

        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }

    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["masp"] != null)
        {

            string fileName, filePath ;
            int masp = int.Parse(Request.QueryString["masp"].ToString());
            if (hinhmh.HasFile && CheckFileType(hinhmh.FileName))
            {
                fileName = "img/" + hinhmh.FileName;
                filePath = MapPath(fileName);
                hinhmh.SaveAs(filePath);
            }
            else
                fileName = "img/" + lblhinh.Text;

            if (txttensp.Text == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else if (cmbloai.Text == "Loại sản phẩm")
                Response.Write("<script> alert('Loại sản phẩm không được rỗng.') </script>");
            else if (cmbncc.Text == "Nhà cung cấp")
                Response.Write("<script> alert('Nhà cung cấp không được rỗng.') </script>");
            else if (cmbdvt.Text == "Đơn vị tính")
                Response.Write("<script> alert('Đơn vị tính không được rỗng.') </script>");
            else if (txtgiaban.Text == "")
                    Response.Write("<script> alert('Giá bán không được rỗng.') </script>");
            else if (txtgiaban.Text != "")
            {
                string sql = "select top 1 GiaNhap from CTPhieuNhap where MaSP=" + masp + " order by MaPhieu desc";
                DataTable dt = kn.GetData(sql);
                if (dt.Rows.Count > 0)
                {
                    float gianhap = float.Parse(dt.Rows[0][0].ToString());
                    if (float.Parse(txtgiaban.Text) < gianhap)
                        Response.Write("<script> alert('Sản phẩm có giá nhập là " + String.Format("{0:#,##0}", gianhap) + " VND. Đơn giá bán phải lớn hơn đơn giá nhập.') </script>");
                    else if (txtkm.Text == "")
                        Response.Write("<script> alert('Khuyến mãi không được rỗng.') </script>");
                    else
                        try
                        {
                            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                            con.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.Connection = con;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "Proc_CapNhatSP";
                            cmd.Parameters.Add("@MaSP", SqlDbType.Int).Value = masp;
                            cmd.Parameters.Add("@TenSP", SqlDbType.NVarChar, 50).Value = txttensp.Text.Trim();
                            cmd.Parameters.Add("@MaLoai", SqlDbType.Int).Value = cmbloai.SelectedValue.ToString().Trim();
                            cmd.Parameters.Add("@MaNCC", SqlDbType.Int).Value = cmbncc.SelectedValue.ToString().Trim();
                            cmd.Parameters.Add("@DVT", SqlDbType.NVarChar, 10).Value = cmbdvt.SelectedValue.ToString().Trim();
                            cmd.Parameters.Add("@HinhAnh", SqlDbType.NVarChar, 100).Value = "/" + fileName;
                            cmd.Parameters.Add("@ChiTiet", SqlDbType.NVarChar, 4000).Value = editor.Text;
                            cmd.Parameters.Add("@GiaBan", SqlDbType.Float).Value = Convert.ToDecimal(txtgiaban.Text.ToString());
                            cmd.Parameters.Add("@KhuyenMai", SqlDbType.Int).Value = Convert.ToInt32(txtkm.Text.ToString());
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script type='text/javascript'>alert('Cập nhật sản phẩm thành công');window.location='sanpham.aspx';</script>");
                        }
                        catch
                        {
                            Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                        }
                }
                else
                {
                    Response.Write("<script> alert('Vui lòng nhập sản phẩm này vào phiếu nhập') </script>");
                }
             }
            
            
        }
    }
}
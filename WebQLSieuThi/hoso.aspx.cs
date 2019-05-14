using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hoso : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    string email = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["manvien"] != null)
            {
                DataTable dt = kn.GetData("select MaNV,TenNV,NgaySinh,GioiTinh,DiaChi,SDT,Email from NhanVien where MaNV =" + int.Parse(Session["manvien"].ToString()));
                if (dt.Rows.Count > 0)
                {
                    txttendn.Text = dt.Rows[0][0].ToString();
                    txthoten.Text = dt.Rows[0][1].ToString();
                    DateTime date = Convert.ToDateTime(dt.Rows[0][2].ToString());
                    txtngsinh.Text = String.Format("{0:dd/MM/yyyy}", date);
                    cmbgtinh.Text = dt.Rows[0][3].ToString();
                    txtdiachi.Text = dt.Rows[0][4].ToString();
                    txtsdt.Text = dt.Rows[0][5].ToString();
                    txtemail.Text = dt.Rows[0][6].ToString();
                    lblemail.Text = txtemail.Text;
                    lblsdt.Text = txtsdt.Text;
                }
                else
                    lbltbao.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
            }
            else
            {
                Response.Redirect("dangnhap.aspx");
            }

        }
       
    }

    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        if(lblemail.Text!=txtemail.Text.Trim())
        {
            string sql = "select MaKH from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where Email='" + txtemail.Text.Trim() + "'";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
                lbltbao.Text = "Email đã tồn tại.";
            else
            {
                if (lblsdt.Text != txtsdt.Text.Trim())
                {
                    sql = "select MaNV from NhanVien where SDT='" + txtsdt.Text.Trim() + "'";
                    dt = kn.GetData(sql);
                    if (dt.Rows.Count > 0)
                        lbltbao.Text = "Số điện thoại đã tồn tại.";
                    else
                        capNhatThongTin();
                }
                else
                    capNhatThongTin();
            }
              
        }
        else
        {
            if (lblsdt.Text != txtsdt.Text.Trim())
            {
                string sql = "select MaNV from NhanVien where SDT='" + txtsdt.Text.Trim() + "'";
                DataTable dt = kn.GetData(sql);
                if (dt.Rows.Count > 0)
                    lbltbao.Text = "Số điện thoại đã tồn tại.";
                else
                    capNhatThongTin();
            }
            else
                capNhatThongTin();
        }
        
    }
    private void capNhatThongTin()
    {
        try
        {
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_CapNhatNguoiDung";
            cmd.Parameters.Add("@MaNV", SqlDbType.Int).Value = int.Parse(txttendn.Text.Trim());
            cmd.Parameters.Add("@TenNV", SqlDbType.NVarChar, 50).Value = txthoten.Text.Trim();
            DateTime date = Convert.ToDateTime(txtngsinh.Text.Trim());
            cmd.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = date;
            cmd.Parameters.Add("@GioiTinh", SqlDbType.NVarChar, 3).Value = cmbgtinh.Text.Trim();
            cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = txtdiachi.Text.Trim();
            cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = txtsdt.Text.Trim();
            cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = txtemail.Text.Trim();
            cmd.ExecuteNonQuery();
            con.Close();
            Session["ten"] = txthoten.Text.Trim();
            Response.Write("<script> alert('Cập nhật thông tin thành công.');window.location='hoso.aspx';</script>");
        }
        catch
        {
            lbltbao.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_dathang : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    int makh;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tendn"] != null)
        {
            string sql = "select MaKH from KhachHang where SDT='" + Session["tendn"].ToString() + "'";
            DataTable dtMaKH = kn.GetData(sql);
            if (dtMaKH.Rows.Count > 0)
            {
                makh = int.Parse(dtMaKH.Rows[0][0].ToString());
                if (Session["giohang"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["giohang"];
                    float tongtien = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["GiaBan"].ToString()) * (1 - float.Parse(row["KhuyenMai"].ToString()) / 100);
                        tongtien += float.Parse(row["ThanhTien"].ToString());
                    }
                    lbltongthanhtien.Text = String.Format("{0:#,##0}", float.Parse(tongtien.ToString())) + " đồng";
                    gvgiohang.DataSource = dt;
                    gvgiohang.DataBind();
                    lbltongcong.Visible = true;
                    lbltongthanhtien.Visible = true;
                }
                else
                    Response.Redirect("~/sieuthi/giohang.aspx");
            }
        }
        else
            Response.Write("<script type='text/javascript' language='javascript'>alert('Bạn cần đăng nhập để mua hàng.');window.location='../dangnhap.aspx';</script>");
        if (!IsPostBack)
        {
            string laythongtin = "select TenKH,DDH.DiaChiNhan,KH.SDT from KHACHHANG KH, DonDatHang DDH where KH.MaKH=DDH.MaKH and KH.MaKH=" + makh;
            DataTable dtKH = kn.GetData(laythongtin);
            if(dtKH.Rows.Count>0)
            {
                txthoten.Text = dtKH.Rows[0][0].ToString();
                txtdiachi.Text= dtKH.Rows[0][1].ToString();
                txtdt.Text= dtKH.Rows[0][2].ToString();
            }

        }
    }
    protected void btndathang_Click(object sender, EventArgs e)
    {
        try
        {
            ThemDonDatHang();
        }
        catch
        {
            lblthongbao.Text = "Lỗi.";
        }
    }
    private void ThemCTDonDatHang()
    {
        try
        {
            string str = "select max(MaDH) from DonDatHang where MaKH=" + makh;
            DataTable dt = kn.GetData(str);
            if (dt.Rows.Count > 0)
            {
                string sodh = (dt.Rows[0][0].ToString());
                dt = (DataTable)Session["giohang"];
                int ma_sp, soluong;
                float dongia, khuyenmai;
                string ghichu;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ma_sp = int.Parse(dt.Rows[i]["MaSP"].ToString());
                    soluong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                    dongia = float.Parse(dt.Rows[i]["GiaBan"].ToString());
                    khuyenmai = float.Parse(dt.Rows[i]["KhuyenMai"].ToString());
                    ghichu = khuyenmai == 0 ? "" : "Giảm " + khuyenmai + "%";
                    string themcthd = "insert into CTDonDatHang values(" + int.Parse(sodh) + "," + ma_sp + "," + soluong + "," + dongia + ",0,N'"+ghichu+"')";
                    kn.Execute(themcthd);
                }
            }
        }
        catch
        {
            lblthongbao.Text = "Lỗi.";
        }

    }
    private void ThemDonDatHang()
    {
        try
        {
            string hinhthucgiao = cmbhtgh.Text.Trim();
            string themddh = "insert into DonDatHang values(" + makh + ",@ngaydat,0,@ngaygiao,N'" + txthoten.Text.Trim() + "',N'" + txtdiachi.Text.Trim() + "','" + txtdt.Text.Trim() + "',N'" + txthttt.Text + "',N'" + hinhthucgiao + "',0)";
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            cmd.CommandText = themddh;
            cmd.Parameters.Add("@ngaydat", SqlDbType.DateTime);
            cmd.Parameters["@ngaydat"].Value = DateTime.Now;
            cmd.Parameters.Add("@ngaygiao", SqlDbType.Date);
            cmd.Parameters["@ngaygiao"].Value = DateTime.Now.AddDays(3);
            cmd.ExecuteNonQuery();
            con.Close();
            lblthongbao.Text = "";
            ThemCTDonDatHang();
            Session["giohang"] = null;
            Response.Write("<script type='text/javascript' language='javascript'>alert('Thông tin đặt hàng của Quý khách đã được gửi thành công. Xin cảm ơn Quý khách.');window.location='../trangchu.aspx';</script>");
        }
        catch
        {
            lblthongbao.Text = "Lỗi.";
        }
    }
}
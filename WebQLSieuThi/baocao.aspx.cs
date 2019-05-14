using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class baocao : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["bc"] == "doanhthu")
        {
            string sql = "select * from R_DoanhThu order by NgayBan desc";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            XRDoanhThu rpt = new XRDoanhThu();
            rpt.lblngaydt.Text = "Tổng doanh thu ";
            rpt.DataSource = ds;
            this.Vbaocao.Report = rpt;
        }
        else
            if (Request.QueryString["timkiemdt"] != null)
        {
            string ngay = Request.QueryString["timkiemdt"].ToString();
            string[] chuoi = ngay.Split('-');
            string[] str = chuoi[0].Split('/');
            string[] str1 = chuoi[1].Split('/');
            string date = str[2] + "-" + str[1] + "-" + str[0];
            string date1 = str1[2] + "-" + str1[1] + "-" + str1[0];
            string sql = "";
            sql = "select * from R_DoanhThu where NgayBan between '" + date + "' and '" + date1 + " 23:59:59' order by NgayBan desc";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds,"R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhThu rpt = new XRDoanhThu();
                rpt.lblngaydt.Text = "Tổng doanh thu từ "+ str[0] + "/" + str[1] + "/" + str[2] +" đến "+ str1[0] + "/" + str1[1] + "/" + str1[2];
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else if (Request.QueryString["bc"] == "doanhso")
        {
            string sql = "select * from R_DoanhThu";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            XRDoanhSo rpt = new XRDoanhSo();
            rpt.lblngayds.Text = "Tổng doanh số";
            rpt.DataSource = ds;
            this.Vbaocao.Report = rpt;
        }
        else
            if (Request.QueryString["timkiemds"] != null)
        {
            string ngay = Request.QueryString["timkiemds"].ToString();
            string[] chuoi = ngay.Split('-');
            string[] str = chuoi[0].Split('/');
            string[] str1 = chuoi[1].Split('/');
            string date = str[2] + "-" + str[1] + "-" + str[0];
            string date1 = str1[2] + "-" + str1[1] + "-" + str1[0];
            string sql = "";
            sql = "select * from R_DoanhThu where NgayBan between '" + date + "' and '" + date1 + " 23:59:59' order by NgayBan desc";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhSo rpt = new XRDoanhSo();
                rpt.lblngayds.Text = "Tổng doanh số từ " + str[0] + "/" + str[1] + "/" + str[2] + " đến " + str1[0] + "/" + str1[1] + "/" + str1[2];
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else
            if (Request.QueryString["bc"] == "tonkho")
        {
            string sql = "select * from R_TonKho";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_TonKho");

            XRTonKho rpt = new XRTonKho();
            rpt.DataSource = ds;
            this.Vbaocao.Report = rpt;
        }
        else
            if (Request.QueryString["timkiemtk"]!=null)
        {
            string tukhoa = Request.QueryString["timkiemtk"].ToString();
            int masp;
            string sql="";
            if(Int32.TryParse(tukhoa, out masp)==true)
               sql = "select * from R_TonKho where MaSP like N'%"+masp+ "%'";
            else
               sql = "select * from R_TonKho where TenSP like N'%" + tukhoa + "%'";
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_TonKho");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRTonKho rpt = new XRTonKho();
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else
            if (Request.QueryString["tim_sp"] != null)
        {
            int masp = int.Parse(Request.QueryString["tim_sp"].ToString());
            string sql = "select * from R_DoanhThu where MaSP =" +masp;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhThu rpt = new XRDoanhThu();
                rpt.lblngaydt.Text = "Tổng doanh thu của sản phẩm có mã "+masp;
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else
            if (Request.QueryString["ma_sp"] != null)
        {
            int masp = int.Parse(Request.QueryString["ma_sp"].ToString());
            string sql = "select * from R_DoanhThu where MaSP =" + masp;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhSo rpt = new XRDoanhSo();
                rpt.lblngayds.Text = "Tổng doanh số của sản phẩm có mã " + masp;
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else
            if (Request.QueryString["kh"] != null)
        {
            int makh = int.Parse(Request.QueryString["kh"].ToString());
            string sql = "select * from R_DoanhThu where MaKH =" + makh;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhThu rpt = new XRDoanhThu();
                rpt.lblngaydt.Text = "Tổng doanh thu của khách hàng có mã "+makh;
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
        else
            if (Request.QueryString["ma_kh"] != null)
        {
            int makh = int.Parse(Request.QueryString["ma_kh"].ToString());
            string sql = "select * from R_DoanhThu where MaKH =" + makh;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_DoanhThu");
            if (ds.Tables[0].Rows.Count > 0)
            {
                XRDoanhSo rpt = new XRDoanhSo();
                rpt.lblngayds.Text = "Tổng sản phẩm đã mua của khách hàng có mã " + makh;
                rpt.DataSource = ds;
                this.Vbaocao.Report = rpt;
            }
        }
    }
}
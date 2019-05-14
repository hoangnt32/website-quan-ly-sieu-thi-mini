using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inhoadon : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["xuathd"] != null)
        {
            int mahd = int.Parse(Request.QueryString["xuathd"].ToString());
            string sql = "select * from R_HoaDon where MaHD= " + mahd;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_HoaDon");

            XtraReport_HoaDon rpt = new XtraReport_HoaDon();
            rpt.DataSource = ds;

            sql = "select MaHD,Sum(ThanhTien) from R_HoaDon where MaHD=" + mahd + " group by MaHD";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                rpt.txtdocso.Text = NumberToTextVN(Decimal.Parse(dt.Rows[0][1].ToString()));
                this.ReportHoaDon.Report = rpt;
            }
        }
        else
            if (Request.QueryString["xuatpn"] != null)
        {
            int mapn = int.Parse(Request.QueryString["xuatpn"].ToString());
            string sql = "select * from R_PhieuNhap where MaPhieu= " + mapn;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_PhieuNhap");

            XRPhieuNhap rpt = new XRPhieuNhap();
            rpt.DataSource = ds;

            sql = "select MaPhieu,Sum(ThanhTien) from R_PhieuNhap where MaPhieu=" + mapn + " group by MaPhieu";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                rpt.lbl_docso.Text = NumberToTextVN(Decimal.Parse(dt.Rows[0][1].ToString()));
                this.ReportHoaDon.Report = rpt;
            }
        }
        else
            if (Request.QueryString["xuatpx"] != null)
        {
            int mapn = int.Parse(Request.QueryString["xuatpx"].ToString());
            string sql = "select * from R_PhieuXuat where MaPhieu= " + mapn;
            SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
            DataSet ds = new DataSet();
            da.Fill(ds, "R_PhieuXuat");

            XRPhieuXuat rpt = new XRPhieuXuat();
            rpt.DataSource = ds;

            sql = "select MaPhieu,Sum(ThanhTien) from R_PhieuXuat where MaPhieu=" + mapn + " group by MaPhieu";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                rpt.lbl_docso.Text = NumberToTextVN(Decimal.Parse(dt.Rows[0][1].ToString()));
                this.ReportHoaDon.Report = rpt;
            }
        }
    }
    public String NumberToTextVN(decimal total)
    {
        try
        {
            string rs = "";
            total = Math.Round(total, 0);
            string[] ch = { "không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín" };
            string[] rch = { "lẻ", "mốt", "", "", "", "lăm" };
            string[] u = { "", "mươi", "trăm", "ngàn", "", "", "triệu", "", "", "tỷ", "", "", "ngàn", "", "", "triệu" };
            string nstr = total.ToString();

            int[] n = new int[nstr.Length];
            int len = n.Length;
            for (int i = 0; i < len; i++)
            {
                n[len - 1 - i] = Convert.ToInt32(nstr.Substring(i, 1));
            }

            for (int i = len - 1; i >= 0; i--)
            {
                if (i % 3 == 2)// số 0 ở hàng trăm
                {
                    if (n[i] == 0 && n[i - 1] == 0 && n[i - 2] == 0) continue;//nếu cả 3 số là 0 thì bỏ qua không đọc
                }
                else if (i % 3 == 1) // số ở hàng chục
                {
                    if (n[i] == 0)
                    {
                        if (n[i - 1] == 0) { continue; }// nếu hàng chục và hàng đơn vị đều là 0 thì bỏ qua.
                        else
                        {
                            rs += " " + rch[n[i]]; continue;// hàng chục là 0 thì bỏ qua, đọc số hàng đơn vị
                        }
                    }
                    if (n[i] == 1)//nếu số hàng chục là 1 thì đọc là mười
                    {
                        rs += " mười"; continue;
                    }
                }
                else if (i != len - 1)// số ở hàng đơn vị (không phải là số đầu tiên)
                {
                    if (n[i] == 0)// số hàng đơn vị là 0 thì chỉ đọc đơn vị
                    {
                        if (i + 2 <= len - 1 && n[i + 2] == 0 && n[i + 1] == 0) continue;
                        rs += " " + (i % 3 == 0 ? u[i] : u[i % 3]);
                        continue;
                    }
                    if (n[i] == 1)// nếu là 1 thì tùy vào số hàng chục mà đọc: 0,1: một / còn lại: mốt
                    {
                        rs += " " + ((n[i + 1] == 1 || n[i + 1] == 0) ? ch[n[i]] : rch[n[i]]);
                        rs += " " + (i % 3 == 0 ? u[i] : u[i % 3]);
                        continue;
                    }
                    if (n[i] == 5) // cách đọc số 5
                    {
                        if (n[i + 1] != 0) //nếu số hàng chục khác 0 thì đọc số 5 là lăm
                        {
                            rs += " " + rch[n[i]];// đọc số 
                            rs += " " + (i % 3 == 0 ? u[i] : u[i % 3]);// đọc đơn vị
                            continue;
                        }
                    }
                }

                rs += (rs == "" ? " " : " ") + ch[n[i]];// đọc số
                rs += " " + (i % 3 == 0 ? u[i] : u[i % 3]);// đọc đơn vị
            }
            if (rs[rs.Length - 1] != ' ')
                rs += " đồng";
            else
                rs += "đồng";

            if (rs.Length > 2)
            {
                string rs1 = rs.Substring(0, 2);
                rs1 = rs1.ToUpper();
                rs = rs.Substring(2);
                rs = rs1 + rs;
            }
            return rs.Trim().Replace("lẻ ", "lẻ ").Replace("mươi ", "mươi ").Replace("trăm ", "trăm ").Replace("mười ", "mười ");
        }
        catch
        {
            return "";
        }

    }
}
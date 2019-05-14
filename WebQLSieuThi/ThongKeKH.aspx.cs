using DevExpress.DocumentServices.ServiceModel.DataContracts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThongKeKH : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    
    protected void Page_Load(object sender, EventArgs e)
    {
   //     if (!IsPostBack)
        {
            if (Request.QueryString["timkiem"] != null)
            {
                string ngay = Request.QueryString["timkiem"].ToString();
                string[] chuoi = ngay.Split('-');
                string[] str = chuoi[0].Split('/');
                string[] str1 = chuoi[1].Split('/');
                string date = str[2] + "-" + str[1] + "-" + str[0];
                string date1 = str1[2] + "-" + str1[1] + "-" + str1[0];
                string sql = "select * from ThongKeKH where Thang between '" + date + "' and '" + date1 + " 23:59:59' order by Thang desc";
                SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
                DataSet ds = new DataSet();
                da.Fill(ds, "ThongKeKH");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    XtraReport_TKKH rpt = new XtraReport_TKKH();
                    rpt.lblkh.Text = "Tổng lượng khách mua hàng từ " + str[0] + "/" + str[1] + "/" + str[2] + " đến " + str1[0] + "/" + str1[1] + "/" + str1[2];
                    rpt.DataSource = ds;
                    this.ViewTKKH.Report = rpt;
                }
            }
            else if (Request.QueryString["tim_kh"] != null)
            {
                int makh = int.Parse(Request.QueryString["tim_kh"].ToString());
                string sql = "select * from ThongKeKH where MaKH=" + makh;
                SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
                DataSet ds = new DataSet();
                da.Fill(ds, "ThongKeKH");
                XtraReport_TKKH rpt = new XtraReport_TKKH();
                if (ds.Tables[0].Rows.Count > 0)
                {

                    rpt.lblkh.Text = "Khách hàng mã " + makh;
                    //      rpt.txtsokh.DataBindings.Add("Text", "ThongKeKH", "sum(MaKH)");
                    rpt.DataSource = ds;
                    this.ViewTKKH.Report = rpt;
                }
               
            }
            else
            {
                string sql = "select * from ThongKeKH";
                SqlDataAdapter da = new SqlDataAdapter(sql, kn.chuoiketnoi);
                DataSet ds = new DataSet();
                da.Fill(ds, "ThongKeKH");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    XtraReport_TKKH rpt = new XtraReport_TKKH();
                    rpt.lblkh.Text = "Tổng lượng khách mua hàng ";
                    rpt.DataSource = ds;
                    this.ViewTKKH.Report = rpt;
                }
            }
        }
    }

    
}
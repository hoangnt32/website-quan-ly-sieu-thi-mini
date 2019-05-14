using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_chitietsanpham : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int soluongton;
        string ktrsoluong = "Select SoLuongNhap-SoLuongBan as SLT from R_TonKho where TenSP= (select TenSP from SanPham where MaSP=" + Convert.ToInt32(Request.QueryString["maSo"].ToString()) + ")";
        DataTable ktsl = kn.GetData(ktrsoluong);
        if (ktsl.Rows.Count > 0)
        {
            Label slton = e.Item.FindControl("lblslc") as Label;
            HyperLink hlmuahang = e.Item.FindControl("hlmuahang") as HyperLink;
            HyperLink hldathang = e.Item.FindControl("hldathang") as HyperLink;
            if (ktsl.Rows[0][0].ToString() != "")
            {
                soluongton = int.Parse(ktsl.Rows[0][0].ToString());
                if (soluongton > 0)
                    slton.Text = "Số lượng còn: " + soluongton;
                else
                {
                    slton.Text = "Hết hàng tạm thời";
                    hlmuahang.Visible = false;
                    hldathang.Visible = false;
                }
            }
            else
            {
                slton.Text = "Hết hàng tạm thời";
                hlmuahang.Visible = false;
            }

        }
    }
}
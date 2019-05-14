using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_danhmuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TenLoaiSP();
        }
    }

    CSDL kn = new CSDL();
    private void TenLoaiSP()
    {
        int maloai = int.Parse(Request.QueryString["maloai"].ToString());
        DataTable dt = kn.GetData("select TenLoai from LoaiSP where MaLoai="+maloai);
        if (dt.Rows.Count > 0)
        {
            lbldanhmuc.Text = dt.Rows[0][0].ToString();
        }
    }
}
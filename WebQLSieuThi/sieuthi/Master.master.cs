using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DanhMuc();
        }
    }
    CSDL kn = new CSDL();
    private void DanhMuc()
    {
        DataTable dt = kn.GetData("select MaLoai,TenLoai from LoaiSP");
        if (dt.Rows.Count > 0)
        {
            DLDanhMuc.DataSource = dt;
            DLDanhMuc.DataBind();
        }
    }
}

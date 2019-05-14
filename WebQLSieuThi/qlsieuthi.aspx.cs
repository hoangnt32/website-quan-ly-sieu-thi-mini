using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qlsieuthi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CSDL kn = new CSDL();
            lbldm.Text = kn.GetValue("select count(*) from LoaiSP");
            lblsp.Text = kn.GetValue("select count(*) from SanPham");
            lblncc.Text = kn.GetValue("select count(*) from NhaCungCap");
            lblpn.Text = kn.GetValue("select count(*) from PhieuNhap");
            lblddh.Text = kn.GetValue("select count(*) from DonDatHang");
            string kq = kn.GetValue("select sum(ThanhTien) from R_DoanhThu");
            string dt = kq==""?"0":kq;
            lbldt.Text = String.Format("{0:#,##0}",double.Parse(dt));
            kq = kn.GetValue("select sum(SoLuong) from R_DoanhThu");
            string ds = kq == "" ? "0" : kq;
            lblds.Text = String.Format("{0:#,##0}", double.Parse(ds));
            lblluongkhachmh.Text = kn.GetValue("select count(distinct MaKH) from (select distinct MaKH from HoaDon union select distinct MaKH from DonDatHang) SLKH");
            lblnv.Text = kn.GetValue("select count(*) from NhanVien");
            lblkh.Text = kn.GetValue("select count(*) from KhachHang");
            lbltk.Text = kn.GetValue("select count(*) from TaiKhoan");
            lbllh.Text = kn.GetValue("select count(*) from LienHe");
        }
    }
}
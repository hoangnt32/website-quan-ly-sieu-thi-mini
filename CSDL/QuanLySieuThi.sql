USE [master]
GO
/****** Object:  Database [QuanLySieuThi]    Script Date: 13/05/2019 19:37:21 ******/
CREATE DATABASE [QuanLySieuThi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLySieuThi', FILENAME = N'E:\BaoCaoTotNghiep\CSDL\QuanLySieuThi.mdf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'QLST', FILENAME = N'E:\BaoCaoTotNghiep\CSDL\QuanLySieuThi_log.ldf' , SIZE = 5120KB , MAXSIZE = 25600KB , FILEGROWTH = 5120KB )
GO
ALTER DATABASE [QuanLySieuThi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLySieuThi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLySieuThi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLySieuThi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLySieuThi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLySieuThi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLySieuThi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLySieuThi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLySieuThi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLySieuThi] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLySieuThi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLySieuThi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLySieuThi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLySieuThi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLySieuThi]
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatKH]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatKH](
@MaKH INT,
@TenKH NVARCHAR(50),
@Email Varchar(100)
)
AS

BEGIN
	UPDATE KhachHang SET TenKH=@TenKH, Email=@Email WHERE MaKH=@MaKH
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatLoaiSP]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatLoaiSP](
@MaLoai INT,
@TenLoai NVARCHAR(50)
)
AS

BEGIN
	UPDATE LoaiSP SET TenLoai=@TenLoai WHERE MaLoai=@MaLoai
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatNCC]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatNCC](
@MaNCC INT,
@TenNCC NVARCHAR(100),
@DiaChi NVARCHAR(200),
@SDT VARCHAR(10)
)
AS

BEGIN
	UPDATE NhaCungCap SET TenNCC=@TenNCC,DiaChi=@DiaChi,SDT=@SDT WHERE MaNCC=@MaNCC
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatND]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatND](
@TenND VARCHAR(50),
@MatKhau VARCHAR(50)
)
AS

BEGIN
	UPDATE TaiKhoan SET MatKhau=@MatKhau WHERE TenND=@TenND
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatNguoiDung]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatNguoiDung](
@MaNV INT,
@TenNV NVARCHAR(50),
@NgaySinh DATE,
@GioiTinh NVARCHAR(3),
@DiaChi NVARCHAR(200),
@SDT VARCHAR(10),
@Email VARCHAR(50)
)
AS
BEGIN
	UPDATE NhanVien 
	SET TenNV=@TenNV, NgaySinh=@NgaySinh, GioiTinh=@GioiTinh, DiaChi=@DiaChi, SDT=@SDT,Email=@Email
	WHERE MaNV=@MaNV
	
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatNV]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatNV](
@MaNV INT,
@TenNV NVARCHAR(50),
@NgaySinh DATE,
@GioiTinh NVARCHAR(3),
@DiaChi NVARCHAR(200),
@SDT VARCHAR(10),
@Email VARCHAR(100),
@ChucVu NVARCHAR(20),
@Luong FLOAT
)
AS
BEGIN TRAN
	UPDATE NhanVien 
	SET TenNV=@TenNV, NgaySinh=@NgaySinh, GioiTinh=@GioiTinh, DiaChi=@DiaChi, SDT=@SDT, 
		ChucVu=@ChucVu, Luong=@Luong, Email=@Email
	WHERE MaNV=@MaNV
	UPDATE TaiKhoan SET LoaiND = @ChucVu WHERE TenND=@MaNV	
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[Proc_CapNhatSP]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_CapNhatSP](
@MaSP INT,
@TenSP NVARCHAR(50),
@MaLoai INT,
@MaNCC INT,
@DVT NVARCHAR(10),
@HinhAnh VARCHAR(100),
@ChiTiet NVARCHAR(Max),
@GiaBan FLOAT,
@KhuyenMai INT
)
AS
BEGIN
	UPDATE SanPham 
	SET TenSP= @TenSP,MaLoai= @MaLoai,MaNCC= @MaNCC,DVT= @DVT,
		HinhAnh= @HinhAnh,ChiTiet=@ChiTiet,GiaBan= @GiaBan,KhuyenMai= @KhuyenMai
	WHERE MaSP=@MaSP
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemCTHD]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemCTHD](@mahd int, @masp int, @soluong int, @dongia float,@ghichu nvarchar(1000))
AS
BEGIN
	INSERT INTO CTHoaDon VALUES(@mahd,@masp,@soluong,@dongia,0,@ghichu)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemHD]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemHD](@manv int, @makh int, @ngayban datetime)
AS
BEGIN
	INSERT INTO HoaDon VALUES(@manv,@makh,@ngayban,0)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemKH]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemKH](
@TenKH NVARCHAR(50),
@SDT VARCHAR(10),
@Email VARCHAR(100)
)
AS

BEGIN
	INSERT INTO KhachHang VALUES(@TenKH,@SDT,@Email)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemLoaiSP]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemLoaiSP](
@TenLoai NVARCHAR(50)
)
AS

BEGIN
	INSERT INTO LoaiSP VALUES(@TenLoai)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemNCC]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemNCC](
@TenNCC NVARCHAR(50),
@DiaChi NVARCHAR(200),
@SDT VARCHAR(10)
)
AS

BEGIN
	INSERT INTO NhaCungCap VALUES(@TenNCC,@DiaChi,@SDT)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemNV]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemNV](
@TenNV NVARCHAR(50),
@NgaySinh DATE,
@GioiTinh NVARCHAR(3),
@DiaChi NVARCHAR(200),
@SDT VARCHAR(10),
@ChucVu NVARCHAR(20),
@Luong FLOAT,
@Email VARCHAR(100)
)
AS
BEGIN
	INSERT INTO NhanVien VALUES(@TenNV,@NgaySinh,@GioiTinh,@DiaChi,@SDT,@Email,@ChucVu,@Luong)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_ThemSP]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_ThemSP](
@TenSP NVARCHAR(50),
@MaLoai INT,
@MaNCC INT,
@DVT NVARCHAR(10),
@HinhAnh VARCHAR(100),
@ChiTiet NVARCHAR(Max),
@GiaBan FLOAT,
@KhuyenMai INT
)
AS
BEGIN
	INSERT INTO SanPham VALUES(@TenSP,@MaLoai,@MaNCC,@DVT,@HinhAnh,@ChiTiet,@GiaBan,@KhuyenMai)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_TimKemNhanVien]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_TimKemNhanVien](@manv int)
AS
BEGIN
	SELECT * FROM NhanVien WHERE MaNV=@manv
END

GO
/****** Object:  Table [dbo].[CTDonDatHang]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonDatHang](
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[ThanhTien] [float] NULL,
	[GhiChu] [nvarchar](1000) NULL,
 CONSTRAINT [PK__CTHoaDon__F557F6616B8E9D32] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaPhieu] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaNhap] [float] NOT NULL,
	[ThanhTien] [float] NULL,
	[GhiChu] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDH] [int] IDENTITY(1001,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [datetime] NULL,
	[TriGia] [float] NULL,
	[NgayGH] [date] NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[DiaChiNhan] [nvarchar](1000) NULL,
	[SDT] [varchar](10) NULL,
	[HTThanhToan] [nvarchar](50) NULL,
	[HTGiaoHang] [nvarchar](50) NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK__DonDatHa__27258661A927F92D] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1001,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[NgayBan] [datetime] NULL,
	[TriGia] [float] NULL,
 CONSTRAINT [PK__HoaDon__2725A6E0C77B2011] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1001,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[SDT] [varchar](10) NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGui] [date] NOT NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1001,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1001,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(2000,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[Email] [varchar](100) NULL,
	[ChucVu] [nvarchar](20) NOT NULL,
	[Luong] [float] NOT NULL,
 CONSTRAINT [PK__NhanVien__2725D70A117F9F82] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieu] [int] IDENTITY(1001,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[NgayNhap] [datetime] NULL,
	[TriGia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1001,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[DVT] [nvarchar](10) NULL,
	[HinhAnh] [nvarchar](100) NOT NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[GiaBan] [float] NOT NULL,
	[KhuyenMai] [float] NULL,
 CONSTRAINT [PK__SanPham__2725081C0D767E48] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaND] [int] NULL,
	[TenND] [varchar](50) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[LoaiND] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TaiKhoan__4CF9B49B6C4522B6] PRIMARY KEY CLUSTERED 
(
	[TenND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[R_DoanhThu]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[R_DoanhThu]
as
select NgayBan,hd.MaKH,sp.MaSP, TenSP,DonGia, ct.SoLuong,ThanhTien, GhiChu
from SanPham sp, CTHoaDon ct, HoaDon hd
where sp.MaSP=ct.MaSP and hd.MaHD=ct.MaHD
union
select NgayGH,ddh.MaKH,sp.MaSP,TenSP,DonGia, ctddh.SoLuong,ThanhTien, GhiChu
from DonDatHang ddh, CTDonDatHang ctddh, SanPham sp
where sp.MaSP=ctddh.MaSP and ddh.MaDH=ctddh.MaDH and TinhTrang=1
GO
/****** Object:  View [dbo].[R_HoaDon]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[R_HoaDon]
as
select hd.MaHD,hd.MaKH,TenKH,SDT,NgayBan,TenSP,DVT,DonGia,cthd.GhiChu,cthd.SoLuong,KhuyenMai,ThanhTien 
from SanPham sp, CTHoaDon cthd, KhachHang kh, HoaDon hd
where sp.MaSP=cthd.MaSP and cthd.MaHD=hd.MaHD and hd.MaKH=kh.MaKH
GO
/****** Object:  View [dbo].[R_PhieuNhap]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[R_PhieuNhap]
as
select MaNV,NgayNhap,TriGia,CT.MaPhieu,TenSP,CT.SoLuong,GiaNhap,ThanhTien,GhiChu
from CTPhieuNhap CT, SanPham SP, PhieuNhap PN
where CT.MaSP=SP.MaSP and CT.MaPhieu=PN.MaPhieu
GO
/****** Object:  View [dbo].[R_PhieuXuat]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[R_PhieuXuat]
as
select MaNV,NgayXuatHang,TriGia,CT.MaPhieu,TenSP,CT.SoLuong,ThanhTien,GhiChu
from CTPhieuXuat CT, SanPham SP, PhieuXuat PX
where CT.MaSP=SP.MaSP and CT.MaPhieu=PX.MaPhieu
GO
/****** Object:  View [dbo].[R_TonKho]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[R_TonKho]
as
select SLB.MaSP,SLB.TenSP, SoLuongNhap, SoLuongBan
from 
(select MaSP,TenSP,sum(SoLuongBan) SoLuongBan from
	(select sp.MaSP,TenSP, case 
		when sum(cthd.SoLuong)>0 THEN sum(cthd.SoLuong) else 0 end  as SoLuongBan
	from SanPham sp left join CTHoaDon cthd on sp.MaSP=cthd.MaSP left join  HoaDon hd
		on hd.MaHD=cthd.MaHD 
	group by sp.MaSP,TenSP 
union
	select sp.MaSP,TenSP, case 
		when sum(ctdh.SoLuong)>0 THEN sum(ctdh.SoLuong) else 0 end  as SoLuongBan
	from SanPham sp left join CTDonDatHang ctdh on ctdh.MaSP= sp.MaSP left join DonDatHang ddh 
		on ddh.MaDH=ctdh.MaDH where TinhTrang <> -1
	group by sp.MaSP,TenSP) SL 
	group by MaSP,TenSP) SLB left join
(select sp.MaSP,TenSP, sum(ctpn.SoLuong) SoLuongNhap
from SanPham sp, CTPhieuNhap ctpn, PhieuNhap pn
where sp.MaSP=ctpn.MaSP and pn.MaPhieu=ctpn.MaPhieu
group by sp.MaSP,TenSP) SLN on SLB.TenSP=SLN.TenSP

GO
/****** Object:  View [dbo].[ThongKeKH]    Script Date: 13/05/2019 19:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ThongKeKH]
as
select NgayBan as Thang,hd.MaKH,TenKH,SDT
from KhachHang kh, HoaDon hd
where hd.MaKH=kh.MaKH
GO
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1014, 1136, 1, 24000, 24000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1015, 1135, 2, 24000, 48000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1016, 1060, 1, 84000, 84000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1017, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1018, 1025, 1, 40000, 40000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1018, 1136, 1, 24000, 24000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1023, 1020, 1, 18000, 16200, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1023, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1025, 1014, 1, 40000, 36000, NULL)
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1027, 1014, 1, 40000, 36000, N'Giảm 10%')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1028, 1027, 1, 48000, 48000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1029, 1129, 1, 50000, 50000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1030, 1025, 1, 40000, 40000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1031, 1136, 1, 24000, 24000, N'')
INSERT [dbo].[CTDonDatHang] ([MaDH], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1032, 1020, 1, 18000, 16200, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1043, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1043, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1043, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1044, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1044, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1045, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1046, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1046, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1046, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1046, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1047, 1038, 1, 70000, 70000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1048, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1048, 1033, 1, 14000, 14000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1049, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1049, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1049, 1032, 1, 16000, 16000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1050, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1050, 1101, 1, 43000, 43000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1050, 1111, 1, 93000, 93000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1051, 1120, 1, 7000, 7000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1052, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1052, 1066, 1, 66000, 66000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1053, 1067, 1, 784000, 784000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1054, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1054, 1036, 1, 20000, 20000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1054, 1100, 1, 179000, 179000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1055, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1055, 1050, 1, 92000, 92000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1056, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1056, 1112, 1, 68000, 68000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1057, 1031, 1, 29000, 29000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1057, 1098, 1, 55000, 55000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1057, 1120, 1, 7000, 7000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1058, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1058, 1066, 1, 66000, 66000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1059, 1033, 1, 14000, 14000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1060, 1116, 1, 29000, 29000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1061, 1077, 1, 31000, 31000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1062, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1062, 1090, 1, 252000, 252000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1062, 1113, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1063, 1101, 1, 43000, 43000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1063, 1120, 1, 7000, 7000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1064, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1065, 1066, 1, 66000, 66000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1066, 1060, 1, 84000, 84000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1066, 1067, 1, 784000, 784000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1067, 1039, 1, 42000, 42000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1067, 1067, 1, 784000, 784000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1069, 1034, 1, 19000, 19000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1069, 1111, 1, 93000, 93000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1069, 1117, 1, 29000, 29000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1070, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1070, 1045, 1, 36000, 36000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1071, 1014, 1, 40000, 40000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1072, 1070, 1, 105000, 105000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1073, 1032, 1, 16000, 16000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1073, 1070, 1, 105000, 105000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1073, 1086, 1, 206000, 206000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1074, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1074, 1068, 1, 52000, 52000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1075, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1075, 1036, 1, 20000, 20000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1075, 1109, 1, 85000, 85000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1075, 1111, 1, 93000, 93000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1075, 1125, 1, 9000, 9000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1076, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1076, 1043, 1, 300000, 300000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1076, 1044, 1, 225000, 225000, NULL)
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1077, 1039, 1, 42000, 42000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1078, 1111, 1, 93000, 93000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1078, 1117, 1, 29000, 29000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1079, 1027, 1, 48000, 48000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1079, 1080, 1, 28000, 28000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1080, 1076, 1, 43000, 43000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1080, 1083, 1, 73000, 73000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1080, 1084, 1, 97000, 97000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1080, 1088, 1, 183000, 183000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1081, 1086, 1, 206000, 206000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1081, 1089, 1, 137000, 137000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1082, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1083, 1068, 1, 52000, 52000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1084, 1036, 1, 20000, 20000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1084, 1115, 1, 17000, 17000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1084, 1125, 1, 9000, 9000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1085, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1085, 1118, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1086, 1045, 1, 36000, 36000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1086, 1118, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1087, 1070, 1, 105000, 105000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1087, 1119, 1, 23000, 23000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1088, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1088, 1114, 1, 13000, 13000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1088, 1119, 1, 23000, 23000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1089, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1089, 1069, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1089, 1125, 1, 9000, 9000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1090, 1028, 1, 22000, 22000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1090, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1090, 1110, 1, 135000, 135000, N'')
GO
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1091, 1032, 4, 16000, 64000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1103, 1014, 1, 40000, 36000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1104, 1014, 1, 40000, 36000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1104, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1105, 1014, 2, 40000, 72000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1106, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1107, 1023, 2, 77000, 154000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1108, 1034, 1, 19000, 19000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1109, 1040, 1, 26000, 26000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1110, 1035, 2, 19000, 38000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1110, 1054, 1, 65000, 65000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1111, 1020, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1111, 1032, 1, 16000, 16000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1112, 1014, 1, 40000, 36000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1112, 1044, 1, 225000, 225000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1113, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1113, 1043, 1, 300000, 300000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1114, 1039, 1, 42000, 42000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1114, 1111, 1, 93000, 93000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1114, 1117, 1, 29000, 29000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1115, 1027, 1, 48000, 48000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1116, 1080, 1, 28000, 28000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1117, 1076, 1, 43000, 43000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1117, 1083, 1, 73000, 73000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1118, 1084, 1, 97000, 97000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1119, 1086, 1, 206000, 206000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1119, 1088, 1, 183000, 183000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1120, 1089, 1, 137000, 137000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1121, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1122, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1122, 1043, 1, 300000, 300000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1122, 1044, 1, 225000, 225000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1123, 1036, 1, 20000, 20000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1123, 1068, 1, 52000, 52000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1123, 1125, 1, 9000, 9000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1124, 1115, 1, 17000, 17000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1125, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1125, 1118, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1126, 1045, 1, 36000, 36000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1127, 1118, 1, 18000, 18000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1128, 1070, 1, 105000, 105000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1128, 1119, 1, 23000, 23000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1129, 1119, 1, 23000, 23000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1130, 1114, 1, 13000, 13000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1131, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1132, 1069, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1133, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1134, 1125, 1, 9000, 9000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1135, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1136, 1028, 1, 22000, 22000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1136, 1110, 1, 135000, 135000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1137, 1014, 1, 40000, 36000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1137, 1020, 1, 18000, 16200, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1138, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1138, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1139, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1140, 1020, 1, 18000, 16200, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1141, 1022, 1, 12000, 12000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1141, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1141, 1024, 1, 160000, 160000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1142, 1037, 1, 24000, 24000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1142, 1038, 1, 70000, 70000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1143, 1020, 1, 18000, 16200, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1143, 1033, 1, 14000, 14000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1144, 1020, 1, 18000, 16200, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1144, 1032, 1, 16000, 16000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1150, 1039, 2, 42000, 84000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1152, 1034, 2, 19000, 38000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1158, 1014, 2, 40000, 72000, N'Giảm 10%')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1159, 1052, 2, 105000, 210000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1159, 1065, 2, 50000, 100000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1160, 1023, 1, 77000, 77000, N'')
INSERT [dbo].[CTHoaDon] ([MaHD], [MaSP], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (1161, 1026, 2, 30000, 60000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1014, 40, 30000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1020, 20, 10000, 200000, NULL)
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1022, 40, 7000, 280000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1023, 20, 70000, 1400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1024, 20, 140000, 2800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1025, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1026, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1027, 20, 40000, 800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1028, 20, 12000, 240000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1029, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1030, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1031, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1032, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1033, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1034, 20, 15000, 300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1035, 20, 15000, 300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1036, 20, 15000, 300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1037, 20, 18000, 360000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1038, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1039, 20, 32000, 640000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1040, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1041, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1042, 20, 165000, 3300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1043, 20, 280000, 5600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1044, 20, 200000, 4000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1045, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1046, 20, 70000, 1400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1047, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1049, 20, 80000, 1600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1050, 20, 82000, 1640000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1051, 20, 88000, 1760000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1052, 20, 95000, 1900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1053, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1054, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1055, 20, 63000, 1260000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1056, 20, 110000, 2200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1057, 20, 110000, 2200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1058, 20, 45000, 900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1059, 20, 9000, 180000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1060, 20, 74000, 1480000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1061, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1062, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1063, 20, 7000, 140000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1064, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1065, 20, 40000, 800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1066, 20, 55000, 1100000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1067, 20, 750000, 15000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1068, 20, 45000, 900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1069, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1070, 20, 95000, 1900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1071, 20, 130000, 2600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1072, 20, 50000, 1000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1073, 20, 180000, 3600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1074, 20, 110000, 2200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1075, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1076, 20, 35000, 700000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1077, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1078, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1079, 20, 45000, 900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1080, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1082, 20, 18000, 360000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1083, 20, 65000, 1300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1084, 20, 90000, 1800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1085, 20, 180000, 3600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1086, 20, 196000, 3920000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1087, 20, 194000, 3880000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1088, 20, 175000, 3500000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1089, 20, 130000, 2600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1090, 20, 242000, 4840000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1091, 20, 280000, 5600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1092, 20, 90000, 1800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1093, 20, 95000, 1900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1095, 20, 50000, 1000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1096, 20, 62000, 1240000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1097, 20, 55000, 1100000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1098, 20, 45000, 900000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1099, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1100, 20, 170000, 3400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1101, 20, 35000, 700000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1102, 20, 15000, 300000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1103, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1104, 20, 80000, 1600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1105, 20, 130000, 2600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1106, 20, 200000, 4000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1107, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1108, 20, 75000, 1500000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1109, 20, 75000, 1500000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1110, 20, 120000, 2400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1111, 20, 85000, 1700000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1112, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1113, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1114, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1115, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1116, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1117, 20, 20000, 400000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1118, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1119, 20, 18000, 360000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1120, 20, 4000, 80000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1121, 20, 50000, 1000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1122, 20, 18000, 360000, N'')
GO
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1123, 20, 60000, 1200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1124, 20, 4000, 80000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1125, 20, 5000, 100000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1126, 20, 5000, 100000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1127, 20, 7000, 140000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1128, 20, 200000, 4000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1129, 20, 40000, 800000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1130, 20, 50000, 1000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1131, 20, 7000, 140000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1132, 20, 50000, 1000000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1133, 20, 30000, 600000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1134, 20, 10000, 200000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1135, 20, 18000, 360000, N'')
INSERT [dbo].[CTPhieuNhap] ([MaPhieu], [MaSP], [SoLuong], [GiaNhap], [ThanhTien], [GhiChu]) VALUES (1019, 1136, 20, 18000, 360000, N'')
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1014, 1005, CAST(0x0000AA2800DEAFF0 AS DateTime), 24000, CAST(0x863F0B00 AS Date), N'Nguyễn Thanh Hồng', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1015, 1005, CAST(0x0000AA4400CED21E AS DateTime), 48000, CAST(0xA23F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1016, 1005, CAST(0x0000AA4401519997 AS DateTime), 84000, CAST(0xA23F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1017, 1005, CAST(0x0000AA49010496E1 AS DateTime), 12000, CAST(0xA73F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1018, 1005, CAST(0x0000AA490108B93C AS DateTime), 64000, CAST(0xA73F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1023, 1005, CAST(0x0000AA49010C18BB AS DateTime), 28200, CAST(0xA73F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1025, 1005, CAST(0x0000AA49011DAA89 AS DateTime), 36000, CAST(0xA73F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1027, 1005, CAST(0x0000AA49011F5588 AS DateTime), 36000, CAST(0xA73F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1028, 1005, CAST(0x0000AA4C00AB0F42 AS DateTime), 48000, CAST(0xAA3F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1029, 1005, CAST(0x0000AA4C00AE077D AS DateTime), 50000, CAST(0xAA3F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', -1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1030, 1005, CAST(0x0000AA4C00D0E3C6 AS DateTime), 40000, CAST(0xAA3F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1031, 1005, CAST(0x0000AA4C00E4AD75 AS DateTime), 24000, CAST(0xAA3F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [TriGia], [NgayGH], [TenNguoiNhan], [DiaChiNhan], [SDT], [HTThanhToan], [HTGiaoHang], [TinhTrang]) VALUES (1032, 1005, CAST(0x0000AA4C00F69316 AS DateTime), 16200, CAST(0xAA3F0B00 AS Date), N'Nguyễn Thanh Thúy', N'983 Bình Dương', N'0983404818', N'Thanh toán sau khi nhận hàng', N'Giao tận nơi', 1)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1043, 2031, 1005, CAST(0x0000A9E90098466C AS DateTime), 70000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1044, 2031, 1007, CAST(0x0000A9E9009CAB6C AS DateTime), 237000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1045, 2031, 1012, CAST(0x0000A9E900AD262C AS DateTime), 18000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1046, 2031, 1013, CAST(0x0000A9E900E5743C AS DateTime), 273000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1047, 2031, 1015, CAST(0x0000A9E900FB26EC AS DateTime), 70000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1048, 2031, 1016, CAST(0x0000A9EA00972D2C AS DateTime), 32000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1049, 2031, 1018, CAST(0x0000A9EA009CAB6C AS DateTime), 111000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1050, 2031, 1019, CAST(0x0000A9EA00A8C12C AS DateTime), 176000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1051, 2031, 1020, CAST(0x0000A9EA00FA0DAC AS DateTime), 7000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1052, 2031, 1021, CAST(0x0000A9EB0095CD9C AS DateTime), 106000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1053, 2031, 1022, CAST(0x0000A9EB0098466C AS DateTime), 784000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1054, 2031, 1005, CAST(0x0000A9EC0098466C AS DateTime), 239000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1055, 2031, 1007, CAST(0x0000A9EC009CAB6C AS DateTime), 110000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1056, 2031, 1012, CAST(0x0000A9EC00AD262C AS DateTime), 80000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1057, 2031, 1023, CAST(0x0000A9EC00DA316C AS DateTime), 91000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1058, 2031, 1024, CAST(0x0000A9EC00EF112C AS DateTime), 106000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1059, 2031, 1025, CAST(0x0000A9EC00FF8BEC AS DateTime), 14000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1060, 2031, 1013, CAST(0x0000A9ED00E5743C AS DateTime), 29000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1061, 2031, 1015, CAST(0x0000A9ED00FB26EC AS DateTime), 31000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1062, 2031, 1016, CAST(0x0000A9EE00972D2C AS DateTime), 332000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1063, 2031, 1018, CAST(0x0000A9EE009CAB6C AS DateTime), 50000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1064, 2031, 1019, CAST(0x0000A9EE00A8C12C AS DateTime), 40000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1065, 2031, 1020, CAST(0x0000A9EF00FA0DAC AS DateTime), 66000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1066, 2031, 1021, CAST(0x0000A9EF0095CD9C AS DateTime), 868000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1067, 2031, 1022, CAST(0x0000A9EF0098466C AS DateTime), 826000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1069, 2031, 1027, CAST(0x0000A9EF00FB26EC AS DateTime), 141000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1070, 2031, 1028, CAST(0x0000A9EF00FF8BEC AS DateTime), 76000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1071, 2031, 1029, CAST(0x0000A9F0009CAB6C AS DateTime), 40000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1072, 2031, 1030, CAST(0x0000A9F000A8C12C AS DateTime), 105000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1073, 2031, 1031, CAST(0x0000A9F000FA0DAC AS DateTime), 327000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1074, 2031, 1032, CAST(0x0000A9F10095CD9C AS DateTime), 64000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1075, 2031, 1033, CAST(0x0000A9F10098466C AS DateTime), 367000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1076, 2031, 1013, CAST(0x0000A9F200A3893C AS DateTime), 537000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1077, 2031, 1015, CAST(0x0000A9F200EAAC2C AS DateTime), 42000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1078, 2031, 1016, CAST(0x0000A9F200FA0DAC AS DateTime), 122000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1079, 2031, 1018, CAST(0x0000A9F3009CAB6C AS DateTime), 76000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1080, 2031, 1019, CAST(0x0000A9F300A8C12C AS DateTime), 396000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1081, 2031, 1020, CAST(0x0000A9F400972D2C AS DateTime), 343000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1082, 2031, 1021, CAST(0x0000A9F400A6485C AS DateTime), 12000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1083, 2031, 1022, CAST(0x0000A9F400EAAC2C AS DateTime), 52000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1084, 2031, 1027, CAST(0x0000A9F400FB26EC AS DateTime), 46000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1085, 2031, 1028, CAST(0x0000A9F5009CAB6C AS DateTime), 178000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1086, 2031, 1029, CAST(0x0000A9F500A6485C AS DateTime), 54000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1087, 2031, 1030, CAST(0x0000A9F500A8C12C AS DateTime), 128000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1088, 2031, 1031, CAST(0x0000A9F600972D2C AS DateTime), 48000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1089, 2031, 1032, CAST(0x0000A9F600A6485C AS DateTime), 57000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1090, 2031, 1033, CAST(0x0000A9F600EAAC2C AS DateTime), 181000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1091, 2013, 1021, CAST(0x0000AA2800DD161A AS DateTime), 64000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1103, 2013, 1007, CAST(0x0000AA4400D9EF7C AS DateTime), 36000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1104, 2013, 1007, CAST(0x0000AA4400DC82E5 AS DateTime), 54000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1105, 2013, 1007, CAST(0x0000AA4400E28AE5 AS DateTime), 72000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1106, 2013, 1007, CAST(0x0000AA4400E2EF8D AS DateTime), 12000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1107, 2013, 1007, CAST(0x0000AA4400E34C8C AS DateTime), 154000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1108, 2013, 1007, CAST(0x0000AA4400EA598E AS DateTime), 19000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1109, 2013, 1007, CAST(0x0000AA4400EAAFFF AS DateTime), 26000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1110, 2013, 1007, CAST(0x0000AA4400EC12B6 AS DateTime), 103000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1111, 2013, 1007, CAST(0x0000AA4400ECBFB5 AS DateTime), 34000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1112, 2031, 1034, CAST(0x0000A9F700A3893C AS DateTime), 36000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1113, 2031, 1035, CAST(0x0000A9F700EAAC2C AS DateTime), 936000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1114, 2031, 1036, CAST(0x0000A9F700FA0DAC AS DateTime), 492000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1115, 2031, 1037, CAST(0x0000A9F8009CAB6C AS DateTime), 144000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1116, 2031, 1038, CAST(0x0000A9F800A8C12C AS DateTime), 84000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1117, 2031, 1035, CAST(0x0000A9F900972D2C AS DateTime), 348000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1118, 2031, 1036, CAST(0x0000A9F900A6485C AS DateTime), 291000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1119, 2031, 1039, CAST(0x0000A9FA00EAAC2C AS DateTime), 1167000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1120, 2031, 1039, CAST(0x0000A9FA00FB26EC AS DateTime), 411000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1121, 2031, 1040, CAST(0x0000A9FB009CAB6C AS DateTime), 36000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1122, 2031, 1039, CAST(0x0000A9FC00A6485C AS DateTime), 537000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1123, 2031, 1041, CAST(0x0000A9FC00A8C12C AS DateTime), 243000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1124, 2031, 1042, CAST(0x0000A9FD00972D2C AS DateTime), 51000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1125, 2031, 1043, CAST(0x0000A9FD00A6485C AS DateTime), 534000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1126, 2031, 1044, CAST(0x0000A9FE00EAAC2C AS DateTime), 108000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1127, 2031, 1045, CAST(0x0000A9FF00A3893C AS DateTime), 54000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1128, 2031, 1045, CAST(0x0000A9FF00EAAC2C AS DateTime), 384000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1129, 2031, 1046, CAST(0x0000A9FF00FA0DAC AS DateTime), 69000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1130, 2031, 1046, CAST(0x0000AA00009CAB6C AS DateTime), 39000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1131, 2031, 1047, CAST(0x0000AA0000A8C12C AS DateTime), 36000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1132, 2031, 1048, CAST(0x0000AA0100972D2C AS DateTime), 72000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1133, 2031, 1047, CAST(0x0000AA0100A6485C AS DateTime), 72000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1134, 2031, 1049, CAST(0x0000AA0200EAAC2C AS DateTime), 27000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1135, 2031, 1049, CAST(0x0000AA0200FB26EC AS DateTime), 72000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1136, 2031, 1050, CAST(0x0000AA03009CAB6C AS DateTime), 471000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1137, 2031, 1049, CAST(0x0000AA0400A6485C AS DateTime), 52200)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1138, 2031, 1050, CAST(0x0000AA0400A8C12C AS DateTime), 89000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1139, 2031, 1051, CAST(0x0000AA0500972D2C AS DateTime), 160000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1140, 2031, 1053, CAST(0x0000AA0500A6485C AS DateTime), 16200)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1141, 2031, 1052, CAST(0x0000AA0600EAAC2C AS DateTime), 249000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1142, 2031, 1051, CAST(0x0000AA0700972D2C AS DateTime), 94000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1143, 2031, 1053, CAST(0x0000AA0700A6485C AS DateTime), 30200)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1144, 2031, 1052, CAST(0x0000AA0800EAAC2C AS DateTime), 32200)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1147, 2013, 1075, CAST(0x0000AA4B01436241 AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1150, 2013, 1007, CAST(0x0000AA4B01459015 AS DateTime), 120000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1151, 2013, 1077, CAST(0x0000AA4B0145E418 AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1152, 2013, 1078, CAST(0x0000AA4B0146795B AS DateTime), 38000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1153, 2013, 1007, CAST(0x0000AA4B0148277B AS DateTime), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1154, 2013, 1007, CAST(0x0000AA4B01489195 AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1155, 2013, 1007, CAST(0x0000AA4B014979CA AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1156, 2013, 1007, CAST(0x0000AA4B014AF16E AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1157, 2013, 1007, CAST(0x0000AA4B014B5A79 AS DateTime), NULL)
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1158, 2013, 1007, CAST(0x0000AA4B0157700E AS DateTime), 122000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1159, 2013, 1007, CAST(0x0000AA4C00AAAD06 AS DateTime), 310000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1160, 2013, 1005, CAST(0x0000AA4C00D314D6 AS DateTime), 77000)
INSERT [dbo].[HoaDon] ([MaHD], [MaNV], [MaKH], [NgayBan], [TriGia]) VALUES (1161, 2013, 1007, CAST(0x0000AA4C00F7152F AS DateTime), 60000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1005, N'Nguyễn Thanh Thúy', N'0983404818', N'hoangnt032@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1007, N'Nguyễn Thanh Thảo', N'0983404819', N'hoangnt036@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1012, N'Nguyễn Huy Tùng', N'0983404810', N'hoangnt033@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1013, N'Lê Minh Tân', N'0983404815', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1015, N'Trần Anh Huy', N'0983444767', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1016, N'Lê Thị Châu', N'0123656788', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1018, N'Lâm Thị Minh Thư', N'0983404811', N'hoangnt034@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1019, N'Trần Tấn Phát', N'0983404812', N'hoangnt035@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1020, N'Dương Thị Thùy Linh', N'0983404878', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1021, N'Trần Thị Mỹ Linh', N'0983404800', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1022, N'Lê Thái Hà', N'0983404808', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1023, N'Lê Bảo Ngọc', N'0123455345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1024, N'Huỳnh Thị Ngọc', N'0123455344', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1025, N'Võ Hiếu Nghĩa', N'0123455333', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1027, N'Lê Minh Sơn', N'0123455342', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1028, N'Trần Ngọc Hân', N'0123455341', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1029, N'Trần Thị Thanh', N'0838455345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1030, N'Đặng Thị Thùy Châu', N'0388455234', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1031, N'Nguyễn Thanh Hồng', N'0964455779', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1032, N'Nguyễn Hồng Ngọc', N'0944400340', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1033, N'Nguyễn Thanh Long', N'0123455346', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1034, N'Nguyễn Thanh Hậu', N'0123667808', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1035, N'Lê Thị Tuyết', N'0388770990', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1036, N'Lê Thanh Mai', N'0123333345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1037, N'Nguyễn Thị Hồng Ngọc', N'0123889347', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1038, N'Nguyễn Ngọc Ngân', N'0123343315', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1039, N'Nguyễn Lê Tuyết Ngân', N'0388459345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1040, N'Nguyễn Kiều Mỹ Duyên', N'0964450395', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1041, N'Lê Thúy Vy', N'0123400345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1042, N'Lê Diễm My', N'0123455300', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1043, N'Nguyễn Trần Ngọc Thảo', N'0388707808', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1044, N'Nguyễn Kim Duyên', N'0123455388', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1045, N'Nguyễn Hoàng Mỹ', N'0123455322', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1046, N'Trần Thị Yến', N'0123321123', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1047, N'Trần Thị Lan', N'0964889340', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1048, N'Nguyễn Lê Ngọc Châu', N'0122455345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1049, N'Lê Thị Diễm Hà', N'0983458345', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1050, N'Trần Thảo Vy', N'0944455330', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1051, N'Lâm Minh Hiếu', N'0925520321', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1052, N'Nguyễn Thanh Hùng', N'0925110288', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1053, N'Nguyễn Thanh Thủy', N'0926349339', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1073, N'Nguyễn Thanh Phong', N'0983404888', N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1074, N'Nguyễn Thanh Hùng', N'0983404889', N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1075, N'Nguyễn Thanh Lâm', N'0983404887', N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1076, N'Nguyễn Thảo', N'0123440235', N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1077, N'Nguyễn Thanh Thy', N'0983404886', N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SDT], [Email]) VALUES (1078, N'Nguyễn Thanh Huy', N'0983404885', N'')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaLH], [HoTen], [Email], [SDT], [NoiDung], [NgayGui], [TrangThai]) VALUES (4, N'Tâm', N'hoangnt32@gmail.com', N'', N'Cho hỏi loại sữa nào tốt nhất cho trẻ 2 tuổi ạ?', CAST(0x933F0B00 AS Date), 1)
INSERT [dbo].[LienHe] ([MaLH], [HoTen], [Email], [SDT], [NoiDung], [NgayGui], [TrangThai]) VALUES (5, N'Hoàng', N'nguyenhoang270997@gmail.com', N'0983404818', N'Cho mình hỏi....', CAST(0xA73F0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1003, N'Trái cây và Rau củ quả')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1004, N'Thịt và thủy hải sản')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1005, N'Bánh kẹo và đồ ăn vặt')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1006, N'Sữa và sản phẩm từ sữa')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1007, N'Đồ uống')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1008, N'Đồ dùng cho bé')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1009, N'Mỹ phẩm')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1010, N'Gia vị và nguyên liệu nấu ăn')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1011, N'Đồ dùng gia đình')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1003, N'Nhà phân phối cung cấp Đa Lộc', N'TP Hồ Chí Minh', N'0997876544')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1004, N'Nhà phân phối cung cấp Bình dân', N'Số 9 Cốm Vòng, Dịch Vọng Hậu, HN', N'0902246636')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1005, N'Nhà phân phối cung cấp Hiệp Phát', N'Số 14/192 Hạ Đình, Thanh Xuân, HN', N'0985474356')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1006, N'Nhà phân phối cung cấp nước giải khát Việt Đức', N'Phòng 202, Tòa nhà CT36, 326 Lê Trọng Tấn, Q.Thanh Xuân, HN', N'0473021122')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1007, N'Nhà phân phối cung cấp Thực phẩm Đức Việt', N'P101 toà nhà SeaProdex - Số 20 Láng Hạ', N'0979132804')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1008, N'Nhà phân phối cung cấp Sữa CGHL', N'84 Ngọc Khánh', N'0838325853')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1009, N'Thủy Hải Sản Tâm Đức', N'Số 38 - Phố Thắng Lợi - Phường Quỳnh Lôi - Hai Bà Trưng - Hà Nội', N'0363419533')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1010, N'Nhà phân phối cung cấp Tiến Hưng', N'360 Bùi Xương Trạch, Thanh Xuân, Hà Nội', N'0918449386')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [Luong]) VALUES (2013, N'Nguyễn Hoàng', CAST(0xAC1F0B00 AS Date), N'Nam', N'Bình Dương', N'0987654345', N'hoangnt32@gmail.com', N'Admin', 5000000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [Luong]) VALUES (2031, N'Nguyễn Ngọc Thảo', CAST(0x681D0B00 AS Date), N'Nữ', N'Bình Duong', N'0977220345', N'hoangnt33@gmail.com', N'Nhân viên bán hàng', 5000000)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [Luong]) VALUES (2032, N'Nguyễn Minh Hùng', CAST(0x4D1D0B00 AS Date), N'Nam', N'Bình Dương', N'0838260340', N'hoangnt34@gmail.com', N'Nhân viên kho', 5000000)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieu], [MaNV], [NgayNhap], [TriGia]) VALUES (1019, 2013, CAST(0x0000A9E7009C9078 AS DateTime), 157880000)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1014, N'Bơ sáp', 1003, 1003, N'Kg', N'/img/bo_sap.png', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bơ s&aacute;p c&oacute; vị b&eacute;o ngậy v&agrave; thanh m&aacute;t rất dễ kết hợp trong thực đơn mỗi ng&agrave;y của gia đ&igrave;nh. D&ugrave; l&agrave; m&oacute;n mặn hay m&oacute;n ngọt, bơ s&aacute;p vẫn dễ d&agrave;ng l&agrave;m dậy l&ecirc;n vị ngon của m&oacute;n ăn. Bơ s&aacute;p tại Auchan c&oacute; xuất xứ từ L&acirc;m Đồng với h&igrave;nh d&aacute;ng tr&aacute;i to, tr&ograve;n, lớp vỏ xanh v&agrave; thịt bơ s&aacute;p dẻo thơm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bơ l&agrave; một loại quả c&oacute; gi&aacute; trị dinh dưỡng v&ocirc; c&ugrave;ng tuyệt vời, gi&agrave;u chất chống oxy h&oacute;a c&oacute; t&aacute;c dụng ngăn ngừa sự h&igrave;nh th&agrave;nh c&aacute;c gốc tự do dẫn đến ung thư, l&atilde;o h&oacute;a duy tr&igrave; vẻ tươi trẻ v&agrave; l&agrave;n da săn chắc của l&agrave;n da.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Bơ c&ograve;n l&agrave; loại quả rất tốt cho phụ nữ mang thai đặc biệt l&agrave; giai đoạn đầu của thai kỳ. C&oacute; lợi cho trẻ nhỏ trong việc ph&aacute;t triển thể chất, tr&iacute; tuệ v&agrave; n&acirc;ng cao tr&iacute; nhớ.</p>
', 40000, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1020, N'Xoài keo', 1003, 1003, N'Kg', N'/img/xoai_keo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Xo&agrave;i keo c&oacute; nguồn gốc từ Campuchia v&agrave; được đặt t&ecirc;n theo t&ecirc;n 1 địa danh ở Campuchia (Tỉnh T&agrave; Keo), hiện nay giống xo&agrave;i n&agrave;y được trồng nhiều ở c&aacute;c tỉnh Miền Nam nước ta, xo&agrave;i keo c&oacute; đặc điểm l&agrave; thu&ocirc;n d&agrave;i về 2 đầu v&agrave; căng tr&ograve;n ở phần bụng, quả c&oacute; vỏ mỏng v&agrave; hạt l&eacute;p, chưa ch&iacute;n vỏ c&oacute; m&agrave;u xanh nhưng ruột c&oacute; m&agrave;u v&agrave;ng, ăn rất d&ograve;n &iacute;t chua v&agrave; hơi ngậy. Khi ch&iacute;n xo&agrave;i keo c&oacute; vị ngọt, thịt mềm nhưng hơi xơ. V&igrave; &iacute;t chua v&agrave; c&oacute; độ d&ograve;n v&agrave; rất thơm n&ecirc;n xo&agrave;i keo thường được d&ugrave;ng để ăn sống nhiều hơn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bảo quản nơi kh&ocirc; tho&aacute;ng hoặc trong ngăn m&aacute;t của tủ lạnh.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ</span>: Việt Nam.</p>
', 18000, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1022, N'Đu đủ ruột vàng', 1003, 1003, N'Kg', N'/img/du_du.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đu đủ ruột v&agrave;ng l&agrave; một trong những loại tr&aacute;i c&acirc;y gi&agrave;u chất dinh dưỡng ph&ugrave; hợp cho mọi đối tượng trong gia đ&igrave;nh. Trong đu đủ ruột v&agrave;ng chứa một lượng vitamin A, B, C v&agrave; lycopene cao đ&oacute;ng vai tr&ograve; như một &ldquo;thần dược&rdquo; gi&uacute;p chống lại oxy h&oacute;a, ngăn ngừa ung thư, cải thiện ti&ecirc;u h&oacute;a v&agrave; th&uacute;c đẩy sức khỏe tim mạch.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đu đủ l&agrave; loại tr&aacute;i c&acirc;y c&oacute; gi&aacute; trị dinh dưỡng cao, được nhiều b&agrave; nội trợ sử dụng để chế biến m&oacute;n ăn gia đ&igrave;nh hằng ng&agrave;y. Đu đủ ruột v&agrave;ng c&oacute; đặc t&iacute;nh vỏ mỏng, ruột d&agrave;y v&agrave; rất ngọt. Đu đủ c&oacute; thể sử dụng để chế biến rất nhiều m&oacute;n ăn ngon. Đu đủ sống c&oacute; thể l&agrave;m gỏi, nấu canh, nếu ch&iacute;n c&oacute; thể ăn trực tiếp hoặc l&agrave;m sinh tố.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Ngo&agrave;i việc sử dụng đu đủ l&agrave;m m&oacute;n ăn hằng ng&agrave;y, đu đủ c&ograve;n được ứng dụng trong y học v&agrave; giảm c&acirc;n hiệu quả v&igrave; c&oacute; t&iacute;nh dược cao.&nbsp;</p>
', 12000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1023, N'Lê Hàn Quốc', 1003, 1003, N'Kg', N'/img/le-han-quoc-03.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	L&ecirc; H&agrave;n Quốc từ l&acirc;u đ&atilde; được người ti&ecirc;u d&ugrave;ng Việt Nam ưa chuộng bởi chất lượng đ&atilde; được khẳng định tr&ecirc;n to&agrave;n thế giới, l&ecirc; c&oacute; h&igrave;nh d&aacute;ng quả to, vỏ d&agrave;y v&agrave; c&oacute; m&agrave;u v&agrave;ng bắt mắt. Khi ăn bạn sẽ cảm nhận được vị ngọt m&aacute;t, thơm v&agrave; gi&ograve;n. Ngo&agrave;i ra, L&ecirc; H&agrave;n Quốc gi&agrave;u c&aacute;c chất xơ, vitamin c&oacute; lợi cho sức khỏe chống tiểu đường, chống cholesterol v&agrave; cắt cơn đ&oacute;i nhanh ch&oacute;ng.</p>
', 77000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1024, N'Nho đen không hạt Úc', 1003, 1004, N'Kg', N'/img/nho_den.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nho đen kh&ocirc;ng hạt &Uacute;c với k&iacute;ch thước quả to, b&ecirc;n ngo&agrave;i c&oacute; một lớp phấn mỏng tự nhi&ecirc;n để bảo vệ quả, nho m&agrave;u đen sẫm, vị ngọt, nhiều nước, ăn gi&ograve;n v&agrave; rất thơm. Ch&ugrave;m quả to, căng v&agrave; chắc quả. Nho đen kh&ocirc;ng hạt &Uacute;c l&agrave; loại tr&aacute;i c&acirc;y gi&agrave;u dinh dưỡng v&agrav', 160000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1025, N'Táo đỏ Pháp', 1003, 1004, N'Kg', N'/img/tao_do.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">T&aacute;o đỏ Ph&aacute;p ngọt ng&agrave;o như ch&iacute;nh đất nước tạo ra n&oacute;. Lớp vỏ b&ecirc;n ngo&agrave;i c&oacute; m&agrave;u đỏ thẫm, vỏ mỏng đặc trưng v&agrave; xen kẽ với nhiều sọc v&agrave;ng. T&aacute;o đỏ Ph&aacute;p c&oacute; hương thơm nhẹ nh&agrave;ng, độ gi&ograve;n tan v&agrave; vị ngọt tự nhi&ecirc;n. Trong t&aacute;o c&oacute; chứa nhiều c&aacute;c vitamin v&agrave; chất chống oxi h&oacute;a hỗ trợ bảo vệ sức khỏe tim mạch.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">T&aacute;o đỏ Ph&aacute;p l&agrave; một nguy&ecirc;n liệu tuyệt vời trong nấu ăn v&agrave; l&agrave;m b&aacute;nh hoặc nước &eacute;p.&nbsp;T&aacute;o c&oacute; k&iacute;ch thước vừa phải, đều tr&aacute;i, cuống c&ograve;n tươi, da b&oacute;ng đỏ quyến rũ.&nbsp;T&aacute;o&nbsp;bổ sung nhiều kho&aacute;ng chất v&agrave; vitamin, chất xơ cần thiết cho cơ thể. Ăn t&aacute;o mỗi ng&agrave;y gi&uacute;p bạn ổn định huyết &aacute;p, tăng cường sức đề kh&aacute;ng, trẻ h&oacute;a cho l&agrave;n da.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đặc điểm nổi bật:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Tr&aacute;i c&oacute; k&iacute;ch thước vừa phải, chừng 4-5 tr&aacute;i/kg.</li>
	<li style="box-sizing: inherit;">
		Vỏ t&aacute;o m&agrave;u đỏ rực với những đốm t&iacute;a v&agrave;ng bắt mắt.</li>
	<li style="box-sizing: inherit;">
		Thịt t&aacute;o gi&ograve;n, mọng nước với vị ngọt v&agrave; hương thơm đặc trưng.</li>
	<li style="box-sizing: inherit;">
		Bổ sung nhiều vitamin v&agrave; kho&aacute;ng chất, chất xơ, đường tự nhi&ecirc;n gi&uacute;p cơ thể khỏe mạnh.&nbsp;</li>
	<li style="box-sizing: inherit;">
		Chế biến được nhiều m&oacute;n ăn ngon, bổ dưỡng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:</span>&nbsp;Bồi dưỡng cơ thể, tăng sức đề kh&aacute;ng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">-&nbsp;</span>Rửa sạch bằng nước muối hoặc dung dịch rửa tr&aacute;i c&acirc;y, rau củ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	- Sau đ&oacute; gọt bỏ vỏ v&agrave; cắt th&agrave;nh từng l&aacute;t để ăn (C&oacute; thể ăn lu&ocirc;n vỏ, bỏ hạt (nếu c&oacute;)).</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	- Ngon hơn khi để lạnh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	- Để t&aacute;o kh&ocirc;ng bị th&acirc;m, cắt t&aacute;o rồi nh&uacute;ng qua nước lạnh c&oacute', 40000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1026, N'Cam sành', 1003, 1004, N'Kg', N'/img/cam_sanh.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">1. Giới thiệu chung:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Cam s&agrave;nh vắt nước c&oacute; da xanh b&oacute;ng, cầm chắc tay. Cam c&oacute; t&aacute;c dụng giải kh&aacute;t v&agrave; bổ sung Vitamin cho cơ thể.</li>
	<li style="box-sizing: inherit;">
		Một ly cam v&agrave;o mỗi buổi s&aacute;ng chứa vitamin C tự nhi&ecirc;n, gi&uacute;p l&agrave;m chậm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a, tăng cường hệ miễn dịch, khiến bạn khỏe mạnh v&agrave; phấn chấn.&nbsp;</li>
	<li style="box-sizing: inherit;">
		Trong nước cam chứa rất nhiều vitamin C, canxi, axit folic, kali... rất tốt cho việc bồi bổ cơ thể.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">2. C&aacute;c m&oacute;n ăn ngon:&nbsp;</span>Cam s&agrave;nh vắt nước cho th&ecirc;m t&iacute; đường sẽ c&oacute; vị chua ngọt dễ uống, hoặc c&oacute; thể pha cam c&ugrave;ng c&agrave; rốt hay c&aacute;c loại rau củ quả kh&aacute;c. Cam c&ograve;n l&agrave; m&oacute;n ăn tr&aacute;ng miệng ngon, chống ngấy hiệu quả sau những bữa ăn hay bữa tiệc gi&agrave;u đạm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">3. Mẹo vặt:&nbsp;</span>Cam d&ugrave; tốt nhưng kh&ocirc;ng n&ecirc;n d&ugrave;ng cam khi đ&oacute;i hoặc khi qu&aacute; no, tốt nhất d&ugrave;ng sau bữa ăn 1-2 giờ. Kh&ocirc;ng d&ugrave;ng cam v&agrave;o buổi tối tr&aacute;nh cồn c&agrave;o kh&oacute; ngủ. Đặc biệt kh&ocirc;ng n&ecirc;n d&ugrave;ng nước cam sau khi ăn hải sản tr&aacute;nh g&acirc;y chướng bụng hay ngộ độc.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">4. Hướng dẫn bảo quản:&nbsp;</span>Bảo quản ngăn m&aacute;t tủ lạnh.</p>
', 30000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1027, N'Mãng cầu xiêm', 1003, 1004, N'Kg', N'/img/mang_cau.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">M&atilde;ng cầu xi&ecirc;m hay c&ograve;n gọi l&agrave; m&atilde;ng cầu gai c&oacute; k&iacute;ch thước lớn, vỏ ngo&agrave;i m&agrave;u xanh đậm với nhiều gai nhỏ x&ugrave; x&igrave;. Thịt m&atilde;ng cầu xi&ecirc;m m&agrave;u trắng, mềm, h&ograve;a quyện giữa vị chua xen kẽ với vị ngọt dịu tạo n&ecirc;n một hương vị độc đ&aacute;o kh&oacute; qu&ecirc;n. M&atilde;ng cầu xi&ecirc;m thường được chọn để ăn tr&aacute;ng miệng hay chế biến th&agrave;nh c&aacute;c m&oacute;n sinh tố m&aacute;t lạnh đều hấp dẫn.&nbsp;</span><br style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;" />
	<span style="box-sizing: inherit; font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khoảng 1,5 kg/ tr&aacute;i</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Trong m&atilde;ng cầu xi&ecirc;m c&oacute; chứa rất nhiều th&agrave;nh phần c&oacute; lợi cho sức khỏe như : c&aacute;c loại vitamin,canxi,cali,sắt...Ngo&agrave;i ra c&ograve;n gi&uacute;p kh&aacute;ng v&agrave; diệt khuẩn, ngăn ngừa nhiễm tr&ugrave;ng, điều trị vết thương, tăng sức đề kh&aacute;ng, ph&ograve;ng bệnh huyết &aacute;p, cải thiện rối loạn bao tử,điều trị ph&aacute;t ban, ch&aacute;y rận...</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	B&ecirc;n cạnh đ&oacute; phải&nbsp;nhắc đến khả năng ph&ograve;ng chống ung thư kinh ngạc của m&atilde;ng cầu xi&ecirc;m,một c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu ở H&agrave;n Quốc đ&atilde; ph&aacute;t hiện ra rằng nước &eacute;p m&atilde;ng cầu xi&ecirc;m ti&ecirc;u diệt tế b&agrave;o ung thư cao gấp 10.000 lần so với liệu ph&aacute;p h&oacute;a trị m&agrave; kh&ocirc;ng hề c&oacute; t&aacute;c dụng phụ.</p>
', 48000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1028, N'Dưa hấu Mỹ', 1003, 1003, N'Kg', N'/img/dua_hau.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dưa hấu Mỹ l&agrave; giống dưa hấu ngon được du nhập v&agrave;o Việt Nam v&agrave; được trồng nhiều tại c&aacute;c nh&agrave; vườn ở miền T&acirc;y. Dưa hấu Mỹ c&oacute; h&igrave;nh dạng bầu dục, lớp vỏ mỏng, bề mặt vỏ m&agrave;u xanh nhạt với c&aacute;c đường sọc san s&aacute;t m&agrave;u xanh đậm rất dễ nhận biết. Ruột dưa hấu m&agrave;u đỏ tươi, &iacute;t hạt v&agrave; mọng nước c&oacute; vị ngọt thanh tạo cảm gi&aacute;c sảng kho&aacute;i cho người d&ugrave;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dưa hấu l&agrave; loại tr&aacute;i c&acirc;y chứa nhiều chất dinh dưỡng, thường được sử dụng giải nhiệt trong những ng&agrave;y h&egrave; n&oacute;ng nực.</span></p>
', 22000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1029, N'Khoai tây Đà Lạt', 1003, 1007, N'Kg', N'/img/khoaitay.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khoai t&acirc;y Đ&agrave; lạt c&oacute; vị b&ugrave;i b&ugrave;i, thịt khoai dẻo, Khoai t&acirc;y l&agrave; loại củ c&oacute; th&agrave;nh phần gi&aacute; trị dinh dưỡng cao, l&agrave; nguồn cung cấp: Protein, chất xơ, vitamin C, B6 v&agrave; một số kho&aacute;ng chất cần thiết kh&aacute;c, rất tốt cho sức khỏe.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khoai t&acirc;y tươi chứa đến 80% l&agrave; nước, ngo&agrave;i ra chủ yếu l&agrave; carb, một lượng chất xơ v&agrave; đạm v&agrave; hầu như kh&ocirc;ng chứa chất b&eacute;o. Khoai t&acirc;y Đ&agrave; Lạt được ph&acirc;n phối bở Auchan được lựa chọn kĩ c&agrave;ng từ những nh&agrave; vườn uy t&iacute;n nhất, nu&ocirc;i trồng theo phương ph&aacute;p hữu cơ, ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng chất bảo vệ thực vật, n&ecirc;n đảm bảo đ&uacute;ng nguồn gốc xuất xứ v&agrave; an to&agrave;n thực phẩm. Với th&agrave;nh phần dinh dưỡng gi&aacute; trị cao, khoai t&acirc;y được d&ugrave;ng để chế biến rất nhiều m&oacute;n ăn ngon, l&agrave; nguồn cung cấp dưỡng chất thiết yếu cho gia đ&igrave;nh bạn mỗi ng&agrave;y.</span></p>
', 21000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1030, N'Cà rốt Đà Lạt', 1003, 1007, N'Kg', N'/img/carot.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&agrave; rốt Đ&agrave; Lạt củ nhỏ, thường c&oacute; cuống để giữ cho củ tươi ngon, tr&ecirc;n c&aacute;c th&acirc;n thường c&oacute; rễ nhỏ mọc li ti, đậm m&agrave;u. C&agrave; rốt l&agrave; một loại rau củ ngon v&agrave; rất bổ dưỡng, gi&agrave;u vitamin c&oacute; nhiều lợi &iacute;ch cho sức khỏe như cải thiện thị lực, ngăn ngừa ung thư, bảo vệ tim mạch, l&agrave;m đẹp da. N&ecirc;n chế biến c&agrave; rốt ngay khi mua về hoặc tối đa bảo quản trong 2 tuần để đảm bảo h&agrave;m lượng dinh dưỡng cũng như vị tươi ngon của ch&uacute;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Giới thiệu chung:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		C&agrave; rốt Đ&agrave; Lạt l&agrave; một trong những loại củ v&ocirc; c&ugrave;ng phổ biến trong m&acirc;m cơm của người Việt Nam.</li>
	<li style="box-sizing: inherit;">
		C&agrave; rốt Đ&agrave; Lạt sở hữu vẻ ngo&agrave;i đều m&agrave;u, củ vừa tay v&agrave; vị ngọt dịu tự nhi&ecirc;n.</li>
	<li style="box-sizing: inherit;">
		Lợi &iacute;ch của c&agrave; rốt kh&ocirc;ng chỉ l&agrave;m cho m&oacute;n ăn c&oacute; th&ecirc;m m&agrave;u sắc, m&agrave; c&ograve;n rất tốt cho sức khỏe như bảo vệ thị gi&aacute;c, bảo vệ tim, gi&uacute;p phổi khỏe mạnh.</li>
	<li style="box-sizing: inherit;">
		Do c&oacute; h&agrave;m lượng chất chống &ocirc;xy h&oacute;a cao n&ecirc;n lợi &iacute;ch của c&agrave; rốt c&ograve;n giảm nguy cơ&nbsp;ung thư v&uacute;, ung thư cổ, ung thư ruột kết, ung thư phổi, ung thư tuyến tiền liệt.</li>
	<li style="box-sizing: inherit;">
		C&aacute;c nghi&ecirc;n cứu đ&atilde; chỉ ra rằng việc hấp thụ những thực phẩm gi&agrave;u chất carotenoid sẽ l&agrave;m giảm t&igrave;nh trạng lượng đường trong m&aacute;u cao v&agrave; t&igrave;nh trạng kh&aacute;ng insulin.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&aacute;ch chế biến:</span>&nbsp;bạn c&oacute; thể sử dụng nguy&ecirc;n liệu c&agrave; rốt Đ&agrave; Lạt trong c&aacute;c m&oacute;n ăn như canh s&uacute;p, rau trộn salad, l&agrave;m nước &eacute;p v&agrave; yaourt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Khi mua c&agrave; rốt, bạn n&ecirc;n chọn những củ c&ograve;n l&aacute; xanh tươi, chắc nịch, m&agrave;u tươi b&oacute;ng v&agrave; h&igrave;nh d&aacute;ng gọn g&agrave;ng, nhẵn nhụi. Tr&aacute;nh mua c&agrave; rốt bị nứt, kh&ocirc; teo. Nếu c&agrave; rốt kh&ocirc;ng c&ograve;n l&aacute;, m&agrave; cuống lại bị đen l&agrave; c&agrave; rốt qu&aacute; gi&agrave;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	H&atilde;y giữ c&agrave; rốt ở ngăn lạnh d&agrave;nh cho rau củ của tủ lạnh, trong t&uacute;i nhựa hoặc bọc bằng giấy lau tay. Đừng rửa trước khi cất tủ lạnh, v&igrave; c&agrave; rốt qu&aacute; ướt khi để trong t&uacute;i sẽ mau bị hư.</p>
', 20000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1031, N'Xà lách Lô Lô xanh', 1003, 1007, N'Kg', N'/img/xa_lach.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">X&agrave; l&aacute;ch L&ocirc; L&ocirc; xanh nổi tiếng v&igrave; sự tươi, vị ngọt tự nhi&ecirc;n, gi&ograve;n rất ngon. X&agrave; l&aacute;ch được trồng ở Đ&agrave; Lạt với điều kiện kh&iacute; hậu thuận lợi, ho&agrave;n to&agrave;n kh&ocirc;ng thuốc trừ s&acirc;u, thuốc bảo quản... gi&uacute;p mọi gia đ&igrave;nh an t&acirc;m sử dụng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khi nhắc đến m&oacute;n salad, mọi ng&agrave;y nghĩ ngay đến một loại x&agrave; l&aacute;ch mềm lẫn gi&ograve;n, vị ngọt tự nhi&ecirc;n, thơm nhẹ nh&agrave;ng dễ chịu, ch&iacute;nh l&agrave; x&agrave; l&aacute;ch L&ocirc; L&ocirc;. Từng l&aacute; x&agrave; l&aacute;ch tươi ngon, sẽ k&iacute;ch th&iacute;ch khẩu vị v&ocirc; c&ugrave;ng khi h&ograve;a quyện c&ugrave;ng nước sốt, hoặc ăn sống k&egrave;m c&aacute;c loại rau thơm kh&aacute;c.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		X&agrave; l&aacute;ch lolo xanh c&oacute; l&aacute; lớn v&agrave; sắp xếp rời rạch, tảng l&aacute; rộng v&agrave; xoăn. X&agrave; l&aacute;ch lolo xanh c&oacute; hương vị nhẹ v&agrave; kết cấu l&aacute; hơi gi&ograve;n.</li>
	<li style="box-sizing: inherit;">
		X&agrave; l&aacute;ch lolo xanh l&agrave; một loại c&acirc;y &ocirc;n đới thuộc họ C&uacute;c. X&agrave; l&aacute;ch trồng chủ yếu ở Lầm Đồng v&agrave; cung cấp cho cả nước.</li>
	<li style="box-sizing: inherit;">
		Trong ẩm thực, x&agrave; l&aacute;ch thường được sử dụng để ăn sống hoặc l&agrave;m nguy&ecirc;n liệu ch&iacute;nh cho m&oacute;n salad.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin dinh dưỡng:</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Tương tự c&aacute;c loại x&agrave; l&aacute;ch kh&aacute;c cứ 100 gam x&agrave; l&aacute;ch sẽ cung cấp khoảng 2,2 gam carbohydrate, 1,2 gam chất xơ, 90 gam nước, 166 microgram vitamin A, 73 microgram folate (vitamin B9). X&agrave; l&aacute;ch c&ograve;n chứa rất nhiều muối kho&aacute;ng với những nguy&ecirc;n tố kiềm, nhờ đ&oacute; gi&uacute;p cơ thể lọc m&aacute;u.</p>
', 29000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1032, N'Khoai lang giống Nhật', 1003, 1007, N'Kg', N'/img/khoai_lang.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khoai lang giống Nhật tại Auchan c&oacute; xuất xứ từ L&acirc;m Đồng sở hữu c&aacute;c đặc điểm như củ to d&agrave;i, vỏ ngo&agrave;i m&agrave;u t&iacute;m v&agrave; ruột m&agrave;u v&agrave;ng đậm. Với vị ngọt b&ugrave;i, khoai lang giống Nhật l&agrave; m&oacute;n ăn nhẹ rất ngon miệng v&agrave; được d&ugrave;ng để l&agrave;m nguy&ecirc;n liệu cho m&oacute;n ch&egrave; hoặc c&agrave; ri thơm lừng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Khoai lang giống Nhật với hương vị thơm ngon, thịt khoai chắc, ngọt v&agrave; b&eacute;o b&ugrave;i được trồng theo phương ph&aacute;p hữu cơ, Sản phẩm do Auchan ph&acirc;n phối được lấy từ n&ocirc;ng trại uy t&iacute;n cam kết đảm bảo chất lượng v&agrave; an to&agrave;n cho người ti&ecirc;u d&ugrave;ng. Ngo&agrave;i ra, trong khoai lang c&ograve;n c&oacute; rất nhiều chất dinh dưỡng, c&oacute; thể gi&uacute;p c&aacute;c b&agrave; nội trợ chế biến th&ecirc;m nhiều m&oacute;n ngon bổ dưỡng cho gia đ&igrave;nh.</span></p>
', 16000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1033, N'Bắp cải trắng Đà Lạt', 1003, 1007, N'Kg', N'/img/bap_cai.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bắp cải trắng Đ&agrave; Lạt c&oacute; thể d&ugrave;ng để chế biến th&agrave;nh đa dạng c&aacute;c m&oacute;n ăn như nấu canh, cuộn thịt bằm hay trộn gỏi. Với vị ngọt thanh, t&iacute;nh h&agrave;n, bắp cải trắng Đ&agrave; Lạt c&ograve;n c&oacute; khả năng thanh nhiệt, giải độc v&agrave; ph&ograve;ng chống c&aacute;c bệnh về suy nhược thần kinh.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bắp cải trắng Đ&agrave; Lạt được cung cấp từ nguồn rau củ quả sạch tại c&aacute;c vườn rau xanh, si&ecirc;u sạch ở Đ&agrave; Lạt. Bắp cải cuộn th&agrave;nh từng b&uacute;p chắc, khỏe với m&agrave;u trắng n&otilde;n rất đẹp mắt. Nhiều m&oacute;n ăn ngon, bổ dưỡng được chế biến từ bắp cải trắng, kể cả m&oacute;n chay lẫn m&oacute;n mặn, với nhiều c&aacute;ch chế biến: hấp, x&agrave;o, trộn gỏi, nấu canh, ...</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&uacute;p cuộn tr&ograve;n m&agrave;u trắng, săn chắc, đặc ruột.</li>
	<li style="box-sizing: inherit;">
		L&aacute; tươi, gi&ograve;n v&agrave; c&oacute; vị ngọt dịu, thanh m&aacute;t.&nbsp;</li>
	<li style="box-sizing: inherit;">
		L&agrave; thực phẩm chứa nhiều chất dinh dưỡng rất tốt cho sức khỏe.</li>
	<li style="box-sizing: inherit;">
		Chế biến được nhiều m&oacute;n ăn ngon, bổ dưỡng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>Chế biến c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch: trộn gỏi, hấp, x&agrave;o, nấu canh, ...</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:&nbsp;</span>nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Tr&aacute;nh &aacute;nh nắng trực tiếp. Chưa sử dụng ngay th&igrave; cho v&agrave;o ngăn m&aacute;t tủ lạnh.</p>
', 14000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1034, N'Cải ngọt', 1003, 1007, N'Kg', N'/img/cai_ngot.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải ngọt l&agrave; một loại rau xanh v&ocirc; c&ugrave;ng gần gũi với những người nội trợ. C&acirc;y cải ngọt c&oacute; phần th&acirc;n m&agrave;u xanh nhạt v&agrave; phần l&aacute; vươn cao m&agrave;u xanh đậm. L&aacute; của c&acirc;y cải ngọt to, h&igrave;nh bầu dục v&agrave; bo tr&ograve;n ở r&igrave;a. Vị của cải ngọt khi nấu ch&iacute;n ngọt, cho nước m&agrave;u xanh v&agrave; phần th&acirc;n gi&ograve;n n&ecirc;n được d&ugrave;ng nhiều để nấu canh, ăn lẩu hoặc luộc.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ngo&agrave;i chức năng l&agrave; thực phẩm chuy&ecirc;n d&ugrave;ng th&igrave; cải ngọt c&ograve;n được biết đến như một loại c&acirc;y mang lại rất nhiều lợi &iacute;ch cho sức khỏe cũng như c&oacute; t&aacute;c dụng ph&ograve;ng v&agrave; chữa một số bệnh.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa ho đườm, ho hen.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa vi&ecirc;m phế quản.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Điều trị vi&ecirc;m họng.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thanh nhiệt, giải độc tố v&agrave; điều trị mụn nhọt.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ cho bộ m&aacute;y ti&ecirc;u h&oacute;a v&agrave; t&aacute;o b&oacute;n,vi&ecirc;m ruột.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ tốt cho bệnh nh&acirc;n tiểu đường.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ người bị bứu cổ.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tăng sức đề kh&aacute;ng v&agrave; chống l&atilde;o h&oacute;a.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa bệnh gout.</span></p>
', 19000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1035, N'Củ cải trắng', 1003, 1007, N'Kg', N'/img/cu_cai_trang.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Được v&iacute; von như nh&acirc;n s&acirc;m trắng, củ cải trắng l&agrave; loại rau củ mang nhiều lợi &iacute;ch sức khỏe cho cơ thể. To&agrave;n th&acirc;n củ cải c&oacute; m&agrave;u trắng tinh, cuống l&aacute; m&agrave;u xanh v&agrave; tr&ecirc;n bề mặt th&acirc;n c&oacute; nhiều sọc ngang v&agrave; lỗ nhỏ li ti. Củ cải trắng m&aacute;t v&agrave; vị ngọt n&ecirc;n được d&ugrave;ng nhiều trong c&aacute;c nồi nước d&ugrave;ng khi nấu hủ tiếu hoặc mỳ để tăng độ ngọt.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Củ cải trắng l&agrave; một loại rau ăn củ, c&oacute; h&igrave;nh dạng giống củ c&agrave; rốt nhưng lại thuộc họ cải, to&agrave;n th&acirc;n trắng m&uacute;t v&agrave; mọng nước. Củ cải sống c&oacute; vị cay nồng, nhưng khi nấu ch&iacute; lại c&oacute; vị ngọt. Củ cải trắng thường được sử dụng để nấu soup, nước d&ugrave;ng để tăng vị ngọt tự nhi&ecirc;n. Đặc biệt củ cải muối ăn v&agrave;o m&ugrave;a đ&ocirc;ng rất tuyệt vời.</span></p>
', 19000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1036, N'Cải bẹ xanh', 1003, 1007, N'Kg', N'/img/cai_be_xanh.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải bẹ xanh hay t&ecirc;n gọi kh&aacute;c l&agrave; cải xanh, cải đắng c&oacute; ngoại h&igrave;nh kh&aacute; giống với cải ngọt với th&acirc;n to v&agrave; t&aacute;n l&aacute; x&ograve;e rộng m&agrave;u xanh l&aacute;. Kh&aacute;c với cải ngọt, phần l&aacute; của cải bẹ xanh c&oacute; răng cưa ở r&igrave;a. Cải bẹ xanh c&oacute; vị đắng, cay nhẹ nhưng lại rất m&aacute;t n&ecirc;n thường được d&ugrave;ng để nấu canh hoặc x&agrave;o.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ngo&agrave;i chức năng l&agrave; thực phẩm chuy&ecirc;n d&ugrave;ng th&igrave; cải bẹ xanh c&ograve;n được biết đến như một loại c&acirc;y mang lại rất nhiều lợi &iacute;ch cho sức khỏe cũng như c&oacute; t&aacute;c dụng ph&ograve;ng v&agrave; chữa một số bệnh.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa ho đườm, ho hen.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa vi&ecirc;m phế quản.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Điều trị vi&ecirc;m họng.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thanh nhiệt, giải độc tố v&agrave; điều trị mụn nhọt.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ cho bộ m&aacute;y ti&ecirc;u h&oacute;a v&agrave; t&aacute;o b&oacute;n,vi&ecirc;m ruột.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ tốt cho bệnh nh&acirc;n tiểu đường.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hỗ trợ người bị bứu cổ.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tăng sức đề kh&aacute;ng v&agrave; chống l&atilde;o h&oacute;a.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chữa bệnh gout.</span></p>
', 20000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1037, N'Cải dún Đà Lạt', 1003, 1007, N'Kg', N'/img/cai_dun.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải d&uacute;n Đ&agrave; Lạt c&oacute; bề ngo&agrave;i gần giống với c&acirc;y cải thảo. Tuy nhi&ecirc;n, phần th&acirc;n của cải d&uacute;n Đ&agrave; Lạt to hơn v&agrave; phần l&aacute; ở mặt trong d&uacute;n rất nhiều. Cải d&uacute;n Đ&agrave; Lạt c&oacute; m&agrave;u trắng ở phần th&acirc;n v&agrave; chuyển dần sang m&agrave;u xanh nhạt khi đến phần l&aacute;. Đ&acirc;y l&agrave; loại rau dễ ăn, mềm, vị ngọt m&aacute;t n&ecirc;n thường được chế biến th&agrave;nh c&aacute;c m&oacute;n canh hoặc m&oacute;n x&agrave;o trong bữa cơm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải d&uacute;n chứa rất nhiều vitamin H c&oacute; t&aacute;c dụng rất tốt cho t&oacute;c, m&oacute;ng tay, m&oacute;ng ch&acirc;n v&agrave; l&agrave;m đẹp da ngo&agrave;i ra c&ograve;n c&oacute; t&aacute;c dụng tốt cho hệ thống thần kinh,tủy xương v&agrave; gi&uacute;p giảm đau cơ.</span></p>
', 24000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1038, N'Ớt chuông đỏ', 1003, 1007, N'Kg', N'/img/ot_do.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ớt chu&ocirc;ng đỏ được xếp v&agrave;o nh&oacute;m ớt &iacute;t cay với h&igrave;nh d&aacute;ng trụ tr&ograve;n v&agrave; m&agrave;u sắc đỏ tươi rực rỡ. B&ecirc;n trong ớt chu&ocirc;ng rỗng v&agrave; c&oacute; nhiều hạt nhỏ tập trung ở phần cuống. Đặc điểm của ớt chu&ocirc;ng đỏ l&agrave; vị ngọt nhất trong c&aacute;c m&agrave;u sắc, m&ugrave;i hăng nồng v&agrave; c&oacute; lượng vitamin C gấp đ&ocirc;i ớt chu&ocirc;ng xanh n&ecirc;n thường được bổ sung v&agrave;o m&oacute;n ăn để trang tr&iacute;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ớt chu&ocirc;ng đỏ l&agrave; loại ớt c&oacute; thể ăn sống hoặc chế biến, ớt chu&ocirc;ng đỏ c&oacute; vị ngọt, hơi chua l&agrave; loại ớt rất gi&agrave;u Vitamin C, chất xơ v&agrave; Vitamin B6. V&igrave; c&oacute; t&iacute;nh ngọt n&ecirc;n ớt chu&ocirc;ng đỏ thường sử dụng để ăn sống v&agrave; chế biến c&aacute;c m&oacute;n như: Salad, sốt, nấu cari, x&agrave;o hoặc nhồi thịt.</span></p>
', 70000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1039, N'Ớt chuông xanh', 1003, 1007, N'Kg', N'/img/ot_xanh.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ớt chu&ocirc;ng xanh sở hữu m&agrave;u xanh l&aacute; đậm tươi m&aacute;t. Trong c&aacute;c giống ớt chu&ocirc;ng th&igrave; ớt chu&ocirc;ng xanh c&oacute; vị cay, hăng v&agrave; nồng cao nhất. Ngo&agrave;i để trang tr&iacute; m&oacute;n ăn, ớt chu&ocirc;ng xanh c&ograve;n chứa nhiều th&agrave;nh phần như vitamin A, B, C, E v&agrave; kali c&oacute; lợi cho sức khỏe của cơ thể.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ớt chu&ocirc;ng xanh kh&ocirc;ng c&oacute; vị cay gắt, l&agrave; loại ớt chứa nhiều vitamin v&agrave; gi&agrave;u chất xơ, cung cấp chất dinh dưỡng cần thiết cho cơ thể.</span></p>
', 42000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1040, N'Củ dền', 1003, 1007, N'Kg', N'/img/cu_den.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Củ dền c&oacute; h&igrave;nh cầu, ở đ&aacute;y c&oacute; phần rễ nhọn d&agrave;i v&agrave; lớp vỏ b&ecirc;n ngo&agrave;i m&agrave;u đỏ t&iacute;a hoặc n&acirc;u. Khi cắt ngang củ dền, ruột củ m&agrave;u đỏ t&iacute;m v&agrave; c&oacute; nhiều khoang đậm nhạt kh&aacute;c nhau tạo th&agrave;nh c&aacute;c v&ograve;ng tr&ograve;n đồng t&acirc;m. Củ dền d&ugrave;ng nấu canh hoặc nấu s&uacute;p sẽ cho nước c&oacute; m&agrave;u đỏ t&iacute;m đặc trưng rất đẹp mắt.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Củ dền l&agrave; một thực phẩm c&oacute; nhiều c&ocirc;ng dụng cho sức khỏe m&agrave; ch&uacute;ng ta chưa biết đến.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Gi&uacute;p gan khỏe mạnh,b&agrave;i độc tố.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ổn định trạng th&aacute;i tinh thần,gi&uacute;p tinh thần lu&ocirc;n tươi trẻ </span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ổn định huyết &aacute;p.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chống đột quỵ v&agrave; ngăn ngừa bệnh tim.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải thiện chứng thiếu m&aacute;u,xơ vữa động mạch, gi&atilde;n tĩnh mạch.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tăng cường hệ miễn dịch.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Cải thiện c&aacute;c bệnh về t&uacute;i mật v&agrave; thận.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ngăn ngừa ung thư.</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">-&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bệnh g&uacute;t.</span></p>
', 26000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1041, N'Cà chua Đà Lạt', 1003, 1007, N'Kg', N'/img/ca_chua.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&agrave; chua Đ&agrave; Lạt c&oacute; h&igrave;nh d&aacute;ng bầu dục, cuống l&aacute; m&agrave;u xanh v&agrave; rẽ ra nhiều đỉnh nhọn. L&uacute;c c&ograve;n sống, c&agrave; chua Đ&agrave; Lạt c&oacute; m&agrave;u xanh nhưng khi ch&iacute;n, lớp vỏ ngo&agrave;i chuyển sang m&agrave;u đỏ cam bắt mắt. C&agrave; chua Đ&agrave; Lạt l&agrave; nguy&ecirc;n liệu gần gũi với gian bếp mọi nh&agrave; v&agrave; được d&ugrave;ng để ăn k&egrave;m, trang tr&iacute; hoặc chế biến n&ecirc;n c&aacute;c m&oacute;n ăn hấp dẫn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Trong c&agrave; chua c&oacute; chứa rất nhiều chất dinh dưỡng c&oacute; lợi cho cơ thể như carotene, lycopene, vitamin v&agrave; kali. Tất cả những chất n&agrave;y đều rất c&oacute; lợi cho sức khoẻ con người. Đặc biệt c&aacute;i loại vitamin B, vitamin C v&agrave; beta carotene gi&uacute;p cơ thể chống lại qu&aacute; tr&igrave;nh oxy ho&aacute; của cơ thể, giảm thiểu nguy cơ tử vong do bệnh tim mạch v&agrave; ung thư.</span></p>
', 26000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1042, N'Nạm bò Vissan', 1004, 1005, N'Kg', N'/img/bo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nạm b&ograve; Vissan l&agrave; phần thịt được cắt từ phần h&ocirc;ng b&ograve;. Phần thịt nạm b&ograve; thường d&agrave;i, mỏng v&agrave; kh&aacute; nạc n&ecirc;n thường được chọn để kết hợp trong c&aacute;c m&oacute;n như b&uacute;n b&ograve; huế, c&agrave; ri b&ograve; hay b&ograve; kho.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nạm b&ograve; Vissan ch&iacute;nh l&agrave; phần thịt b&ecirc;n sườn của con b&ograve;, c&oacute; 3 loại nạm b&ograve; l&agrave; nạm sườn, nạm (phần bụng) v&agrave; nạm bụng dịch dần về ph&iacute;a m&ocirc;ng con b&ograve;.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Nạm b&ograve; Vissan được lấy từ đ&agrave;n b&ograve; nhập khẩu ho&agrave;n to&agrave;n từ &Uacute;c, một nước đạt ti&ecirc;u chuẩn an to&agrave;n cao về mặt dịch tễ, kh&ocirc;ng c&oacute; dịch bệnh tr&ecirc;n gia s&uacute;c.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Nạm b&ograve; n&oacute;i ri&ecirc;ng v&agrave;&nbsp;thịt b&ograve;&nbsp;n&oacute;i chung, kh&ocirc;ng những c&oacute; hương vị thơm ngon, thịt b&ograve; c&ograve;n chứa rất nhiều c&aacute;c chất dinh dưỡng tốt cho cơ thể con người như sắt, kẽm, kali, c&aacute;c axit amin, c&aacute;c vitamin nh&oacute;m B (B2, B6, B12)&hellip;&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Được 2 cơ quan kiểm định độc lập kiểm tra v&agrave; cấp ph&eacute;p giết mổ theo y&ecirc;u cầu của Ch&iacute;nh phủ &Uacute;c. Tới thời điểm hiện tại, d&acirc;y chuyền giết mổ b&ograve; &Uacute;c của VISSAN l&agrave; d&acirc;y chuyền hiện đại nhất Việt Nam.</p>
<p>
	&nbsp;</p>
', 175000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1043, N'Ba chỉ bò nhập khẩu', 1004, 1005, N'Kg', N'/img/bachibo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ba chỉ b&ograve; nhập khẩu hay c&ograve;n gọi l&agrave; nạm b&ograve; nhập khẩu c&oacute; chất lượng tươi ngon, m&agrave;u sắc hấp dẫn. Thịt được cắt l&aacute;t mỏng với thớ thịt săn chắc, mềm b&eacute;o. Bạn c&oacute; thể cuộn nấm kim ch&acirc;m v&agrave; nướng c&ugrave;ng sốt rất ngon.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ba chỉ b&ograve; nhập khẩu được th&aacute;i miếng mỏng từ miếng ba chỉ b&ograve; tươi sống, cho vị ngọt tự nhi&ecirc;n. Thịt c&oacute; lớp mỡ mỏng tạo vị b&eacute;o nhẹ, thơm mềm, đậm đ&agrave; hơn khi chế biến. Ba chỉ b&ograve; th&iacute;ch hợp để l&agrave;m m&oacute;n nướng, x&agrave;o với ray củ hoặc hấp đều đem lại cho bạn những m&oacute;n ăn bổ dưỡng v&agrave; ngon miệng.</span></p>
', 300000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1044, N'Dẻ sườn bò Mỹ King BBQ', 1004, 1005, N'Kg', N'/img/debo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dẻ sườn b&ograve; l&agrave; phần thịt c&oacute; mỡ v&agrave; thịt xen kẽ đều nhau, nướng l&ecirc;n rất thơm v&agrave; mềm. Dẻ sườn b&ograve; của King BBQ được nhập trực tiếp từ Mỹ, đảm bảo thịt c&ograve;n tươi, ngon khi đến tay người d&ugrave;ng. Dẻ sườn tuyệt vời khi chế biến m&oacute;n thịt nướng cho cả gia đ&igrave;nh c&ugrave;ng thưởng thức.</span></p>
', 225000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1045, N'Má đùi gà CN San Hà', 1004, 1005, N'Kg', N'/img/ga.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng :&nbsp;&nbsp;</span>Nấu ch&iacute;n trước khi d&ugrave;ng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản :&nbsp;</span>Bảo quản nhiệt độ từ 0-4 độ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng :&nbsp;&nbsp;</span>NH3&lt; 35 mg /100g ; H25 &acirc;m t&iacute;nh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần :&nbsp;</span>100% thịt g&agrave;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin ATVSTP :&nbsp;</span>kh&ocirc;ng sử dụng SP qu&aacute; hạn sử dụng, sản phẩm c&oacute; m&ugrave;i h&ocirc;i-thối.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất sứ :&nbsp;</span>Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất :&nbsp;</span>C&ocirc;ng ty TNHH San H&agrave;.</p>
', 36000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1046, N'Cánh tỏi gà CN Uni', 1004, 1005, N'Kg', N'/img/canhga.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	C&aacute;nh g&agrave; l&agrave; phần &iacute;t thịt, nhiều da v&agrave; xương v&agrave; sụn. Th&iacute;ch hợp để chế biến c&aacute;c m&oacute;n như chi&ecirc;n, nướng. Ăn rất d&ograve;n v&agrave; ngon. C&aacute;nh tỏi g&agrave; b&aacute;n tại Auchan được cung cấp bởi C&ocirc;ng ty&nbsp;Koyu &amp; Unitek một đơn vị chuy&ecirc;n cung cấp thịt g&agrave; tươi với ti&ecirc;u ch&iacute; 3 kh&ocirc;ng: KH&Ocirc;NG CHẤT KH&Aacute;NG SINH - KH&Ocirc;NG CHẤT TẠO M&Agrave;U - KH&Ocirc;NG CHẤT TĂNG TRƯỞNG.&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>100% g&agrave; tươi</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;Sản phẩm nấu ch&iacute;n trước khi d&ugrave;ng hoặc chế biến ch&iacute;n t&ugrave;y &yacute;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;bảo quản ở nhiệt độ từ 0-5&deg;C</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:&nbsp;</span>Kh&ocirc;ng sử dụng sản phẩm đ&atilde; hết hạn</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:</span>&nbsp;Việt Nam</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khuyến c&aacute;o:</span>&nbsp;Khi ăn c&aacute;nh g&agrave; n&ecirc;n ăn k&egrave;m chất xơ để hạn chế việc hấp thu Cholesterol.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất:</span>&nbsp;C&ocirc;ng ty TNHH Koyu &amp; Unitek</p>
', 79000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1047, N'Đùi tỏi gà San Hà', 1004, 1005, N'Kg', N'/img/duiga.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đ&ugrave;i tỏi g&agrave; San H&agrave; đ&atilde; được kiểm nghiệm đạt ti&ecirc;u chuẩn vệ sinh an to&agrave;n thực phẩm, sản phẩm được sơ chế kỹ lưỡng v&agrave; &aacute;p dụng c&ocirc;ng nghệ bảo quản hiện đại, đảm bảo độ tươi ngon, v&agrave; h&agrave;m lượng chất dinh dưỡng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đ&ugrave;i tỏi g&agrave; San H&agrave; được Auchan ph&acirc;n phối l&agrave; sản phẩm đ&atilde; được kiểm định chất lượng, đảm bảo vệ sinh an to&agrave;n thực phẩm. Trong đ&ugrave;i g&agrave; chứa một h&agrave;m lượng lớn Protein v&agrave; nhiều kho&aacute;ng chất cần thiết cho cơ thể hoạt động thể chất như Nicacin v&agrave; rất dễ chế biến th&agrave;nh nhiều m&oacute;n ăn ngon, n&ecirc;n từ l&acirc;u đ&ugrave;i g&agrave; đ&atilde; trở th&agrave;nh m&oacute;n ăn quen thuộc gi&uacute;p c&aacute;c b&agrave;n nội trợ l&agrave;m phong ph&uacute; th&ecirc;m bữa ăn trong gia đ&igrave;nh.</span></p>
', 68000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1049, N'Thịt đùi heo Vissan', 1004, 1005, N'Kg', N'/img/thitduiheo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thịt heo đ&ugrave;i Vissan l&agrave; phần c&oacute; nhiều nạc, thớ thịt mềm v&agrave; thơm hơn khi chế biến. Thịt heo l&agrave; thực phẩm l&agrave;nh t&iacute;nh v&agrave; c&oacute; thể chế biến th&agrave;nh nhều m&oacute;n ăn ngon, n&ecirc;n được rất nhiều b&agrave; mẹ chọn sử dụng l&agrave;m m&oacute;n ăn trong bữa cơm gia đ&igrave;nh hằng ng&agrave;y.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thịt đ&ugrave;i heo Vissan do Auchan ph&acirc;n phối l&agrave; thịt tươi đ&atilde; qua kiểm định chất lượng, được bảo quản lạnh theo c&ocirc;ng nghệ hiện đại lu&ocirc;n đảm vệ sinh an to&agrave;n thực phẩm v&agrave; độ tươi ngon. Thịt heo chứa h&agrave;m lượng Protein, kho&aacute;ng chất v&agrave; c&aacute;c axit amin c&oacute; lợi cho sức khỏe. Đặc biệt, thịt đ&ugrave;i l&agrave; phần nạc rất &iacute;t mỡ n&ecirc;n th&agrave;nh phần gi&aacute; trị dinh dưỡng cao hơn, th&agrave;nh phần chất b&eacute;o b&atilde;o h&ograve;a (mỡ động vật) &iacute;t hơn, l&agrave; nguồn bổ sung Protein đ&aacute;ng kể v&agrave;o chế độ dinh dưỡng tăng cơ hằng ng&agrave;y của c&aacute;c vận động vi&ecirc;n.&nbsp;</span></p>
', 88000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1050, N'Thịt nạc heo xay Vissan', 1004, 1005, N'Kg', N'/img/thitnacheo.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">1. Giới thiệu chung:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Thịt nạc heo xay Vissan được chọn lọc từ phần thịt nạc ngon, nhiều nạc, được rửa sạch sẽ trước khi xay, bảo đảm vệ sinh an to&agrave;n thực phẩm.</li>
	<li style="box-sizing: inherit;">
		Thịt nạc xay Vissan gi&agrave;u Vitamin v&agrave; kho&aacute;ng chất, cung cấp canxi dồi d&agrave;o cho cơ thể.</li>
	<li style="box-sizing: inherit;">
		Thịt heo Vissan được chăn nu&ocirc;i đạt chuẩn, an to&agrave;n v&agrave; cho thịt sạch, ngon, gi&aacute; tốt cho mọi gia đ&igrave;nh Việt.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">2. C&aacute;c m&oacute;n ăn ngon:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Thịt nạc heo xay tiện &iacute;ch để nấu canh, dồn dồn qua, b&iacute;...</li>
	<li style="box-sizing: inherit;">
		Thịt nạc heo xay c&ograve;n để l&agrave;m m&oacute;n c&agrave; t&iacute;m x&agrave;o, trứng hấp thịt băm.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">3. Mẹo vặt:&nbsp;</span>Uớp thịt nạc xay c&ugrave;ng một &iacute;t gia vị, chia ra th&agrave;nh c&aacute;c phần nhỏ, trữ ngăn đ&aacute; để sử dụng dần.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">4. Hướng dẫn bảo quản:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Bảo quản ở ngăn đ&ocirc;ng tủ lạnh.</li>
	<li style="box-sizing: inherit;">
		Khi muốn sử dụng, lấy thịt từ ngăn đ&ocirc;ng để ở ngăn m&aacute;t 6 - 8 tiếng cho thịt mềm lại rồi chế biến.</li>
</ul>
', 92000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1051, N'Sườn già heo Vissan', 1004, 1005, N'Kg', N'/img/suonheo.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">1. Giới thiệu chung:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sườn gi&agrave; l&agrave; phần sườn c&oacute; nhiều xương, &iacute;t thịt của con heo. Phần thịt n&agrave;y khi nấu ch&iacute;n kh&ocirc;ng ngấy v&agrave; rất ngọt nước, đặc biệt th&iacute;ch hợp để ninh l&agrave;m nước d&ugrave;ng hoặc nấu canh hoặc l&agrave;m sườn r&aacute;n, sườn x&agrave;o chua ngọt.</li>
	<li style="box-sizing: inherit;">
		Nước d&ugrave;ng sẽ ngọt v&agrave; đậm đ&agrave; nhờ xương gi&uacute;p m&oacute;n ăn của bạn c&oacute; được vị ngọt tự nhi&ecirc;n m&agrave; kh&ocirc;ng cần phải nhờ đến qu&aacute; nhiều c&aacute;c gia vị n&ecirc;m nếm.</li>
	<li style="box-sizing: inherit;">
		Sườn gi&agrave; heo Vissan gi&agrave;u Vitamin v&agrave; kho&aacute;ng chất, cung cấp canxi dồi d&agrave;o cho cơ thể.</li>
	<li style="box-sizing: inherit;">
		Thịt heo Vissan được chăn nu&ocirc;i đạt chuẩn, an to&agrave;n v&agrave; cho thịt sạch, ngon, gi&aacute; tốt cho mọi gia đ&igrave;nh Việt.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">2. C&aacute;c m&oacute;n ăn ngon:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sườn gi&agrave; x&agrave;o chua ngọt l&agrave; m&oacute;n ăn ngon, k&iacute;ch th&iacute;ch khẩu vị người d&ugrave;ng. C&aacute;c m&oacute;n sườn rim mặn, sườn kho cũng l&agrave; những m&oacute;n ăn ngon từ sườn.</li>
	<li style="box-sizing: inherit;">
		Sườn gi&agrave; c&ograve;n chế biến c&aacute;c m&oacute;n canh bổ dưỡng cho gia đ&igrave;nh. Ngo&agrave;i ra sườn gi&agrave; d&ugrave;ng hầm để l&agrave;m nước l&egrave;o hủ tiếu, b&aacute;nh canh... thơm ngon.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">3. Mẹo vặt:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Khi muốn ninh, nấu, kho, cần luộc nhanh xương rồi đổ nước đ&agrave;u ti&ecirc;n ra, rửa sạch, sau đ&oacute; mới d&ugrave;ng xương để nấu m&oacute;n ăn theo &yacute; th&iacute;ch.</li>
	<li style="box-sizing: inherit;">
		C&aacute;ch n&agrave;y gi&uacute;p thịt sạch, thơm hơn, cho nước hầm trong hơn.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">4. Hướng dẫn bảo quản:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Bảo quản ở ngăn đ&ocirc;ng tủ lạnh.</li>
	<li style="box-sizing: inherit;">
		Khi muốn sử dụng, lấy thịt từ ngăn đ&ocirc;ng để ở ngăn m&aacute;t 6 - 8 tiếng cho thịt mềm lại rồi chế biến.</li>
</ul>
', 97000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1052, N'Giò heo rút xương Vissan', 1004, 1005, N'Kg', N'/img/gioheo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Gi&ograve; heo cung cấp nhiều chất dinh dưỡng cho cơ thể như đạm, chất b&eacute;o v&agrave; c&aacute;c Vitamin. Từ kh&acirc;u chăn nu&ocirc;i sạch, hợp vệ sinh, Gi&ograve; heo r&uacute;t xương Vissan được r&uacute;t xương trọn vẹn, sạch, kh&ocirc;ng vụn xương... người d&ugrave;ng c&oacute; thể tuyệt đối an t&acirc;m khi thưởng thức m&oacute;n ăn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">1. Giới thiệu chung:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Ch&acirc;n gi&ograve; l&agrave; phần thịt ngon, hội đủ mọi yếu tố ngon gồm xương, m&oacute;ng, mỡ, g&acirc;n... Tuy nhi&ecirc;n m&oacute;n ch&acirc;n gi&ograve; r&uacute;t xương c&ograve;n được y&ecirc;u th&iacute;ch gấp bội v&igrave; thịt dai, mềm h&ograve;a quyện, tảng thịt lớn ph&ugrave; hợp chế biến nhiều m&oacute;n ăn ngon.</li>
	<li style="box-sizing: inherit;">
		Gi&ograve; heo r&uacute;t xương Vissan được r&uacute;t xương trọn vẹn, sạch, kh&ocirc;ng vụn xương... c&ugrave;ng kh&acirc;u nu&ocirc;i thịt sạch, an to&agrave;n vệ sinh, cho người d&ugrave;ng an t&acirc;m tuyệt đối khi thưởng thức m&oacute;n ăn.</li>
	<li style="box-sizing: inherit;">
		Gi&ograve; heo r&uacute;t xương gi&agrave;u Vitamin, chất b&eacute;o, đạm... cung cấp dinh dưỡng cho cơ thể.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">2. C&aacute;c m&oacute;n ăn ngon:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Gi&ograve; heo r&uacute;t xương th&iacute;ch hợp nấu b&uacute;n gi&ograve;, hầm c&ugrave;ng c&aacute;c loại rau củ quả, hoặc kho, nấu.</li>
	<li style="box-sizing: inherit;">
		Đặc biệt v&agrave; chỉ ch&acirc;n gi&ograve; r&uacute;t xương mới l&agrave;m được ch&iacute;nh l&agrave; m&oacute;n ch&acirc;n gi&ograve; r&uacute;t xương dồn thịt, mộc nhĩ v&agrave; c&aacute;c loại gia vị...</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">3. Mẹo vặt:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&iacute; quyết để c&oacute; m&oacute;n ch&acirc;n gi&ograve; r&uacute;t xương ngon l&agrave; hơ ch&acirc;n gi&ograve; tr&ecirc;n lửa để đập m&oacute;ng, rửa sạch, thấm nước lau kh&ocirc;.</li>
	<li style="box-sizing: inherit;">
		D&ugrave;ng mũi k&eacute;o bấm cắt từng phần thịt b&aacute;m quanh xương, lấy hết thịt để dễ nh&igrave;n thấy xương, tới phần sụn th&igrave; d&ugrave;ng dao cắt r&uacute;t xương ra ngo&agrave;i, giữ lại phần xương m&oacute;ng.</li>
</ul>
', 105000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1053, N'Cá Saba tẩm sa tế Ichiban', 1004, 1009, N'Kg', N'/img/casaba.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>C&aacute; saba 85%, sa tế 5% (ớt, muối iot, tỏi, dầu đậu n&agrave;nh), sả băm, ớt kh&ocirc; 5%.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng trong 100g:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Nồng độ pH khoảng 6-8.</li>
	<li style="box-sizing: inherit;">
		H2S &acirc;m t&iacute;nh&nbsp;</li>
	<li style="box-sizing: inherit;">
		NH3 &lt;= 45mg/100g.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		R&atilde; đ&ocirc;ng tự nhi&ecirc;n từ 10 - 15 ph&uacute;t.</li>
	<li style="box-sizing: inherit;">
		Nướng tr&ecirc;n l&ograve; than hay bếp gas.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin cảnh b&aacute;o:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Nếu sử dụng l&ograve; vi s&oacute;ng phải gỡ ớp giấy bạc ra.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng sử dụng sản phẩm hết hạn v&agrave; dị ứng với c&aacute;c th&agrave;nh phần c&oacute; trong sản phẩm.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;Ở nhiệt độ -18 độ hoặc trong ngăn đ&aacute; khi chưa sử dụng.</p>
', 40000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1054, N'Cá thu đao', 1004, 1009, N'Kg', N'/img/cathudao.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&aacute; thu đao c&oacute; nhiều mỡ, gi&agrave;u hương vị đặc trưng của c&aacute; &#39;xanh&#39; như c&aacute; thu, c&aacute; tr&iacute;ch... C&aacute; thu đao con nhỏ, đầu d&agrave;i, nhiều thịt... th&iacute;ch hợp cho gia đ&igrave;nh thưởng thức nồi canh ng&oacute;t hoặc c&aacute; thu chi&ecirc;n, c&aacute; thu sốt c&agrave;...</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&aacute; thu đao chứa nhiều chất b&eacute;o v&agrave; c&aacute;c chất dinh dưỡng c&oacute; lợi cho sức khỏe như EPA v&agrave; DHA, l&agrave; những chất c&oacute; khả năng ph&ograve;ng chống c&aacute;c bệnh như nhồi m&aacute;u cơ tim hoặc tai biến mạch m&aacute;u n&atilde;o, chống b&eacute;o ph&igrave; v&agrave; c&aacute;c t&aacute;c nh&acirc;n g&acirc;y bệnh ung thư. B&ecirc;n cạnh tốt cho sức khỏe, c&aacute; thu c&ograve;n c&oacute; vị b&eacute;o thơm, dễ chế biến m&oacute;n ăn ph&ugrave; hợp ẩm thực Việt Nam.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		C&aacute; c&oacute; th&acirc;n d&agrave;i, trung b&igrave;nh khoảng 20 cm (tối đa 30 cm) một b&ecirc;n hơi hẹp lại; tiết diện của th&acirc;n hầu như tr&ograve;n.</li>
	<li style="box-sizing: inherit;">
		C&aacute; thu thịt nhiều, xương &iacute;t, l&agrave; m&oacute;n ăn ngon được cả người lớn lẫn trẻ em ưa chuộng.</li>
	<li style="box-sizing: inherit;">
		C&aacute; chế biến được nhiều m&oacute;n như nấu canh, chi&ecirc;n, kho, hấp...</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin dinh dưỡng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Chứa&nbsp;axit amin: Tryptophan; Threonine; Isoleucine; Serine; Proline...</li>
	<li style="box-sizing: inherit;">
		Chứa vitamin: Betaine; Choline; Pantothenic Acid B5; Vitamin B12; Folate; Vitamin B6; Niacin B3...</li>
	<li style="box-sizing: inherit;">
		Gi&agrave;u khoáng ch&acirc;́t: Calcium (Canxi); Sắt (Iron); Natri (Sodium); Magie (Magnesium); Phốt pho (Phosphorus); Kali (Potassium)...</li>
	<li style="box-sizing: inherit;">
		Gi&agrave;u&nbsp;ch&acirc;́t béo: B&eacute;o b&atilde;o h&ograve;a, Omega 3; Omega 6</li>
</ul>
', 65000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1055, N'Cá diêu hồng làm sạch', 1004, 1009, N'Kg', N'/img/cadieuhong.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&aacute; di&ecirc;u hồng l&agrave;m sạch được sơ chế sẵn loại bỏ phần ruột b&ecirc;n trong v&agrave; rửa sạch gi&uacute;p người nội trợ tiết kiệm thời gian trong nấu nướng. C&aacute; di&ecirc;u hồng tươi ngon phải c&oacute; phần da c&aacute; b&ecirc;n ngo&agrave;i m&agrave;u hồng nhạt, mắt c&aacute; trong, kh&ocirc;ng bị đục v&agrave; thịt ấn v&agrave;o c&oacute; độ đ&agrave;n hồi. Thịt c&aacute; di&ecirc;u hồng ngọt, mềm v&agrave; &iacute;t xương n&ecirc;n được rất nhiều người lựa chọn để bổ sung cho bữa cơm gia đ&igrave;nh.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&aacute; di&ecirc;u hồng l&agrave; một loại c&aacute; c&oacute; chất lượng thịt thơm ngon, thịt c&aacute; di&ecirc;u hồng c&oacute; m&agrave;u trắng, trong sạch, c&aacute;c thớ thịt được cấu tr&uacute;c chắc v&agrave; đặc biệt l&agrave; thịt kh&ocirc;ng qu&aacute; nhiều xương. Đặc biệt l&agrave; c&aacute; c&oacute; h&agrave;m lượng mỡ cao n&ecirc;n ăn rất b&eacute;o.</span></p>
', 73000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1056, N'Mực ống nguyên con làm sạch', 1004, 1009, N'Kg', N'/img/muc.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Mực ống nguy&ecirc;n con c&oacute; th&acirc;n thu&ocirc;n d&agrave;i h&igrave;nh ống v&agrave; v&acirc;y ngắn tập trung ở phần đu&ocirc;i. Thịt mực ống nguy&ecirc;n con dai, săn chắc v&agrave; chứa nhiều chất dinh dưỡng như vitamin B v&agrave; C. Do chất thịt ngọt sẵn n&ecirc;n người nội trợ c&oacute; thể dễ d&agrave;ng chế biến mực ống th&agrave;nh nhiều m&oacute;n ngon như hấp, chi&ecirc;n gi&ograve;n hay x&agrave;o thập cẩm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Mực ống Phan Thiết.&nbsp;</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Sản phẩm được sản xuất, kiểm so&aacute;t chất lượng &amp; ATVSTP theo ti&ecirc;u chuẩn quốc tế ISO 9001 v&agrave; HACCP.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>R&atilde; đ&ocirc;ng tự nhi&ecirc;n trước khi chế biến. Chế biến c&aacute;c m&oacute;n ăn t&ugrave;y th&iacute;ch.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;</span>Bảo quản ở &lt; - 18 độ C hoặc ngăn đ&ocirc;ng tủ lạnh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:&nbsp;</span>Kh&ocirc;ng sử dụng sản phẩm nếu dị ứng với c&aacute;c th&agrave;nh phần của sản phẩm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:</span>&nbsp;500g.</p>
', 121000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1057, N'Tôm đông lạnh Nhật Vân', 1004, 1009, N'Kg', N'/img/tom.JPG', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">T&ocirc;m đ&ocirc;ng lạnh Nhật V&acirc;n size 200-300 c&oacute; k&iacute;ch thước vừa phải ph&ugrave; hợp để nấu canh hoặc x&agrave;o c&ugrave;ng c&aacute;c loại rau. Chứa nhiều canxi, chất sắt v&agrave; chất b&eacute;o b&atilde;o h&ograve;a thấp n&ecirc;n t&ocirc;m đ&ocirc;ng lạnh Nhật V&acirc;n rất ph&ugrave; hợp cho sức khỏe tim mạch v&agrave; sự ph&aacute;t triển của cơ thể. C&aacute;c m&oacute;n ăn ngon từ t&ocirc;m m&agrave; bạn c&oacute; thể dễ d&agrave;ng chế biến tại nh&agrave; như t&ocirc;m tẩm bột chi&ecirc;n gi&ograve;n, t&ocirc;m nướng hay canh b&iacute; đao nấu với t&ocirc;m.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">T&ocirc;m 100%.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng:&nbsp;</span>Protein &gt; 17%</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>R&atilde; đ&ocirc;ng t&ocirc;m 30 ph&uacute;t cho tan đ&aacute; mềm đều ho&agrave;n to&agrave;n, sau đ&oacute; chế biến c&aacute;c m&oacute;n như: nấu lẩu, rim, chi&ecirc;n bột, ...</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:&nbsp;</span>-18 độ C hay trong ngăn đ&aacute; tủ lạnh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:&nbsp;</span>400g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất:&nbsp;</span>Cty TNHH TM-DV Nhật V&acirc;n.</p>
', 120000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1058, N'Bánh quy LU Bastogne', 1005, 1003, N'Hộp', N'/img/banhquy.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh quy LU Bastogne hộp 260g mang hương vị thơm ngon, hấp dẫn, l&agrave; m&oacute;n b&aacute;nh bổ dưỡng được nhiều người y&ecirc;u th&iacute;ch. B&aacute;nh cung cấp năng lượng cho cơ thể khi cần, th&iacute;ch hợp cho những người bận rộn, những bữa ăn nhẹ hay nh&acirc;m nhi c&ugrave;ng t&aacute;c tr&agrave; n&oacute;ng b&ecirc;n người th&acirc;n, bạn b&egrave;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bột mỳ, đường, dầu cọ, đường kẹo, siro glucose fructose, trứng, xi r&ocirc; đường kẹo, chất tạo xốp 500ii, xiro glucose, phẩm m&agrave;u tổng hợp 150a, bột quế, muối, hương liệu tổng hợp.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Cảnh b&aacute;o:</span>&nbsp;Sản phẩm c&oacute; thể chứa m&egrave;. Kh&ocirc;ng sử dụng với người mẫn cảm với c&aacute;c th&agrave;nh phần của sản phẩm.</p>
', 51000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1059, N'Bánh quy Prince kẹp socola', 1005, 1003, N'Hộp', N'/img/banhquy1.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh quy Prince kẹp socola l&agrave; sự kết hợp tuyệt vời giữa hai lớp b&aacute;nh quy gi&ograve;n tan v&agrave; nh&acirc;n s&ocirc;c&ocirc;la nguy&ecirc;n chất, cho ra loại b&aacute;nh thơm ngon, gi&agrave;u dinh dưỡng. B&aacute;nh c&oacute; sự h&ograve;a quyện giữa c&aacute;c loại ngũ cốc v&agrave; sữa trong từng miếng b&aacute;nh quy sẽ l&agrave;m bạn thực sự th&iacute;ch th&uacute; khi d&ugrave;ng chung với tr&agrave; hoặc cafe.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Ngũ cốc, đường, dầu thực vật, bột ca cao, xi r&ocirc; glucose, tinh bột m&igrave;, lactose v&agrave; protein sữa, chất tạo xốp, chất nhũ h&oacute;a, muối, sữa bột nguy&ecirc;n kem, sữa bột t&aacute;ch kem, hương socola tổng hợp&nbsp;</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Cảnh b&aacute;o:</span>&nbsp;Sản phẩm chứa l&uacute;a m&igrave;, sữa, đậu n&agrave;nh, c&oacute; thể chứa trứng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;D&ugrave;ng trực tiếp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:</span>&nbsp;80g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Bỉ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Sản xuất tại:</span>&nbsp;Mondelez Global LLC.</p>
', 14000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1060, N'Bánh xốp Quadratini', 1005, 1005, N'Hộp', N'/img/banhxop.jpg', N'<p>
	<span style="font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh xốp Quadratini Socola Loacker với vỏ b&aacute;nh gi&ograve;n xốp, vị socola đậm đ&agrave; c&ugrave;ng lớp kem b&eacute;o thơm lừng. B&aacute;nh c&oacute; vị ngọt vừa phải, ph&ugrave; hợp khẩu vị của người Việt Nam. B&aacute;nh xốp Quadratini Socola Loacker c&oacute; dạng vi&ecirc;n nhỏ, đ&oacute;ng g&oacute;i lịch sự ph&ugrave; hợp l&agrave;m qu&agrave; biếu.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(0, 0, 0); font-family: arial, sans, sans-serif; font-size: 16px;">B&aacute;nh xốp Quadratini Socola Loacker với c&ocirc;ng thức đặc biệt từ nước &Yacute;. B&aacute;nh c&oacute; vị gi&ograve;n xốp, kem sữa h&ograve;a c&ugrave;ng kem socola thơm ngon. Sản phẩm c&ograve;n được bổ sung nhiều dưỡng chất như protein, canxi, vitamin A, vitamin B1, B2, B6, B1... sẽ cung cấp năng lượng cho cơ thể trong c&aacute;c bữa ăn xế.</span></p>
', 84000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1061, N'Kẹo sôcôla sữa Pop-it', 1005, 1005, N'Hộp', N'/img/keogom.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Đường, chất b&eacute;o thực vật, bột ca cao, sữa bột, mạch nha, chất l&agrave;m b&oacute;ng, g&ocirc;m&nbsp;arabic, chất nhũ h&oacute;a, m&agrave;u thực phẩm tổng hợp, sunset yellow CFC, brilliant blue CFC, ponceau 4R, allura red AC, tartrazin, hương vani tổng hợp, hương s&ocirc; c&ocirc; la tổng hợp. Th&agrave;nh phần c&oacute; chứa sữa, lecithin.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:</span>&nbsp;Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Tr&aacute;nh nhiệt độ cao, kh&ocirc;ng tiếp x&uacute;c với &aacute;nh nắng trực tiếp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất:&nbsp;</span>C&ocirc;ng ty TNHH chế biến thực phẩm v&agrave; b&aacute;nh kẹo Phạm Nguy&ecirc;n.</p>
', 26000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1062, N'Kẹo dừa lá dứa Thanh Bình', 1005, 1003, N'Hộp', N'/img/keodua.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Nước cốt dừa 50.7%, mạch nha 26.1%, đường c&aacute;t 17.4%, l&aacute; dứa 5.8%.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>H&agrave;m lượng đường to&agrave;n phần &gt;= 40%, Độ ẩm &lt;=8% khối lượng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:</span>&nbsp;400g/Hộp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;D&ugrave;ng được ngay sau khi mở bao b&igrave;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;</span>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t v&agrave; tr&aacute;nh &aacute;nh nắng mặt trời.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Sản xuất tại:</span>&nbsp;C&ocirc;ng ty TNHH MTV SX - TM Thực phẩm, đồ uống Thanh B&igrave;nh.</p>
', 37000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1063, N'Kẹo bạc hà Tic Tac', 1005, 1003, N'Hộp', N'/img/keobacha.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Kẹo bạc h&agrave; Tic Tac hộp 14g c&oacute; hương vị bạc h&agrave; the m&aacute;t, được cả trẻ em v&agrave; người lớn y&ecirc;u th&iacute;ch. Kẹo hương vị bạc h&agrave; Tic Tac​ th&iacute;ch hợp d&ugrave;ng sau bữa ăn, nơi c&ocirc;ng sở, gi&uacute;p mang lại hơi thở thơm m&aacute;t, tự tin. Kẹo hương vị bạc h&agrave; Tic Tac được sản xuất theo c&ocirc;ng nghệ ti&ecirc;n tiến đảm bảo được chất lượng an to&agrave;n vệ sinh thực phẩm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đường, Maltodextrin, tinh bột gạo, chất l&agrave;m d&agrave;y (gồm arabic), Fructoza, c&aacute;c hương tự nhi&ecirc;n, giống tự nhi&ecirc;n v&agrave; nh&acirc;n tạo, chất chống đ&ocirc;ng v&oacute;n (magnesium stearate), chất l&agrave;m b&oacute;ng (carnauba wax).</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng trực tiếp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>C&ocirc;ng ty Ferrero India Private,&nbsp;Ấn Độ.</p>
', 12000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1064, N'Kẹo mềm Sugus hương trái cây', 1005, 1003, N'Hộp', N'/img/keomem.jpg', N'', 27000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1065, N'Bánh bông lan cupcake Solite', 1005, 1003, N'Hộp', N'/img/banhbonglan.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh b&ocirc;ng lan Solite l&agrave; sản phẩm quen thuộc với mọi gia đ&igrave;nh, ngo&agrave;i những hương vị truyền thống như: bơ sữa, l&aacute; dứa,...Nay đ&atilde; c&oacute; hương vị Capuchino ho&agrave;n to&agrave;n mới. Sự h&ograve;a quyện tuyệt vời giữa hương vị b&aacute;nh b&ocirc;ng lan truyền thống với vị c&agrave; ph&ecirc; capuchino hảo hạng, cho chiếc b&aacute;nh cupcake Solite vị capuchino thơm ngon, tr&ograve;n vị.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh b&ocirc;ng lan cupcake Solite vị capuchino mới lạ, l&agrave;m m&oacute;n b&aacute;nh thơm ngon, gi&agrave;u dinh dưỡng th&iacute;ch hợp l&agrave;m bữa điểm t&acirc;m s&aacute;ng hoặc bữa ăn nhẹ cho mọi gia đ&igrave;nh. Từ c&aacute;c th&agrave;nh phần nguy&ecirc;n liệu tự nhi&ecirc;n như: bột m&igrave;, mạch nha, trứng, dầu cọ,..B&aacute;nh l&agrave; nguồn cung cấp năng lượng, chất b&eacute;o v&agrave; canxi hiệu quả. Vị capuchino gi&uacute;p đ&aacute;nh thức mọi gi&aacute;c quan, cho bạn một khởi đầu đầy hứng khởi.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&aacute;nh b&ocirc;ng lan cupcake Solite l&agrave;m từ bột m&igrave;, trứng v&agrave; sữa tươi, tốt v&agrave; an to&agrave;n cho sức khỏe người d&ugrave;ng.</li>
	<li style="box-sizing: inherit;">
		B&aacute;nh mềm mịn, thơm ngon, cho bạn cảm gi&aacute;c th&iacute;ch th&uacute; khi thưởng thức.</li>
	<li style="box-sizing: inherit;">
		C&ocirc;ng thức mới với sự h&ograve;a quyện giữa vị cafe, bột socola c&ugrave;ng sữa ph&ocirc; mai cho chiếc b&aacute;nh th&ecirc;m đậm vị cafe, b&eacute;o tr&ograve;n vị sữa.</li>
	<li style="box-sizing: inherit;">
		H&igrave;nh dạng b&aacute;nh cupcake mới lạ đẹp mắt gi&uacute;p k&iacute;ch th&iacute;ch vị gi&aacute;c cho người d&ugrave;ng.</li>
	<li style="box-sizing: inherit;">
		B&aacute;nh th&iacute;ch hợp sử dụng trong c&aacute;c bữa tiệc, hội họp, vừa lịch sự vừa đẹp mắt.</li>
</ul>
', 50000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1066, N'Thịt bò khô xé sợi Tiến Nga', 1005, 1004, N'Hộp', N'/img/khobo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thịt b&ograve; kh&ocirc; x&eacute; sợi Tiến Nga được chế biến từ c&aacute;c gia vị sạch v&agrave; thịt b&ograve; tươi ngon với hương vị thơm ngon, cay v&agrave; đậm đ&agrave;, l&agrave; m&oacute;n ăn vặt tuyệt vời cho những cuộc hội họp với người th&acirc;n, bạn b&egrave;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thịt b&ograve; kh&ocirc; x&eacute; sợi Tiến Nga với hương vị thơm ngon đậm đ&agrave;, được sản xuất theo c&ocirc;ng nghệ hiện đại, đảm bảo vệ sinh an to&agrave;n thực phẩm, l&agrave;m từ thịt b&ograve; tươi nguy&ecirc;n chất v&agrave; c&aacute;c gia vị chọn lọc như muối, ớt...Thịt b&ograve; kh&ocirc; x&eacute; sợi Tiến Nga với vị cay đậm đ&agrave; v&agrave; vị tươi ngọt của thịt b&ograve; sẽ l&agrave; m&oacute;n ăn vặt đặc biệt được y&ecirc;u th&iacute;ch để nh&acirc;m nhi, thư gi&atilde;n c&ugrave;ng bạn b&egrave;.</span></p>
', 66000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1067, N'Khô bò sợi Tứ Xuyên', 1005, 1004, N'Kg', N'/img/khobosoi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Kh&ocirc; b&ograve; sợi Tứ Xuy&ecirc;n vẫn giữ nguy&ecirc;n gi&aacute; trị dinh dưỡng của thịt b&ograve; tươi nhưng được chế biến l&agrave;m cho kh&aacute;c lạ v&agrave; ngon hơn. Kh&ocirc; b&ograve; c&oacute; vị cay đặc trưng kết hợp với m&ugrave;i thơm của m&egrave;, gia vị đậm đ&agrave;, chinh phục mọi người ngay lần đầu ti&ecirc;n thưởng thức.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Kh&ocirc; b&ograve; sợi Tứ Xuy&ecirc;n&nbsp;được chế biến ho&agrave;n to&agrave;n từ thịt b&ograve; tươi, kh&ocirc;ng pha trộn c&aacute;c loại thịt kh&aacute;c. B&ograve; kh&ocirc; với hương vị gia truyền, ngon, sạch, bổ sung năng lượng cho cơ thể lu&ocirc;n khỏe mạnh. C&oacute; thể chế biến th&agrave;nh nhiều m&oacute;n ăn kh&aacute;c nhau, x&eacute; sợi nhỏ kết hợp với đu đủ xanh b&agrave;o sợi c&ugrave;ng lạc rang&hellip; th&agrave;nh m&oacute;n nộm b&ograve; kh&ocirc; rất hấp dẫn.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sử dụng nguồn nguy&ecirc;n liệu tươi ngon, an to&agrave;n</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc; b&ograve; sợi lớn thấm s&acirc;u gia vị sợi b&ograve; đậm đ&agrave; hơn</li>
	<li style="box-sizing: inherit;">
		Hương vị thơm ngon, hấp dẫn, k&iacute;ch th&iacute;ch vị gi&aacute;c</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng đường h&oacute;a học, kh&ocirc;ng chất bảo quản, an to&agrave;n với sức khỏe</li>
	<li style="box-sizing: inherit;">
		Th&iacute;ch hợp l&agrave;m m&oacute;n ăn vặt, khai vị, nh&acirc;m nhi khi tr&ograve; chuyện c&ugrave;ng bạn b&egrave;, du lịch, đi chơi</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Thịt b&ograve; 98%, muối, đường, tỏi, ớt, quế, đinh hương, chất điều vị, m&egrave;, m&agrave;u thực phẩm</p>
', 784000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1068, N'Cá mai mè Damex', 1005, 1003, N'Hộp', N'/img/caimaime.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span>&nbsp;C&aacute; mai kh&ocirc; 85%, m&egrave; 10%, đường c&aacute;t, muối ăn, chất điều vị E621, tỏi, ớt tươi.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>H&agrave;m lượng protein: 25% khối lượng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng ăn liền.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;</span>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:</span>&nbsp;175g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:</span>&nbsp;Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Sản xuất tại:</span>&nbsp;CS CBTP Đại Vũ.</p>
', 52000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1069, N'Ô mai mơ dây không hạt', 1005, 1003, N'Hộp', N'/img/omaimo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&Ocirc; mai mơ d&acirc;y kh&ocirc;ng hạt Việt San được sản xuất từ những tr&aacute;i mơ tươi vừa ch&iacute;n tới kết hợp với vị ngọt của đường, vị mặn của muối v&agrave; ch&uacute;t cay của gừng l&agrave;m n&ecirc;n hương vị tinh tế nhiều người y&ecirc;u th&iacute;ch. Những quả mơ sạch đ&atilde; được loại bỏ hạt, phần thịt d&agrave;y mềm dẻo, chua dịu ngọt ng&agrave;o, hậu vị đậm khiến người ta muốn ăn m&atilde;i kh&ocirc;ng th&ocirc;i.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(0, 0, 0); font-family: arial, sans, sans-serif; font-size: 16px;">Nếu ai đ&atilde; từng một lần thưởng thức vị chua ngọt dịu d&agrave;ng của những tr&aacute;i mơ kh&ocirc;ng hạt Việt San th&igrave; đều vương vấn m&atilde;i c&aacute;i vị chỉ nghĩ đến đ&atilde; khiến người ta ứa nước bọt của thức qu&agrave; n&agrave;y. Sản phẩm được l&agrave;m theo c&ocirc;ng thức đặc biệt, kh&ocirc;ng chất bảo quản, kh&ocirc;ng h&oacute;a chất độc hại, an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;"><span style="box-sizing: inherit; color: rgb(0, 0, 0); font-family: arial, sans, sans-serif;">Đặc điểm nổi bật:</span></span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; color: rgb(0, 0, 0); font-family: arial, sans, sans-serif;">&Ocirc; mai mơ d&acirc;y kh&ocirc;ng hạt Việt San được chế biến từ những tr&aacute;i mơ tươi chọn lọc với c&ocirc;ng thức ri&ecirc;ng, giữ lại vị chua đậm của tr&aacute;i mơ cộng hưởng c&ugrave;ng lớp gia vị cay mặn ngọt đầy tinh tế v&agrave; hấp dẫn.</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; color: rgb(0, 0, 0); font-family: arial, sans, sans-serif;">Sản phẩm được sản xuất theo quy tr&igrave;nh kh&eacute;p k&iacute;n, đảm bảo vệ sinh an to&agrave;n thực phẩm.</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; color: rgb(0, 0, 0); font-family: arial, sans, sans-serif;">&Ocirc; mai mơ được đ&oacute;ng hộp nhỏ gọn, tiện dụng, dễ d&agrave;ng mang theo.</span></li>
</ul>
', 24000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1070, N'Mứt quả hạnh socola', 1005, 1004, N'Hộp', N'/img/mut.jpg', N'<p>
	<span style="font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Mứt s&ocirc; c&ocirc; la quả hạnh JW Nut được chọn lọc từ những nguy&ecirc;n liệu sạch v&agrave; sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại, kh&eacute;p k&iacute;n. Sản phẩm kh&ocirc;ng chứa c&aacute;c h&oacute;a chất độc hại, tuyệt đối an to&agrave;n cho sức khỏe người sử dụng. Với hương vị thơm ngon, Mứt s&ocirc; c&ocirc; la quả hạnh JW Nut k&iacute;ch th&iacute;ch vị gi&aacute;c của bạn ngay từ lần đầu ti&ecirc;n thưởng thức. Sản phẩm ph&ugrave; hợp ăn k&egrave;m b&aacute;nh m&igrave; cho buổi s&aacute;ng tr&agrave;n năng lượng v&agrave; tiết kiệm thời gian.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Mứt s&ocirc; c&ocirc; la quả hạnh JW Nut</span><span style="font-size: 16px; box-sizing: inherit; font-family: arial, sans, sans-serif;">&nbsp;l&yacute; tưởng để ăn với b&aacute;nh mỳ hoặc l&agrave;m nh&acirc;n b&aacute;nh. Quả hạnh l&agrave; nguồn cung cấp vitamin B6 dồi d&agrave;o, đ&acirc;y l&agrave; chất cần thiết để tạo hemoglobin - một loại protein chịu tr&aacute;ch nhiệm vận chuyển oxy qua d&ograve;ng m&aacute;u đến c&aacute;c tế b&agrave;o v&agrave; l&agrave;m tăng lượng oxy trong m&aacute;u.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="color:#000000;"><span style="box-sizing: inherit; font-family: arial, sans, sans-serif;"><span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></span></span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		<span style="color:#000000;"><span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">Mứt c&oacute; vị socola b&eacute;o ngậy c&ugrave;ng vị b&ugrave;i b&ugrave;i của quả hạnh, v&ocirc; c&ugrave;ng hấp dẫn.</span></span></li>
	<li style="box-sizing: inherit;">
		<span style="color:#000000;"><span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">Mứt s&ocirc;c&ocirc;la&nbsp;</span>quả hạnh JW Nut<span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">&nbsp;l&yacute; tưởng để ăn với b&aacute;nh mỳ hoặc l&agrave;m nh&acirc;n b&aacute;nh.</span></span></li>
	<li style="box-sizing: inherit;">
		<span style="color:#000000;"><span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">Sản phẩm nhập khẩu nguy&ecirc;n hộp từ Bỉ.</span></span></li>
	<li style="box-sizing: inherit;">
		<span style="color:#000000;"><span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">Mứt s&ocirc; c&ocirc; la&nbsp;</span>quả hạnh JW Nut<span style="box-sizing: inherit; font-family: arial, sans, sans-serif;">&nbsp; được đ&oacute;ng g&oacute;i nhỏ gọn, tiện dụng, kỹ lưỡng, hợp vệ sinh, sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại của Tinh Nguy&ecirc;n, đảm bảo an to&agrave;n về chất lượng cũng như về vệ sinh an to&agrave;n thực phẩm.</span></span></li>
</ul>
', 105000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1071, N'Sữa bột nguyên kem Dutch Lady', 1006, 1008, N'Hộp', N'/img/suabot.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Dutch Lady nguy&ecirc;n kem được l&agrave;m từ nguồn sữa cao cấp với hương vị thơm ngon, được bổ sung c&aacute;c dưỡng chất cần thiết như chất đạm, canxi, vitamin B2, Choline gi&uacute;p gia đ&igrave;nh bạn lu&ocirc;n mạnh khỏe v&agrave; sống nhiều hơn mỗi ng&agrave;y.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Sữa bột nguy&ecirc;n kem, đường, hương vani tổng hợp, vitamin B6, vitamin B1, axit folic.</p>
', 150000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1072, N'Sữa bột Vinamilk Sure Diecerna', 1006, 1008, N'Hộp', N'/img/suabot1.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Sản phẩm dinh dưỡng đặc biệt Vinamilk Sure Diecerna được Viện Dinh Dưỡng Quốc Gia kiểm nghiệm l&acirc;m s&agrave;ng cho kết quả chỉ số đường huyết thấp khi sử dụng. B&ecirc;n cạnh hỗ trợ b&igrave;nh ổn đường huyết, Vinamilk Sure Diecerna c&ograve;n hỗ trợ cho hệ tim mạch, tăng cường sức đề kh&aacute;ng, giảm t&igrave;nh trạng mệt mỏi của người bệnh v&agrave; cung cấp dưỡng chất dễ ti&ecirc;u ho&aacute;, dễ hấp thu.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Bệnh nh&acirc;n đ&aacute;i th&aacute;o đường thường gặp c&aacute;c biến chứng về mắt, bệnh tim mạch, suy thận, đột quỵ... nếu kh&ocirc;ng kiểm so&aacute;t đường huyết tốt. B&ecirc;n cạnh đ&oacute;, chế độ ăn uống ki&ecirc;ng khem l&agrave;m cơ thể dễ thiếu hụt chất dinh dưỡng, thiếu năng lượng dễ dẫn đến trạng th&aacute;i mệt mỏi. V&igrave; vậy, bệnh nh&acirc;n đ&aacute;i th&aacute;o đường cần bổ sung nguồn dinh dưỡng đầy đủ, dễ ti&ecirc;u h&oacute;a, hấp thu, v&agrave; ph&ugrave; hợp để gi&uacute;p kiểm so&aacute;t đường huyết l&agrave;m giảm t&igrave;nh trạng mệt mỏi của người bệnh v&agrave; gi&uacute;p c&acirc;n bằng cuộc sống.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Vinamilk Sure Diecerna được nghi&ecirc;n cứu l&acirc;m s&agrave;ng bởi Viện Dinh Dưỡng Quốc Gia c&oacute; chỉ số đường huyết thấp GI = 27,6, gi&uacute;p kiểm so&aacute;t đường huyết, tốt cho hệ tim mạch, tăng sức đề kh&aacute;ng, giảm t&igrave;nh trạng mệt mỏi của người bệnh v&agrave; cung cấp 29 vitamin v&agrave; kho&aacute;ng chất thiết yếu.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Vinamilk Sure Diecerna c&oacute; thể d&ugrave;ng thay thế bữa ăn ch&iacute;nh hoặc để l&agrave;m bữa ăn phụ.</p>
', 610000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1073, N'Sữa bột Optimum Gold 2', 1006, 1008, N'Hộp', N'/img/suabot2.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Optimum Gold 2 với c&ocirc;ng thức dễ ti&ecirc;u h&oacute;a, l&agrave; nền tảng cho việc hấp thu c&aacute;c dưỡng chất thiết yếu cho trẻ từ 6 - 12 th&aacute;ng tuổi, hỗ trợ sự ph&aacute;t triển to&agrave;n diện c&aacute;c tố chất sức khỏe, gi&uacute;p tăng cường sức đề kh&aacute;ng, hỗ trợ sự ph&aacute;t triển n&atilde;o bộ của trẻ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Sản phẩm được sử dụng thay thế ho&agrave;n to&agrave;n hoặc một phần bữa ăn cho trẻ kh&ocirc;ng c&oacute; hoặc thiếu sữa mẹ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>sữa bột,&nbsp;maltodextrin,&nbsp;dầu thực vật (dầu đậu n&agrave;nh, dầu dừa, dầu hướng dương gi&agrave;u oleic),&nbsp;<span style="box-sizing: inherit; font-weight: bolder;">&nbsp;</span>lactoza, đạm whey (whey gi&agrave;u alpha-lactalbumin v&agrave; whey),&nbsp;chất b&eacute;o sữa,&nbsp;chất xơ h&ograve;a tan oligofructose (FOS),&nbsp;c&aacute;c kho&aacute;ng chất (kali citrat, tricalci phosphat,&nbsp;calci carbonat, natri citrat, magnesi oxyd,&nbsp;sắt sulfat, kẽm sulfat, đồng sulfat, mangan sulfat, kali iodid, natri selenit), chất nhũ h&oacute;a (lecithin đậu n&agrave;nh),&nbsp;c&aacute;c vitamin (cholin, natri ascorbat, E, PP, calci D-pantothegat, B1, B2, A, B6, acid folic, K1, biotin, D3, B12),&nbsp;ARA,&nbsp;DHA (từ dầu c&aacute; v&agrave; tảo Crypthecodinium cohnii),&nbsp;Bifidobacterium, BB-12, taurin, myo-inositol, hỗn hợp nucleotid (cytidin 5-monophosphat, dinatri unidin 5-monophosphat, adenosin 5-monophosphat, dinatri inosin 5-monophosphat, dinatri guanosin 5-monophosphat), L-Carmitin, chất chống oxy h&oacute;a (hỗn hợp tocophenol tự nhi&ecirc;n, ascorbyl palmitat), lutein. C&oacute; chứa sữa.</p>
', 187000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1074, N'Sữa bột Dielac Grow Pro 2+', 1006, 1008, N'Hộp', N'/img/suabot3.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bước sang 2 tuổi, b&eacute; năng động v&agrave; tăng trưởng rất nhanh. B&eacute; cần được cung cấp đầy đủ năng lượng v&agrave; nhu cầu dinh dưỡng để ph&aacute;t triển v&agrave; kh&aacute;m ph&aacute; thế giới xung quanh. Đ&acirc;y cũng l&agrave; giai đoạn t&iacute;ch lũy gi&uacute;p b&eacute; ph&aacute;t triển chiều cao vượt bậc l&uacute;c trưởng th&agrave;nh. Để ph&aacute;t triển tốt chiều cao trong giai đoạn n&agrave;y, h&agrave;ng ng&agrave;y b&eacute; cần được cung cấp đầy đủ c&aacute;c dưỡng chất với tỷ lệ v&agrave; h&agrave;m lượng c&acirc;n đối. Hệ dưỡng chất đột ph&aacute; Grow-Pro trong c&ocirc;ng thức Dielac 2 chứa 34 dưỡng chất bao gồm canxi, Vitamin D3, DHA, Lysin, ...cần thiết cho ph&aacute;t triển to&agrave;n diện cả n&atilde;o bộ v&agrave; thể chất, gi&uacute;p b&eacute; tăng c&acirc;n v&agrave; khỏe mạnh, đặc biệt ph&aacute;t triển tốt xương v&agrave; chiều cao của b&eacute;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="box-sizing: inherit; font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">sữa bột, maltodextrin, đường tinh luyện, chất b&eacute;o sữa, bột kem thực vật, chất xơ h&ograve;a tan oligofructose, chất b&eacute;o MCT, dầu thực vật, c&aacute;c kho&aacute;ng chất (tricalci phosphat, magnesi oxyd, sắt pyrophosphat, kẽm sulfat, mangan sulfat, đồng sulfat, kali clorid, natri selenit),&nbsp;c&aacute;c vitamin (cholin, natri ascorbat, E, PP, calci D-pantothegat, B6, B1, acid folic, B2, K1, biotin, D3, B12), hương tổng hợp d&ugrave;ng cho thực phẩm Bifidohacterium, BB-12, chất nhũ h&oacute;a (lecithin đậu n&agrave;nh), taurin, DHA từ dầu c&aacute;. C&oacute; chứa sữa.</span></p>
', 123000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1075, N'Sữa tiệt trùng Promess ít béo', 1006, 1008, N'Hộp', N'/img/suatuoi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Sữa tiệt tr&ugrave;ng Promess &iacute;t b&eacute;o hộp 1 l&iacute;t gi&uacute;p bổ sung c&aacute;c chất dinh dưỡng, vitamin, năng lượng, kho&aacute;ng chất... gi&uacute;p tăng cường sức khỏe, khả năng miễn dịch của cơ thể.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Sữa b&ograve; tươi t&aacute;ch kem b&aacute;n phần.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Thể t&iacute;ch thực :&nbsp;</span>Hộp 1 l&iacute;t.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		D&ugrave;ng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Lắc đều trước khi uống.</li>
</ul>
', 30000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1076, N'Sữa tươi tiệt trùng Dutch Lady', 1006, 1008, N'Hộp', N'/img/suatuoi1.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Sữa tươi tiệt tr&ugrave;ng Dutch Lady Organic được nhập khẩu từ H&agrave; Lan, quốc gia được biết đến l&acirc;u đời với truyền thống trong ng&agrave;nh sữa. Sản phẩm được tiệt tr&ugrave;ng ho&agrave;n to&agrave;n gi&uacute;p bảo quản sữa được l&acirc;u hơn v&agrave; an to&agrave;n cho sức khoẻ. Hương vị ho&agrave;n to&agrave;n tươi mới đồng thời cung cấp nhiều loại dưỡng chất cho cơ thể gi&uacute;p bạn khỏe mạnh từ b&ecirc;n trong v&agrave; lu&ocirc;n tươi mới mỗi ng&agrave;y.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="box-sizing: inherit; font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Sữa tươi 100%.&nbsp;</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Thể t&iacute;ch thực:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">1l&iacute;t.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:</span>&nbsp;H&agrave; Lan.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">NK &amp; PP:&nbsp;</span>Cty TNHH Friesland Campina Việt Nam.</p>
', 43000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1077, N'Sữa tiệt trùng không đường Flex', 1006, 1008, N'Hộp', N'/img/suatuoi2.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Sữa tiệt tr&ugrave;ng kh&ocirc;ng đường Flex 1 l&iacute;t gi&uacute;p bổ sung canxi v&agrave; vitamin D, &iacute;t b&eacute;o, đặc biệt kh&ocirc;ng đường, kh&ocirc;ng lactoza n&ecirc;n dễ ti&ecirc;u h&oacute;a, tốt cho hệ xương. Sản phẩm với đầy đủ th&agrave;nh phần dinh dưỡng, đảm bảo đ&aacute;p ứng tất cả c&aacute;c nhu cầu dinh dưỡng của cơ thể.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần v&agrave; c&ocirc;ng dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sữa tiệt tr&ugrave;ng kh&ocirc;ng đường Flex từ sữa tươi nguy&ecirc;n chất thơm ngon được sản xuất tr&ecirc;n d&acirc;y chuyền hiện đại ti&ecirc;n tiến.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng đường gi&uacute;p hạn chế hiện tượng s&ocirc;i bụng, dễ ti&ecirc;u h&oacute;a.</li>
	<li style="box-sizing: inherit;">
		Bổ sung th&ecirc;m Canxi &amp; Vitamin D gi&uacute;p ph&ograve;ng ngừa lo&atilde;ng xương.</li>
	<li style="box-sizing: inherit;">
		Sữa được xử l&yacute; bằng c&ocirc;ng nghệ tiệt tr&ugrave;ng UHT hiện đại, ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng chất bảo quản.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		D&ugrave;ng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Lắc đều trước khi sử dụng, ngon hơn khi uống lạnh.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Lưu &yacute;: Đậy nắp sau khi uống.</p>
', 31000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1078, N'Phô mai tươi Milk Tiger', 1006, 1008, N'Hộp', N'/img/phomai.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần</span>: Ph&ocirc; mai tươi, đường, d&acirc;u t&acirc;y(6%),oligofructose, m&agrave;u từ nước &eacute;p củ dền c&ocirc; đặc, hương d&acirc;u t&acirc;y tự nhi&ecirc;n,lactase,vitamin D. Vani: ph&ocirc; mai tươi, đường, nước,oligofructose, tinh bột biến t&iacute;nh, hương vani tự nhi&ecirc;n,lactase, vitamin D.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:</span>&nbsp;Cung cấp chất đạm, canxi v&agrave; vitamin D gi&uacute;p ph&aacute;t triển cơ v&agrave; xương chắc khỏe.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đối tượng sử dụng:</span>&nbsp;Trẻ em từ 06 th&aacute;ng tuổi trở l&ecirc;n.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	T<span style="box-sizing: inherit; font-weight: bolder;">h&ocirc;ng tin dinh dưỡng c&oacute; trong 100g:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Năng lượng: 110cal.</li>
	<li style="box-sizing: inherit;">
		Carbohydrate: 13,2g.</li>
	<li style="box-sizing: inherit;">
		Chất b&eacute;o: 2,8g.</li>
	<li style="box-sizing: inherit;">
		Vitamin D: 1,25mg.</li>
	<li style="box-sizing: inherit;">
		Canxi: 184mg.</li>
	<li style="box-sizing: inherit;">
		Chất xơ: 4,1g.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>CHLB Đức.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; ph&acirc;n phối:&nbsp;</span>C&ocirc;ng ty TNHH Zott.</p>
', 40000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1079, N'Phô mai Con Bò Cười', 1006, 1008, N'Hộp', N'/img/phomai1.JPG', N'<div style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Ph&ocirc; mai Con B&ograve; Cười l&agrave; nguồn cung cấp dưỡng chất canxi + vitamin D, bổ sung kẽm + vitamin B12 hỗ trợ sự ph&aacute;t triển thể chất. 15g ph&ocirc; mai cung cấp hơn 100mg canxi hỗ trợ gia đ&igrave;nh c&oacute; hệ xương chắc khỏe. Khuy&ecirc;n d&ugrave;ng 1-2 miếng ph&ocirc; mai Con B&ograve; Cười mỗi ng&agrave;y. Đối tượng sử dụng: trẻ em tr&ecirc;n 2 tuổi v&agrave; người trưởng th&agrave;nh.</div>
<div style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	&nbsp;</div>
<div style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Sữa gầy ho&agrave;n nguy&ecirc;n, bơ, ph&ocirc; mai, đạm sữa,chất nhũ h&oacute;a: natri polyphosphat(E452i), dinatri diphosphat(E450i), tricanxi orthophosphat, chất c&acirc;n bằng acid: acid citric(E330), muối iốt, vitamin D, kẽm gluconat, vitamin B12.</div>
<div style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	&nbsp;</div>
<div style="box-sizing: inherit; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>H&agrave;m lượng chất b&eacute;o sữa t&iacute;nh theo chất kh&ocirc; 45%-60%.</div>
', 52000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1080, N'Phô mai Vinamilk', 1006, 1008, N'Hộp', N'/img/pho-mai.JPG', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Ph&ocirc; mai Vinamilk l&agrave; loại thực phẩm c&oacute; gi&aacute; trị dinh dưỡng cao, được chế biến từ sữa nguy&ecirc;n chất giữ được trọn vẹn dưỡng chất từ thi&ecirc;n nhi&ecirc;n v&agrave; vị ngon thuần khiết của sữa. Sản phẩm l&agrave; nguồn cung cấp năng lượng, c&aacute;c chất dinh dưỡng v&agrave; vitamin cần thiết kh&ocirc;ng những cho trẻ em m&agrave; c&ograve;n cho cả người lớn. Ph&ocirc; mai Vinamilk gi&agrave;u năng lượng gi&uacute;p tăng chiều cao tối đa. Sản phẩm được đ&oacute;ng g&oacute;i tiện lợi, dễ d&agrave;ng sử dụng v&agrave; bảo quản.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;sữa tươi, chất b&eacute;o sữa, phomat(21%), nước, sữa bột, đạm sữa, chất ổn định(452i, 401, 407), chất điều chỉnh độ axit(330, 339(iii)). C&oacute; chứa sữa.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>H&agrave;m lượng chất b&eacute;o sữa t&iacute;nh theo chất kh&ocirc; 45%-60%</p>
', 28000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1082, N'Kem Monte Rico', 1006, 1008, N'Hộp', N'/img/kem.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Nước, đường, nước cốt dừa, sữa b&eacute;o, sữa thực vật, mạch nha, bột whey, chất nhũ h&oacute;a mono v&agrave; diglycerides của ax&iacute;t b&eacute;o(E471), chất ổ định: celllulose gum(E466), guar gum(E412), carrageenan(E407), hương khoai m&ocirc;n tổng hợp, m&agrave;u thực phẩm tổng hợp: Brilliant Blue(E113), Carmoisine(E122).</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:&nbsp;</span>Kh&ocirc;ng sử dụng cho người mẫn cảm với c&aacute;c th&agrave;nh phần tr&ecirc;n.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>H&agrave;m lượng chất đạm tối thiểu 1,5g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>Ăn lạnh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;&lt; -18 độ C.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Khối lượng tịnh:</span>&nbsp;270 g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:</span>&nbsp;Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất:&nbsp;</span>Cty TM Phan Nam Monte Rosa.</p>
', 23000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1083, N'Kem Vinamilk Đậu Xanh', 1006, 1008, N'Hộp', N'/img/kem1.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Kem Vinamilk Đ&acirc;̣u xanh giàu dinh dưỡng từ sữa, h&ograve;a cùng vị dịu ngọt của đ&acirc;̣u xanh. Sản ph&acirc;̉m kh&ocirc;ng chứa ch&acirc;́t bảo quản, an toàn cho sức khỏe cả gia đình.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước, đường tin luy&ecirc;̣n, mạch nha, sữa b&ocirc;̣t, ch&acirc;́t béo sữa, ch&acirc;́t béo thực v&acirc;̣t, ch&acirc;́t &ocirc;̉n định (471, 412, 466, 407), hương li&ecirc;̣u t&ocirc;̉ng hợp dùng cho thực ph&acirc;̉m, màu tự nhi&ecirc;n (160aii), ch&acirc;́t ch&ocirc;́ng oxy hóa (301). Có chứa sữa.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin dinh dưỡng:</span>&nbsp;giá trị dinh dưỡng trung bình trong 100g.</p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Năng lượng: 165,2 kcal.</li>
	<li style="box-sizing: inherit;">
		Hyđrat cacbon: 21,2.</li>
	<li style="box-sizing: inherit;">
		Ch&acirc;́t đạm: 2,1g.</li>
	<li style="box-sizing: inherit;">
		Ch&acirc;́t béo: 6,0g.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;Ăn trực ti&ecirc;́p hoặc dùng chung với bánh c&ocirc;n kem.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;Bảo quản ở nhi&ecirc;̣t đ&ocirc;̣ - 20&deg;C.</p>
', 73000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1084, N'Kem Wall''s Vanilla', 1006, 1008, N'Hộp', N'/img/kem3.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Nước, đường, Xiro socola(8,632%), dầu cọ, xiro gluco, bột sữa t&aacute;ch kem, đạm whey c&ocirc; đặc, kẹp xốp marshmallow(c&oacute; chứa SO<span style="box-sizing: inherit; font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; bottom: -0.25em;">2</span>), vụn socola sữa(c&oacute; chứa sữa,lecithin đậu n&agrave;nh), hạt đều rang nhỏ,dầu dừa, bột whey, ...</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng v&agrave; bảo quản:</span>&nbsp;sử dụng ngay sau khi mở bao b&igrave;. Bảo quản ở nhiệt độ dưới -18<span style="box-sizing: inherit; font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">0</span>C.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin cảnh b&aacute;o an to&agrave;n vệ sinh thực phẩm:</span>&nbsp;kh&ocirc;ng sử dụng cho người mẫn cảm với c&aacute;c th&agrave;nh phần tr&ecirc;n.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Th&aacute;i Lan.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; ph&acirc;n phối:</span>&nbsp;C&ocirc;ng ty TNHH Quốc Tế Unilever Việt Nam.</p>
', 97000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1085, N'Thùng 7 Up Revive', 1007, 1010, N'Thùng', N'/img/7up.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước c&oacute; gas 7 Up Revive sản xuất theo c&ocirc;ng nghệ hiệu đại, kiểu d&aacute;ng chai mới lạ c&ugrave;ng hương vị thơm ngon, c&oacute; t&aacute;c dụng b&ugrave; kho&aacute;ng, giảm mất nước, hỗ trợ cung cấp năng lượng v&agrave; thuận tiện mang theo b&ecirc;n m&igrave;nh cho mọi chuyến đi.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước b&atilde;o h&ograve;a CO2, chất điều chỉnh độ axit, tinh bột biến t&iacute;nh, đường sucrose v&agrave; detrose, chất điện giải.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Giải kh&aacute;t nhanh ch&oacute;ng, b&ugrave; nước x&oacute;a tan cảm gi&aacute;c mệt mỏi.</li>
	<li style="box-sizing: inherit;">
		Cung cấp chất kho&aacute;ng, đảm bảo năng lượng.</li>
	<li style="box-sizing: inherit;">
		Chai nhỏ gọn, tiện lợi, dễ d&agrave;ng mang theo trong c&aacute;c hoạt động ngo&agrave;i trời.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng trực tiếp, ngon hơn khi uống lạnh.</p>
', 190000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1086, N'Nước ngọt Pepsi', 1007, 1010, N'Thùng', N'/img/pepsi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước ngọt Pepsi c&oacute; th&agrave;nh phần từ c&aacute;c hương liệu thi&ecirc;n nhi&ecirc;n, được sản xuất theo qui tr&igrave;nh hiện đại, kh&eacute;p k&iacute;n. Nước c&oacute; độ gas nồng, vị ngọt thơm ngon, l&agrave; m&oacute;n thức uống kh&ocirc;ng thể thiếu trong c&aacute;c bữa ăn h&agrave;ng ng&agrave;y.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước ngọt Pepsi chai pet 1.5 l&iacute;t được xem l&agrave; thức uống được kh&aacute; nhiều bạn trẻ sử dụng. Ngo&agrave;i t&aacute;c dụng giải tỏa cơn kh&aacute;t v&agrave;o ng&agrave;y h&egrave; nắng n&oacute;ng, lao động mệt mỏi th&igrave; Pepsi c&ograve;n l&agrave; sản phẩm xuất hiện nhiều trong c&aacute;c buổi gặp mặt đối t&aacute;c, bạn b&egrave;, cho c&ocirc;ng việc, trao đổi th&ecirc;m hiệu quả hơn.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Nước ngọt Pepsi chai pet 1.5 l&iacute;t c&oacute; th&agrave;nh phần từ c&aacute;c hương liệu tự nhi&ecirc;n, an to&agrave;n, kh&ocirc;ng chứa chất g&acirc;y hại.</li>
	<li style="box-sizing: inherit;">
		Nước c&oacute; m&agrave;u sắc đen, c&oacute; gas, gi&uacute;p giải tỏa cơn kh&aacute;t nhanh, đồng thời cung cấp năng lượng cho người d&ugrave;ng.</li>
	<li style="box-sizing: inherit;">
		Nước ngọt Pepsi&nbsp; với hỗn hợp hương tự nhi&ecirc;n c&ugrave;ng chất tạo ngọt tổng hợp đem lại m&ugrave;i vị thơm ngon, sảng kho&aacute;i cho người uống.</li>
	<li style="box-sizing: inherit;">
		Dạng chai pet lớn 1,5 l&iacute;t th&iacute;ch hợp cho gia đ&igrave;nh hoặc nh&oacute;m bạn 4-6 người, thỏa th&iacute;ch uống với chi ph&iacute; tiết kiệm.</li>
	<li style="box-sizing: inherit;">
		Sản phẩm được đ&oacute;ng chai cẩn thận, th&ocirc;ng tin cần thiết, dễ bảo quản.</li>
</ul>
', 206000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1087, N'Nước ngọt Coca-Cola', 1007, 1010, N'Thùng', N'/img/coca.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước ngọt Coca Cola sleek lon 330ml (Th&ugrave;ng 24 lon) th&iacute;ch hợp cho c&aacute;c bữa party ở gia đ&igrave;nh lẫn c&ocirc;ng ty. Lon dung t&iacute;ch 330ml cho bạn thỏa th&iacute;ch uống để tăng hưng phấn v&agrave; vui vẻ trong bữa ăn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-size: 16px; box-sizing: inherit; font-family: roboto, helvetica, arial, sans-serif;">Nước ngọt c&oacute; gas Coca-Cola Sleek&nbsp;</span><span style="color: rgb(89, 89, 89); font-size: 16px; box-sizing: inherit; font-family: roboto, helvetica, arial, sans-serif;">được nhiều người y&ecirc;u th&iacute;ch&nbsp;với hương vị thơm ngon, c&ugrave;ng vị ngọt lan tỏa ngay từ khi bắt đầu thưởng thức. Coca sleek hương vị mới nhi&ecirc;u gas hơn, đem lại cảm gi&aacute;c sảng kho&aacute;i bất tận khi uống.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Nước c&oacute; hương vị coca được cả thế giới y&ecirc;u th&iacute;ch.</li>
	<li style="box-sizing: inherit;">
		D&ograve;ng coca Sleek đậm gas hơn, k&iacute;ch th&iacute;ch vị gi&aacute;c v&agrave; tạo bất ngờ ngay khi người uống thưởng thức ngụm đầu ti&ecirc;n.</li>
	<li style="box-sizing: inherit;">
		Th&ugrave;ng 24 lon tiết kiệm, dễ bảo quản v&agrave; th&iacute;ch hợp với c&aacute;c bữa tiệc gia đ&igrave;nh, c&ocirc;ng ty hoặc d&atilde; ngoại cho nh&oacute;m bạn b&egrave;.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sản phẩm kh&ocirc;ng chỉ gi&uacute;p giải tỏa cơn kh&aacute;t trong những ng&agrave;y n&oacute;ng nực m&agrave; c&ograve;n cung cấp nguồn năng lượng c&ugrave;ng h&agrave;m lượng kho&aacute;ng chất dồi d&agrave;o, cho bạn khơi lại hứng khởi.&nbsp;</li>
	<li style="box-sizing: inherit;">
		Nước với lượng gas lớn sẽ gi&uacute;p bạn xua tan mọi cảm gi&aacute;c mệt mỏi, căng thẳng.</li>
	<li style="box-sizing: inherit;">
		Coca Sleek c&oacute; vị ngọt hấp dẫn, gi&uacute;p ti&ecirc;u h&oacute;a thức ăn nhanh hơn, cho bạn dễ d&agrave;ng thưởng thức được nhiều m&oacute;n hơn trong mỗi bữa ăn.</li>
</ul>
', 204000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1088, N'Nước chanh muối 7UP', 1007, 1010, N'Thùng', N'/img/nuocchanh.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước chanh muối 7UP Revive gi&uacute;p b&ugrave; nước v&agrave; muối kho&aacute;ng để đ&aacute;nh tan cơn kh&aacute;t trong bạn, gi&uacute;p tinh thần lu&ocirc;n thoải m&aacute;i, sảng kho&aacute;i đặc biệt l&agrave; v&agrave;o những ng&agrave;y n&oacute;ng bức.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước chanh muối 7UP Revive 390ml với c&ocirc;ng thức b&ugrave; nước I-hydro, mang lại cảm gi&aacute;c sảng kho&aacute;i để khơi bừng hứng khởi, sự kết hợp hương vị thơm ngon của chanh muối c&ugrave;ng c&aacute;c vitamin cần thiết (B3, B6, B12), kho&aacute;ng chất, chất điện giải (Natri, Kali), nước c&ugrave;ng với một lượng gas vừa đủ, gi&uacute;p b&ugrave; nước v&agrave; muối kho&aacute;ng để đ&aacute;nh tan cơn kh&aacute;t trong bạn.</span></p>
', 183000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1089, N'Thùng soda Scheweppes', 1007, 1010, N'Thùng', N'/img/soda.jpg', N'<p>
	<span style="box-sizing: inherit; font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước b&atilde;o h&ograve;a CO2, chất điều chỉnh độ axit (500ii).</span></p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bảo quản nơi tho&aacute;ng m&aacute;t.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">NSX &amp; HSD:</span>&nbsp;Xem ở đ&aacute;y lon.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Quy c&aacute;ch đ&oacute;ng g&oacute;i:&nbsp;</span>1 th&ugrave;ng (24 lon x 330ml)</p>
', 137000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1090, N'Nước bổ sung ion Pocari Sweat', 1007, 1010, N'Thùng', N'/img/nuoc.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Thức uống bổ sung ion Pocari Sweat được chiết xuất từ nguồn nước kho&aacute;ng trong thi&ecirc;n nhi&ecirc;n tốt cho sức khỏe. Sản phẩm kh&ocirc;ng chứa c&aacute;c chất h&oacute;a học độc hại, đảm bảo an to&agrave;n cho sức khỏe người sử dụng. Th&agrave;nh phần c&oacute; trong nước uống c&oacute; chứa nhiều ion v&agrave; kho&aacute;ng chất, gi&uacute;p bổ sung nguồn năng lượng dồi d&agrave;o cho cơ thể. Hơn nữa, sản phẩm gi&uacute;p b&ugrave; đắp lượng nước cần thiết để duy tr&igrave; sinh lực v&agrave; mang đến cho bạn một cảm gi&aacute;c sảng kho&aacute;i ngay khi thưởng thức.&nbsp;</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần v&agrave; c&ocirc;ng dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Thức uống bổ sung ion Pocari Sweat được chiết xuất từ nguồn nước kho&aacute;ng trong thi&ecirc;n nhi&ecirc;n tốt cho sức khỏe.Thức uống bổ sung ion Pocari Sweat được chiết xuất từ nguồn nước kho&aacute;ng trong thi&ecirc;n nhi&ecirc;n tốt cho sức khỏe.</li>
	<li style="box-sizing: inherit;">
		Th&agrave;nh phần c&oacute; trong nước uống c&oacute; chứa nhiều ion v&agrave; kho&aacute;ng chất, gi&uacute;p bổ sung nguồn năng lượng dồi d&agrave;o cho cơ thể.</li>
	<li style="box-sizing: inherit;">
		Thức uống bổ sung ion Pocari Sweat gi&uacute;p b&ugrave; đắp lượng nước cần thiết để duy tr&igrave; sinh lực v&agrave; mang đến cho bạn một cảm gi&aacute;c sảng kho&aacute;i ngay khi thưởng thức.</li>
	<li style="box-sizing: inherit;">
		Sản phẩm kh&ocirc;ng chứa c&aacute;c chất h&oacute;a học độc hại, đảm bảo an to&agrave;n cho sức khỏe người sử dụng.&nbsp;</li>
</ul>
', 252000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1091, N'Nước khoáng Evian', 1007, 1010, N'Thùng', N'/img/nk.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước kho&aacute;ng Evian rất tinh khiết, được đ&oacute;ng chai ngay tại nguồn dưới quy tr&igrave;nh kiểm so&aacute;t nghi&ecirc;m ngặt của nước Ph&aacute;p. Evian c&oacute; h&agrave;m lượng kho&aacute;ng h&ograve;a tan c&acirc;n bằng, với h&agrave;m lượng kho&aacute;ng chất n&agrave;y, Evian tuyệt đối an to&agrave;n cho mọi đối tượng sử dụng, ngay cả đối với trẻ sơ sinh. Kh&ocirc;ng những vậy Evian c&ograve;n c&oacute; t&aacute;c dụng tốt cho hệ b&agrave;i tiết, gi&uacute;p ngăn ngừa bệnh sỏi thận.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(0, 0, 0); font-size: 14px; font-family: arial, helvetica, sans-serif; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(0, 0, 0); font-size: 14px; font-family: arial, helvetica, sans-serif;">&nbsp;100% nước kho&aacute;ng thi&ecirc;n nhi&ecirc;n.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-family: arial, helvetica, sans-serif;"><span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; color: rgb(0, 0, 0);"><span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span></span></span></span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-family: arial, helvetica, sans-serif;"><span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; color: rgb(0, 0, 0);">Bảo quản nước trong m&ocirc;i trường vệ sinh, kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</span></span></span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-family: arial, helvetica, sans-serif;"><span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; color: rgb(0, 0, 0);">Tr&aacute;nh &aacute;nh nắng trực tiếp để c&aacute;c kho&aacute;ng chất c&oacute; trong nước khỏi bị kết tủa, đạt hiệu quả sử dụng cao nhất.</span></span></span></li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-family: arial, helvetica, sans-serif;"><span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; color: rgb(0, 0, 0);"><span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;sử dụng ngay, ngon hơn khi d&ugrave;ng lạnh.</span></span></span></p>
', 300000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1092, N'Nước tinh khiết Aquafina', 1007, 1010, N'Thùng', N'/img/nuoctk.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước suối Aquafina sản xuất từ nguồn nước sạch, trải qua qu&aacute; tr&igrave;nh thanh lọc, kết hợp thẩm thấu ngược, tia cực t&iacute;m v&agrave; ozone khử tr&ugrave;ng... tr&ecirc;n c&ocirc;ng nghệ hiện đại v&agrave; an to&agrave;n cho sức khỏe. Nước uống c&oacute; vị ngọt tự nhi&ecirc;n, cung cấp nước v&agrave; kho&aacute;ng chất cần thiết rất tốt cho cơ thể.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">C&ocirc;ng dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		D&ugrave;ng để giải kh&aacute;t, bổ sung nước hiệu quả cho cơ thể.</li>
	<li style="box-sizing: inherit;">
		Gi&uacute;p điều chỉnh v&agrave; c&ocirc;ng bằng nhiệt độ cơ thể, tr&aacute;nh bị sốc nhiệt dễ sinh bệnh.</li>
	<li style="box-sizing: inherit;">
		Nước suối&nbsp;đảm bảo giữ độ tinh khiết cao v&agrave; chứa c&aacute;c kho&aacute;ng chất tốt cho sức khỏe.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Nước kho&aacute;ng thi&ecirc;n nhi&ecirc;n.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;D&ugrave;ng trực tiếp, ngon hơn khi uống lạnh.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:</span>&nbsp;Đ&ecirc;̉ nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Quy c&aacute;ch đ&oacute;ng g&oacute;i:</span>&nbsp;1 th&ugrave;ng ( 24 chai x 500ml)</p>
', 100000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1093, N'Nước khoáng Lavie', 1007, 1010, N'Thùng', N'/img/nklavie.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Nước kho&aacute;ng Lavie được h&igrave;nh th&agrave;nh từ qu&aacute; tr&igrave;nh chắc lọc của tự nhi&ecirc;n, l&agrave; sự kết hợp tuyệt vời giữa nguồn nước trong l&agrave;nh với 06 loại kho&aacute;ng chất thi&ecirc;n nhi&ecirc;n. Sản phẩm được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại ho&agrave;n to&agrave;n kh&eacute;p k&iacute;n dưới sự gi&aacute;m s&aacute;t chất lượng của tập đo&agrave;n Nestle Water l&agrave; tập đo&agrave;n h&agrave;ng đầu về nước uống đ&oacute;ng chai n&ecirc;n Lavie lu&ocirc;n cam kết chất lượng đảm bảo.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Nguồn kho&aacute;ng Lavie l&agrave; nguồn kho&aacute;ng tự nhiện c&oacute; h&agrave;m lượng kho&aacute;ng thấp (dưới 350mg/l), kh&ocirc;ng g&acirc;y ra c&aacute;c triệu chứng v&ocirc;i h&oacute;a hoặc sỏi thận n&ecirc;n ph&ugrave; hợp để sử dụng hằng ng&agrave;y cho tất cả mọi người, cả trẻ em v&agrave; phụ nữ đang mang thai.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		H&agrave;m lượng kho&aacute;ng nhẹ: dưới 350mg/l.</li>
	<li style="box-sizing: inherit;">
		Đa dạng về mẫu m&atilde; v&agrave; quy c&aacute;ch đ&oacute;ng chai.</li>
	<li style="box-sizing: inherit;">
		Th&iacute;ch hợp d&ugrave;ng cho: hội nghị, du lịch, nh&agrave; h&agrave;ng, qu&aacute;n ăn, karaoke...</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span>&nbsp;100% nước kho&aacute;ng thi&ecirc;n nhi&ecirc;n nguy&ecirc;n chất bao gồm c&aacute;c chất:</p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Canxi: Gi&uacute;p cho xương cứng, răng tốt v&agrave; cơ bắp chắc khỏe.</li>
	<li style="box-sizing: inherit;">
		Magi&ecirc;: Tham gia v&agrave;o nhiều phản ứng x&uacute;c t&aacute;c v&agrave; k&iacute;ch th&iacute;ch cơ thần kinh.</li>
	<li style="box-sizing: inherit;">
		Kali: Duy tr&igrave; sự c&acirc;n bằng độ pH cần thiết cho c&aacute;c phản ứng h&oacute;a học, cung cấp năng lượng cho cơ thể bạn.</li>
	<li style="box-sizing: inherit;">
		Natri: Duy tr&igrave; sự c&acirc;n bằng lượng chất lỏng của cơ thể v&agrave; tốt cho sự vận động của hệ thần kinh.</li>
	<li style="box-sizing: inherit;">
		Acid Silic: Gi&uacute;p cho hệ thần kinh vận động tốt hơn.</li>
	<li style="box-sizing: inherit;">
		Bicarbonat: Giảm độ acid trong dạ d&agrave;y.</li>
</ul>
', 105000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1095, N'Bột ăn dặm Nuti IQ', 1008, 1003, N'Hộp', N'/img/botandam.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bằng c&ocirc;ng thức dinh dưỡng đặc biệt d&agrave;nh ri&ecirc;ng cho b&eacute; từ 6 đến 24 th&aacute;ng tuổi, sản phẩm mang đến cho b&eacute; những bữa ăn đầu đời đầy đủ dưỡng chất, kết hợp những nguy&ecirc;n liệu được chọn lọc kỹ lưỡng, gi&uacute;p b&eacute; ngon miệng mỗi ng&agrave;y. Th&agrave;nh phần kh&ocirc;ng chứa chất bảo quản, an to&agrave;n cho sức khỏe của b&eacute;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;">Bột ăn dặm Nuti IQ b&ograve; khoai t&acirc;y đậu H&agrave; Lan mang đến cho b&eacute; những bữa ăn đầu đời đầy đủ dưỡng chất nhờ c&ocirc;ng thức dinh dưỡng đặc biệt. Th&agrave;nh phần l&agrave; sự kết hợp ho&agrave;n hảo của những nguy&ecirc;n liệu cao cấp v&agrave; an to&agrave;n, hỗ trợ ph&aacute;t triển to&agrave;n diện thể chất v&agrave; tr&iacute; tuệ của b&eacute;. Th&iacute;ch hợp cho b&eacute; từ 6 đến 24 th&aacute;ng tuổi.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Hương b&ograve; khoai t&acirc;y kết hợp đậu H&agrave; Lan thơm ngon.</li>
	<li style="box-sizing: inherit;">
		DHA v&agrave; Taurin hỗ trợ ph&aacute;t triển tr&iacute; n&atilde;o, gi&uacute;p b&eacute; ho&agrave;n thiện tế b&agrave;o thần kinh, tăng khả năng nhận thức v&agrave; tr&iacute; nhớ</li>
	<li style="box-sizing: inherit;">
		Lutein hỗ trợ phất triển thị gi&aacute;c.</li>
	<li style="box-sizing: inherit;">
		Probiotics gi&uacute;p tăng cường lợi khuẩn cho đường ruột, nhuận tr&agrave;ng, dễ ti&ecirc;u h&oacute;a v&agrave; hấp thu.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng chứa chất bảo quản, tuyệt đối an to&agrave;n cho sức khỏe của b&eacute;.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Đạm, chất b&eacute;o, DHA, chất xơ, taurin, lutein, nh&oacute;m Vitamin, kho&aacute;ng chất...</p>
', 59000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1096, N'Bột ăn dặm gà hầm', 1008, 1003, N'Hộp', N'/img/botandamga.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bột ăn dặm g&agrave; hầm v&agrave; c&agrave; rốt Cerelac l&agrave; sản phẩm gi&agrave;u dinh dưỡng với phức hợp gi&agrave;u sắt, Omega 3, 12 loại Vitamin v&agrave; kho&aacute;ng chất gi&uacute;p b&eacute; năng động hơn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nestl&eacute; CERELAC G&agrave; hầm c&agrave; rốt l&agrave; thức ăn dặm gi&agrave;u dinh dưỡng, đặc biệt thơm ngon cho b&eacute;. Sản phẩm c&oacute; độ th&ocirc; gi&uacute;p em tập nhai, bổ sung lợi khuẩn tăng sức đề kh&aacute;ng cho b&eacute; v&agrave; được l&agrave;m từ nguy&ecirc;n liệu tự nhi&ecirc;n, dễ ti&ecirc;u h&oacute;a.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="box-sizing: inherit; font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Bột gạo, bột đậu n&agrave;nh, đường Sucrose, bột thịt g&agrave;, c&agrave; rốt, Maltodextrin, dầu cọ, sữa bột t&aacute;ch b&eacute;o, c&aacute;c Vitamin v&agrave; kho&aacute;ng chất.</span></p>
', 72000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1097, N'Bánh ăn kiêng Gullon', 1008, 1003, N'Hộp', N'/img/botankieng.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh ăn ki&ecirc;ng Gullon nhiều chất xơ, kh&ocirc;ng đường được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, cung cấp lượng lớn chất xơ c&ugrave;ng c&aacute;c dưỡng chất thiết yếu kh&aacute;c, cho bạn nguồn năng lượng dồi d&agrave;o để tham gia c&aacute;c hoạt động trong ng&agrave;y.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&aacute;nh ăn ki&ecirc;ng Gullon nhiều chất xơ, kh&ocirc;ng đường l&agrave; một thương hiệu đến từ T&acirc;y Ban Nha, b&aacute;nh ăn ki&ecirc;ng Gull&oacute;n kh&ocirc;ng đường nhiều chất xơ 170g dưới đ&acirc;y được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại. Được l&agrave;m từ những nguy&ecirc;n liệu cao cấp, tuyển chọn kĩ lưỡng, kh&ocirc;ng chứa chất độc hại, an to&agrave;n cho người sử dụng.</span></p>
', 62000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1098, N'Bình sữa Pigeon', 1008, 1003, N'Cái', N'/img/bínhsua.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần cấu tạo:&nbsp;</span>Nắp đậy, nắp vặn, n&uacute;m v&uacute;, b&igrave;nh</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Vật liệu:&nbsp;</span>Polypropylene (PP), silicone</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Dung t&iacute;ch:</span>&nbsp;120 ml.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&igrave;nh sữa 120ml d&agrave;nh cho trẻ từ 0 đến 3 th&aacute;ng tuổi trở l&ecirc;n.&nbsp;</li>
	<li style="box-sizing: inherit;">
		B&igrave;nh sữa được l&agrave;m từ chất liệu nhựa an to&agrave;n Polypropylene (PP), kh&ocirc;ng chứa BPA. Chịu được nhiệt độ cao trong qu&aacute; tr&igrave;nh tiệt tr&ugrave;ng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Vệ sinh:</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Rửa sạch v&agrave; tiệt tr&ugrave;ng b&igrave;nh sữa, n&uacute;m v&uacute; trước khi cho trẻ b&uacute;. Lu&ocirc;n vệ sinh b&igrave;nh ngay sau mỗi lần sử dụng. C&oacute; thể rửa b&igrave;nh v&agrave; n&uacute;m v&uacute; bằng dung dịch s&uacute;c rửa, đun s&ocirc;i 3-5 ph&uacute;t hay tiệt tr&ugrave;ng bằng l&ograve; vi s&oacute;ng.&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:</span>&nbsp;Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin cảnh b&aacute;o:</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Kh&ocirc;ng cho trẻ b&uacute; b&igrave;nh khi kh&ocirc;ng c&oacute; sự gi&aacute;m s&aacute;t của người lớn. Kiểm tra kỹ trước v&agrave; sau khi sử dụng. Loại bỏ ngay n&uacute;m v&uacute; nếu bị r&aacute;ch, hư hỏng hoặc thủng do trẻ cắn, kh&ocirc;ng cho trẻ ngậm n&uacute;m v&uacute; giả d&ugrave;ng với b&igrave;nh sữa.</p>
', 55000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1099, N'Bình tập ăn Pigeon', 1008, 1003, N'Cái', N'/img/binhtapan.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Polypropylene: B&igrave;nh, muỗng, nắp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Dung t&iacute;ch:</span>&nbsp;120 ml.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&igrave;nh c&oacute; muỗng với r&atilde;nh ở c&aacute;n d&ugrave;ng đ&uacute;t bột hoặc thức ăn đặc cho trẻ, khi d&ugrave;ng chỉ đơn giản b&oacute;p nhẹ v&agrave;o th&acirc;n b&igrave;nh.</li>
	<li style="box-sizing: inherit;">
		Gi&uacute;p qu&aacute; tr&igrave;nh cho b&eacute; ăn dễ d&agrave;ng v&agrave; nhẹ nh&agrave;ng hơn.</li>
	<li style="box-sizing: inherit;">
		B&igrave;nh c&oacute; vạch chia gi&uacute;p mẹ dễ d&agrave;ng đo lượng thức ăn v&agrave; đồ uống cho b&eacute;.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<em style="box-sizing: inherit;">Tặng k&egrave;m dụng cụ s&uacute;c rửa muỗng.</em></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Rửa sạch bằng dung dịch s&uacute;c rửa Pigeon.</li>
	<li style="box-sizing: inherit;">
		N&ecirc;n tiệt tr&ugrave;ng trước khi sử dụng.</li>
	<li style="box-sizing: inherit;">
		D&ugrave;ng c&acirc;y s&uacute;c để l&agrave;m sạch ph&iacute;a trong muỗng.</li>
	<li style="box-sizing: inherit;">
		Bảo quản sản phẩm nơi kh&ocirc; tho&aacute;ng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng tin cảnh b&aacute;o an to&agrave;n:&nbsp;</span>Kh&ocirc;ng để gần lửa.</p>
', 71000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1100, N'Bình sữa Wesser', 1008, 1003, N'Cái', N'/img/binhsua1.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&igrave;nh sữa Wesser c&oacute; ống h&uacute;t 260ml với ống h&uacute;t silicone an to&agrave;n , thuận tiện cho b&eacute; b&uacute; m&uacute;t ở mọi tư thế. B&igrave;nh dung t&iacute;ch lớn, th&iacute;ch hợp cho b&eacute; sau 1 tuổi sử dụng. B&igrave;nh c&oacute; tay cầm gi&uacute;p b&eacute; tập cầm nắm, c&ugrave;ng c&ocirc;ng nghệ nano c&oacute; t&iacute;nh kh&aacute;ng khuẩn cao nhờ c&aacute;c ph&acirc;n tử bạc gi&uacute;p ngăn ngừa hầu hết c&aacute;c loại vi khuẩn g&acirc;y bệnh.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đặc t&iacute;nh sản phẩm:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		M&agrave;u v&agrave;ng l&agrave; m&agrave;u tự nhi&ecirc;n v&agrave; đặc trưng của c&ocirc;ng nghệ Nano Silver.</li>
	<li style="box-sizing: inherit;">
		B&igrave;nh sữa Wesser&nbsp; được sản xuất theo c&ocirc;ng nghệ Nano Silver l&agrave; c&ocirc;ng nghệ hiện đại nhất, c&oacute; t&iacute;nh kh&aacute;ng khuẩn cao nhờ c&aacute;c ph&acirc;n tử bạc gi&uacute;p ngăn ngừa hầu hết c&aacute;c loại vi khuẩn g&acirc;y bệnh.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Ưu điểm vượt trội:&nbsp;</span>B&igrave;nh sữa Wesser c&ocirc;ng nghệ Nano Silver gi&uacute;p kh&aacute;ng khuẩn, ngăn ngừa m&ugrave;i h&ocirc;i, chống đầy hơi, bảo qản sữa thơm ngon l&acirc;u hơn.</p>
', 179000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1101, N'Hộp búp bê VN', 1008, 1004, N'Hộp', N'/img/bupbe.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi Hộp b&uacute;p b&ecirc; VN.010102008 l&agrave; bộ đồ chơi th&iacute;ch hợp với c&aacute;c b&eacute; g&aacute;i. Thiết kế theo th&oacute;i quen sinh hoạt h&agrave;ng ng&agrave;y của b&eacute;, gi&uacute;p b&eacute; th&iacute;ch th&uacute; khi tự m&igrave;nh chăm s&oacute;c cho b&uacute;p b&ecirc;, tập cho b&uacute;p b&ecirc; đi xe đạp.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi Hộp b&uacute;p b&ecirc; VN.010102008 - B&eacute; đi c&ocirc;ng vi&ecirc;n gồm 1 b&uacute;p b&ecirc;, 1 xe đạp v&agrave; 3 chiếc &aacute;o đầm. B&eacute; thỏa th&iacute;ch vui chơi, tập l&agrave;m người lớn với c&aacute;c hoạt động quen thuộc m&agrave; ba mẹ thường gi&uacute;p b&eacute;: thay quần &aacute;o, tập b&eacute; đi xe đạp, dạo chơi c&ocirc;ng vi&ecirc;n. Sản phẩm th&iacute;ch hợp l&agrave;m qu&agrave; tặng.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sản xuất theo c&ocirc;ng nghệ hiện đại, đạt c&aacute;c ti&ecirc;u chuẩn về an to&agrave;n v&agrave; th&acirc;n thiện với m&ocirc;i trường.</li>
	<li style="box-sizing: inherit;">
		Chất liệu cao cấp, kh&ocirc;ng b&aacute;m bẩn, b&aacute;m m&agrave;u, c&oacute; thể vệ sinh dễ d&agrave;ng.</li>
	<li style="box-sizing: inherit;">
		Gi&uacute;p b&eacute; quan s&aacute;t, r&egrave;n luyện nhiều kĩ năng, biết tư duy logic sắp xếp đồ vật v&agrave; c&ocirc;ng việc hợp l&iacute;.</li>
</ul>
', 43000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1102, N'Lục lạc banh tròn lớn', 1008, 1004, N'Cái', N'/img/luclac.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi lục lạc banh tr&ograve;n lớn VN03 thiết kế h&igrave;nh quả b&oacute;ng nhỏ nhắn theo kiểu lồng chụp, gi&uacute;p b&eacute; dễ d&agrave;ng cầm nắm. B&ecirc;n trong l&agrave; những lục lạc nhỏ, ch&uacute;ng sẽ ph&aacute;t ra &acirc;m thanh rất vui tai khi b&eacute; cầm lắc nhẹ nh&agrave;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi lục lạc banh tr&ograve;n lớn VN03 gi&uacute;p b&eacute; tiếp x&uacute;c với đồ chơi từ những năm đầu đời. Sản phẩm xinh xắn với m&agrave;u hồng phối v&agrave;ng nổi bật thu h&uacute;t sự ch&uacute; &yacute; của trẻ. Đặc biệt, &acirc;m thanh vang ra từ chiếc lục lạc sẽ gi&uacute;p b&eacute; th&iacute;ch th&uacute; chơi c&ugrave;ng.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Chất liệu nhựa v&agrave; kim loại cao cấp, kh&ocirc;ng chứa chất g&acirc;y hại cho sức khỏe của b&eacute;.</li>
	<li style="box-sizing: inherit;">
		&Acirc;m thanh vui nhộn, k&iacute;ch th&iacute;ch b&eacute; ph&aacute;t triển mọi gi&aacute;c quan, đặc biệt l&agrave; th&iacute;nh gi&aacute;c v&agrave; thị gi&aacute;c.</li>
	<li style="box-sizing: inherit;">
		Thiết kế nhỏ gọn, vừa vặn với b&agrave;n tay b&eacute;.&nbsp;</li>
	<li style="box-sizing: inherit;">
		M&agrave;u sắc tươi tắn, ph&ugrave; hợp với trẻ con.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>nhựa, kim loại.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số kĩ thuật:&nbsp;</span>kh&ocirc;ng d&ugrave;ng pin.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng tay lắc nhẹ để lục lạc ph&aacute;t ra &acirc;m thanh.</p>
', 21000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1103, N'Đồ chơi Kèn nhựa', 1008, 1004, N'Cái', N'/img/ken.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi K&egrave;n nhựa m&ocirc; phỏng theo h&igrave;nh dạng k&egrave;n t&acirc;y, ph&aacute;t ra &acirc;m thanh thu h&uacute;t sự ch&uacute; &yacute; của trẻ. Sản phẩm gi&uacute;p b&eacute; l&agrave;m quen với 1 loại nhạc cụ, b&eacute; tập thổi hơi, cầm nắm vật v&agrave; ph&acirc;n biệt được m&agrave;u sắc.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi K&egrave;n nhựa được l&agrave;m từ nhựa PP, mềm, kh&ocirc;ng g&acirc;y hại cho sức khỏe của trẻ. Sản phẩm được phối m&agrave;u ở ba phần của c&acirc;y k&egrave;n: phần loa, phần th&acirc;n v&agrave; phần thổi hơi. B&eacute; sử dụng dễ d&agrave;ng bằng c&aacute;ch thổi mạnh, k&egrave;n sẽ ph&aacute;t ra &acirc;m thanh.&nbsp;</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Thiết kế theo h&igrave;nh dạng của loại nhạc cụ k&egrave;n t&acirc;y với m&agrave;u sắc tươi tắn ph&ugrave; hợp với trẻ.</li>
	<li style="box-sizing: inherit;">
		Chất liệu đạt chuẩn an to&agrave;n cho trẻ.</li>
	<li style="box-sizing: inherit;">
		Gi&uacute;p b&eacute; l&agrave;m quen v&agrave; học c&aacute;ch thổi hơi, cầm nắm vật v&agrave; điều khiển theo &yacute; muốn.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>nhựa LD, PP, bột m&agrave;u.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Cảnh b&aacute;o:&nbsp;</span>D&ugrave;ng cho trẻ em tr&ecirc;n 3 tuổi.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		B&eacute; chơi trực tiếp bằng c&aacute;ch cầm v&agrave; d&ugrave;ng miệng để thổi k&egrave;n.</li>
	<li style="box-sizing: inherit;">
		Vệ sinh sạch sẽ trước v&agrave; sau khi b&eacute; chơi.</li>
</ul>
', 17000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1104, N'Bé học ghép vần HappyTime', 1008, 1004, N'Hộp', N'/img/ghepvan.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&eacute; học gh&eacute;p vần - Thẳng ngay từ vạch xuất ph&aacute;t. L&agrave;m thế n&agrave;o để cha mẹ gi&uacute;p b&eacute; tiếp thu v&agrave; học gh&eacute;p vần một c&aacute;ch nhanh ch&oacute;ng, dễ d&agrave;ng, hiệu quả? Sản phẩm B&eacute; học gh&eacute;p vần chắc chắn sẽ l&agrave; một sự lựa chọn tốt nhất cho c&aacute;c bậc phụ huynh.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Sản phẩm gi&uacute;p b&eacute; nhận biết chữ c&aacute;i, ph&acirc;n biệt đ&acirc;u l&agrave; chữ hoa, đ&acirc;u l&agrave; chữ thường. Từ đ&oacute;, b&eacute; bắt đầu tập r&aacute;p v&agrave; đ&aacute;nh vần. Với những h&igrave;nh ảnh minh họa sống động, gần gũi, sẽ gi&uacute;p b&eacute; nhanh tr&iacute;, linh hoạt hơn khi t&igrave;m c&aacute;c miếng gh&eacute;p, r&aacute;p lại để th&agrave;nh một chữ c&aacute;i ho&agrave;n chỉnh.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn tr&ograve; chơi:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Đưa c&aacute;c b&eacute; quan s&aacute;t từng bức tranh, sau đ&oacute; th&aacute;o rời, trộn lẫn c&aacute;c mảnh gh&eacute;p chữ c&aacute;i lại với nhau, b&agrave;y ra mặt b&agrave;n để b&eacute; quan s&aacute;t.</li>
	<li style="box-sizing: inherit;">
		B&eacute; bắt đầu t&igrave;m những chữ c&aacute;i ph&ugrave; hợp v&agrave; gh&eacute;p ch&uacute;ng lại với nhau, tạo th&agrave;nh từ đ&uacute;ng với từ c&oacute; trong bức tranh.</li>
	<li style="box-sizing: inherit;">
		Cha mẹ c&oacute; thể đưa ra c&aacute;c h&igrave;nh ảnh, t&ecirc;n c&aacute;c hiện tượng, sự vật gần gũi trong đời sống để b&eacute; c&oacute; cơ hội luyện tập nhiều hơn. Ngo&agrave;i ra, với bảng chữ c&aacute;i n&agrave;y b&eacute; c&oacute; thể tự m&igrave;nh gh&eacute;p được nhiều từ m&agrave; b&eacute; y&ecirc;u th&iacute;ch.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Việt Nam.</p>
', 92000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1105, N'Đồ chơi hộp chút chít thú', 1008, 1004, N'Hộp', N'/img/dochoi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đồ chơi hộp ch&uacute;t ch&iacute;t th&uacute; L20-4 với ch&uacute; ngựa pony gi&uacute;p b&eacute; ph&aacute;t huy tối đa tr&iacute; tưởng tượng, mang lại niềm vui v&agrave; sự th&iacute;ch th&uacute; với c&aacute;c nh&acirc;n vật hoạt h&igrave;nh gần gũi. Những phụ kiện đ&iacute;nh k&egrave;m gi&uacute;p b&eacute; c&oacute; những giờ chơi vui vẻ, r&egrave;n luyện nhiều kĩ năng v&agrave; ph&aacute;t triển tư duy.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-size: 14px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif;">Đồ chơi hộp ch&uacute;t ch&iacute;t th&uacute; L20-4 gồm 2 ch&uacute; ngựa pony xinh xắn với 2 m&agrave;u hồng, xanh dễ thương. Ngựa c&oacute; m&aacute;i t&oacute;c d&agrave;i &oacute;ng &aacute;nh m&agrave;u v&agrave;ng. Ngựa c&ograve;n ph&aacute;t ra &acirc;m thanh khi b&eacute; b&oacute;p mạnh v&agrave;o th&acirc;n. C&aacute;c b&eacute; g&aacute;i sẽ rất th&iacute;ch th&uacute; khi nhận được m&oacute;n đồ chơi n&agrave;y.&nbsp;</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-size: 14px;">&nbsp;&nbsp;</span><span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-size: 14px;">Thiết kế tinh xảo, s&aacute;ng tạo, gi&uacute;p b&eacute; c&oacute; những tr&ograve; chơi bổ &iacute;ch.</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-size: 14px;">M&agrave;u sắc h&agrave;i h&ograve;a, tươi tắn ph&ugrave; hợp với lứa tuổi của b&eacute;.</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-size: 14px;">Chất liệu nhựa cao cấp, đạt chuẩn an to&agrave;n cho sức khỏe của b&eacute;.</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-size: 14px;">Gi&uacute;p b&eacute; r&egrave;n luyện đ&ocirc;i tay khỏe mạnh, dẻo dai.&nbsp;</span></li>
	<li style="box-sizing: inherit;">
		<span style="box-sizing: inherit; font-size: 14px;">Ph&aacute;t triển tư duy quan s&aacute;t, nhận dạng v&agrave; ph&acirc;n biệt được m&agrave;u sắc, h&igrave;nh d&aacute;ng.</span></li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>nhựa PP.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-size: 14px;"><span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số kỹ thuật:&nbsp;</span>kh&ocirc;ng d&ugrave;ng pin.</span></p>
', 143000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1106, N'Gối hình con chó', 1008, 1004, N'Cái', N'/img/goi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Gối h&igrave;nh con ch&oacute; 35cm x 50cm l&agrave;m theo m&ocirc; h&igrave;nh ch&uacute; c&uacute;n xinh xắn, dễ thương. Sản phẩm l&agrave; chiếc gối đa năng, b&eacute; c&oacute; thể d&ugrave;ng để k&ecirc; đầu, d&ugrave;ng để &ocirc;m v&agrave; c&oacute; thể chơi c&ugrave;ng c&uacute;n b&ocirc;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Gối h&igrave;nh con ch&oacute; 35cm x 50cm c&oacute; chất liệu vải v&agrave; b&ocirc;ng mềm mại, kh&ocirc;ng g&acirc;y hại cho b&eacute; khi sử dụng. Gối được thiết kế với h&igrave;nh ch&uacute; c&uacute;n nhiều m&agrave;u sắc tr&ocirc;ng rất tinh nghịch v&agrave; đ&aacute;ng y&ecirc;u. Gối l&agrave; m&oacute;n qu&agrave; y&ecirc;u th&iacute;ch của c&aacute;c bạn nhỏ.</span></p>
<p>
	&nbsp;</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Thiết kế th&ocirc;ng minh, tiện dụng với nhiều chức năng kh&aacute;c nhau</li>
	<li style="box-sizing: inherit;">
		Đường chỉ may bền chắc, tinh xảo</li>
	<li style="box-sizing: inherit;">
		Chất liệu cao cấp, &ecirc;m &aacute;i, cho b&eacute; giấc ngủ ngon</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng chứa chất g&acirc;y hại cho sức khỏe người d&ugrave;ng</li>
	<li style="box-sizing: inherit;">
		Đa dạng về m&agrave;u sắc v&agrave; kiểu d&aacute;ng</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Vải, b&ocirc;ng tự nhi&ecirc;n.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">K&iacute;ch thước:&nbsp;</span>35cm x 50cm</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng n&ecirc;n sử dụng bột giặt c&oacute; chất tẩy</li>
	<li style="box-sizing: inherit;">
		Giặt ở nhiệt độ tối đa 30<span style="box-sizing: inherit; font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">oC&nbsp;</span></li>
	<li style="box-sizing: inherit;">
		Giặt bằng m&aacute;y hoặc bằng tay</li>
	<li style="box-sizing: inherit;">
		Sản phẩm kh&ocirc;ng n&ecirc;n sấy kh&ocirc;</li>
</ul>
', 214000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1107, N'Màu mắt Comsia số 6', 1009, 1005, N'Hộp', N'/img/maumat.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;D&ugrave;ng cọ để phủ v&agrave; t&aacute;n m&agrave;u l&ecirc;n bầu mắt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:&nbsp;</span>D&ugrave;ng trang điểm mắt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>K&eacute;o h&igrave;nh mũi t&ecirc;n tr&ecirc;n nh&atilde;n g&ocirc;́c để xem mục &ldquo;Ingredients&rdquo;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li style="box-sizing: inherit;">
		Tr&aacute;nh &aacute;nh nắng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Sử dụng ngo&agrave;i da.</li>
	<li style="box-sizing: inherit;">
		Để xa tầm tay trẻ em.</li>
	<li style="box-sizing: inherit;">
		Đậy nắp k&iacute;n sau khi sử dụng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nước sản xuất:</span>&nbsp;Ph&aacute;p.</p>
', 27000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1108, N'Phấn Cosmia tạo khối', 1009, 1005, N'Hộp', N'/img/phan.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Phấn Cosmia tạo khối số 2 hộp 9g với chất phấn mịn m&agrave;ng, cấu tạo từ những hạt phấn li ti gi&uacute;p dễ d&agrave;ng b&aacute;m v&agrave;o l&agrave;n da của bạn. Sản phẩm gi&uacute;p khu&ocirc;n mặt của bạn trở n&ecirc;n thon gọn, nhỏ nhắn hơn, tạo được hiệu quả tốt hơn sau khi trang điểm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">D&ugrave;ng cọ lấy phấn sau đ&oacute; t&aacute;n phấn đều l&ecirc;n to&agrave;n bộ khu&ocirc;n mặt theo chuyển động xoay tr&ograve;n.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:&nbsp;</span>Gi&uacute;p l&agrave;m mịn v&agrave; che khuyết điểm cho da.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span>&nbsp;Talc, Mica, Ethylhexyl Palmitate, Magnesium Stearate, Caprylic/capric Triglyceride, Bisdiglyceryl Polyaciladipate-1, Phenoxyethanol, Caprylyl Glycol, Benzyl Alcohol, Hexylene Glycol, Synthetic Fluorphlogopite, Dehydroacetic Acid, Tin Oxide, +/- : Ci 77491, Ci 77492, Ci 77499, Ci 7789.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sử dụng ngo&agrave;i da.</li>
	<li style="box-sizing: inherit;">
		Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li style="box-sizing: inherit;">
		Tr&aacute;nh &aacute;nh nắng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Để xa tầm tay trẻ em.</li>
	<li style="box-sizing: inherit;">
		Đậy nắp k&iacute;n sau khi sử dụng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nước sản xuất:&nbsp;</span>Ph&aacute;p.</p>
', 85000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1109, N'Phấn nén Cosmia', 1009, 1005, N'Hộp', N'/img/phannen.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Phấn n&eacute;n Cosmia m&agrave;u số 5 hộp 9g với chất phấn mềm mịn, cấu tạo hạt phấn li ti gi&uacute;p tăng độ b&aacute;m tr&ecirc;n da, đồng thời, che phủ tốt c&aacute;c khuyết điểm v&agrave; l&agrave;m s&aacute;ng da, cho bạn một lớp nền mịn m&agrave;ng, tự nhi&ecirc;n.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">D&ugrave;ng cọ lấy phấn sau đ&oacute; t&aacute;n phấn đều l&ecirc;n to&agrave;n bộ khu&ocirc;n mặt theo chuyển động xoay tr&ograve;n.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:&nbsp;</span>Gi&uacute;p l&agrave;m mịn v&agrave; che khuyết điểm cho da.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Talc, Mica, Nylon-12, Synthetic Fluorphlogopite, Magnesium Stearate, Caprylic/capric Triglyceride, Ethylhexyl Palmitate, Bisdiglyceryl Polyacyladipate-1, Phenoxyethanol, Caprylyl Glycol, Benzyl Alcohol, Dimethicone, Hexylene Glycol, Silica, Dehydroacetic Acid, +/- : Ci 77007, Ci 77491, Ci 77492, Ci 7749.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sử dụng ngo&agrave;i da.</li>
	<li style="box-sizing: inherit;">
		Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li style="box-sizing: inherit;">
		Tr&aacute;nh &aacute;nh nắng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Để xa tầm tay trẻ em.</li>
	<li style="box-sizing: inherit;">
		Đậy nắp k&iacute;n sau khi sử dụng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nước sản xuất:</span>&nbsp;Ph&aacute;p.</p>
', 85000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1110, N'Hộp 8 màu mắt Cosmia', 1009, 1005, N'Hộp', N'/img/8maumat.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng cọ để phủ v&agrave; t&aacute;n m&agrave;u l&ecirc;n bầu mắt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:&nbsp;</span>D&ugrave;ng trang điểm mắt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	&nbsp; &nbsp; &nbsp; &nbsp;Dưới đ&acirc;y l&agrave; c&aacute;c th&agrave;nh phần c&oacute; trong sản phẩm&nbsp;Hộp 8 m&agrave;u mắt Cosmia số 1:</p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Talc, Mica, Magnesium Stearate, Dimethicone, Ethylhexyl Palmitate, Polyisobutene, Synthetic Wax, Phenoxyethanol, Ethylhexylglycerin, Paraffinum Liquidum, Tin Oxide, +/- : Ci 77019, Ci 77491, Ci 77492, Ci 77499, Ci 77266 Nano, Ci 77742, Ci 77891.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li style="box-sizing: inherit;">
		Tr&aacute;nh &aacute;nh nắng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Sử dụng ngo&agrave;i da.&nbsp;</li>
	<li style="box-sizing: inherit;">
		Để xa tầm tay trẻ em.&nbsp;</li>
	<li style="box-sizing: inherit;">
		Đậy nắp k&iacute;n sau khi sử dụng.</li>
</ul>
', 135000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1111, N'Phấn phủ kềm dầu Cosmia', 1009, 1005, N'Hộp', N'/img/phanphu.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Phấn phủ kềm dầu Cosmia hộp 7g với chất phấn mềm mịn, cấu tạo hạt phấn li ti gi&uacute;p tăng độ b&aacute;m tr&ecirc;n da, đồng thời, che phủ tốt c&aacute;c khuyết điểm v&agrave; l&agrave;m s&aacute;ng da, cho bạn một lớp nền mịn m&agrave;ng, tự nhi&ecirc;n.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;D&ugrave;ng cọ lấy phấn sau đ&oacute; t&aacute;n phấn đều l&ecirc;n to&agrave;n bộ khu&ocirc;n mặt theo chuyển động xoay tr&ograve;n.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:</span>&nbsp;Gi&uacute;p l&agrave;m mịn v&agrave; che khuyết điểm cho da.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Talc, Magnesium Stearate, Ci 77491, Ci 77492, Ci 77499</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute;:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Sử dụng ngo&agrave;i da.</li>
	<li style="box-sizing: inherit;">
		Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</li>
	<li style="box-sizing: inherit;">
		Tr&aacute;nh &aacute;nh nắng trực tiếp.</li>
	<li style="box-sizing: inherit;">
		Để xa tầm tay trẻ em.</li>
	<li style="box-sizing: inherit;">
		Đậy nắp k&iacute;n sau khi sử dụng.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nước sản xuất:</span>&nbsp;Ph&aacute;p.</p>
', 93000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1112, N'Dầu ăn Marvela chai 2 lít', 1010, 1010, N'Chai', N'/img/dauan2.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dầu ăn Marvela chai 2 l&iacute;t với c&ocirc;ng thức đặc biệt bổ sung vi chất dinh dưỡng tốt cho sức khỏe v&agrave; mang lại bữa ăn thơm ngon cho gia đ&igrave;nh bạn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Marvela A &amp; D - Dầu ăn tuyệt hả, m&oacute;n ăn tuyệt vời.</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Bổ sung vitamin A v&agrave; vitamin D3.</li>
	<li style="box-sizing: inherit;">
		Th&agrave;nh phần dưỡng chất Omega 3, 6, 9 từ dầu đậu n&agrave;nh gi&uacute;p giảm Cholesterol trong m&aacute;u, ngăn ngừa c&aacute;c bệnh tim mạch.</li>
	<li style="box-sizing: inherit;">
		C&ocirc;ng nghệ sản xuất hiện đại.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Dầu đậu n&agrave;nh, dầu Olein, Vitamin A, Vitamin D3.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Chỉ số Iod (IV), pp Wijs: 60 tối thiểu.</li>
	<li style="box-sizing: inherit;">
		H&agrave;m lượng acid b&eacute;o tự do (FFA): % 0.15 tối đa.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng sử dụng chất bảo quản v&agrave; chất tạo m&agrave;u.</li>
</ul>
', 68000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1113, N'Dầu thực vật cao cấp', 1010, 1010, N'Chai', N'/img/dauthucvat.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dầu thực vật cao cấp Marvela chứa vitamin A &amp; D3 chai 1 l&iacute;t c&oacute; th&agrave;nh phần ch&iacute;nh từ 100% nguồn gốc thực vật: dầu đậu n&agrave;nh, dầu hướng dương, dầu olein,... Nguy&ecirc;n liệu được lựa chọn kỹ lưỡng, an to&agrave;n cho sức khỏe, mang đến sự an t&acirc;m cho người d&ugrave;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Dầu thực vật cao cấp Marvela A &amp; D3 chai 1 l&iacute;t&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">với c&ocirc;ng thức đặc biệt bổ sung vi chất dinh dưỡng tốt cho sức khỏe v&agrave; mang lại bữa ăn thơm ngon cho gia đ&igrave;nh bạn.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span>&nbsp;Dầu đậu n&agrave;nh, dầu Olein, Vitamin A, Vitamin D3.</p>
', 40000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1114, N'Nước tương Maggi tỏi ớt', 1010, 1010, N'Chai', N'/img/nuoctuong.jpg', N'', 13000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1115, N'Nước tương Tam Thái Tử', 1010, 1010, N'Chai', N'/img/nuoctuongttt.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước tương Tam Th&aacute;i Tử Nhất Ca chai 500ml được l&agrave;m từ đậu n&agrave;nh tự nhi&ecirc;n 100%, kh&ocirc;ng chứa 3-MCPD, tạo n&ecirc;n sản phẩm nước tương an to&agrave;n cho sức khỏe với hương vị thơm ngon, h&agrave;i h&ograve;a, cho bữa ăn hằng ng&agrave;y th&ecirc;m đủ đầy. Th&iacute;ch hợp cho cả chấm v&agrave; nấu. Chay mặn đều d&ugrave;ng được.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Được l&agrave;m từ đậu n&agrave;nh tự nhi&ecirc;n 100%. Nước tương Tam Th&aacute;i Tử s&oacute;ng s&aacute;nh đậm đ&agrave;, thấm quyện trong từng miếng chấm cho m&oacute;n ăn thật ngon!</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span>&nbsp;Nước, muối, kh&ocirc; đậu n&agrave;nh, chất điều vị, đường, m&agrave;u thực phẩm, chất điều chỉnh độ axit, hương tổng hợp d&ugrave;ng trong thực phẩm, chất bảo quản, chất l&agrave;m đầy, chất tạo ngọt tổng hợp...</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Sản phẩm chứa nguy&ecirc;n liệu c&oacute; nguồn gốc từ đậu n&agrave;nh l&agrave;m từ kh&ocirc; đậu n&agrave;nh c&oacute; nguồn gốc tự nhi&ecirc;n 100%.</p>
', 17000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1116, N'Bột ngọt Ajinomoto', 1010, 1010, N'Gói', N'/img/botngot.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Bột ngọt Ajinomoto l&agrave; một gia vị thực phẩm c&oacute; chức năng điều vị l&agrave;m cho thực phẩm ngon hơn, g&oacute;p phần l&agrave;m n&ecirc;n bữa ăn ngon của gia đ&igrave;nh Việt. Bột ngọt gi&uacute;p cho m&oacute;n ăn dậy hương, đậm đ&agrave; m&agrave; kh&ocirc;ng mất đi vị đặc trưng vốn c&oacute; của thực phẩm.</span></p>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Được sản xuất bằng phương ph&aacute;p l&ecirc;n men tự nhi&ecirc;n từ mật m&iacute;a đường v&agrave; tinh bột khoai mỳ. Sau qu&aacute; tr&igrave;nh l&ecirc;n men, một loại axit amin t&ecirc;n l&agrave; glutamic được tạo ra. Từ axit glutamic, một gia vị độc đ&aacute;o d&ugrave;ng để tăng gia vị tự nhi&ecirc;n của thực phẩm được sản xuất ra. Đ&oacute; ch&iacute;nh l&agrave; bột ngọt l&agrave; một gia vị thực phẩm c&oacute; chức năng điều vị, được sử dụng rộng r&atilde;i trong chế biến m&oacute;n ăn ở gia đ&igrave;nh, nh&agrave; h&agrave;ng v&agrave; trong c&ocirc;ng nghiệp chế biến thực phẩm, l&agrave;m cho thực phẩm ngon v&agrave; hấp dẫn hơn.</li>
	<li style="box-sizing: inherit;">
		Được sản xuất theo c&ocirc;ng nghệ hiện đại của Nhật Bản. Mọi kh&acirc;u từ lựa chọn nguy&ecirc;n liệu đến chế biến, đ&oacute;ng bao b&igrave; đều được đ&aacute;nh gi&aacute; theo ti&ecirc;u chuẩn chất lượng cao</li>
	<li style="box-sizing: inherit;">
		Sản phẩm được đ&oacute;ng g&oacute;i bao b&igrave; kỹ lượng, rất dễ sử dụng v&agrave; bảo quản.</li>
</ul>
', 29000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1117, N'Bột ngọt Vedan', 1010, 1010, N'Gói', N'/img/botngotvedan.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Bột ngọt Vedan Được sản xuất từ nguy&ecirc;n liệu thi&ecirc;n nhi&ecirc;n, mang đến hương vị thơm ngon cho c&aacute;c m&oacute;n ăn khi chế biến. Th&ecirc;m v&agrave;o đ&oacute;, sản phẩm kh&ocirc;ng chứa c&aacute;c chất bảo quản độc hại, đảm bảo an to&agrave;n sức khỏe cho người d&ugrave;ng</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Bột ngọt Vedan tạo n&ecirc;n sự hấp dẫn đặc trưng cho bữa cơm gia đ&igrave;nh. Bạn c&oacute; thể sử dụng bột ngọt trong nhiều m&oacute;n ăn như canh, x&agrave;o, kho để chăm s&oacute;c bữa ăn cũng như sức khỏe những người th&acirc;n y&ecirc;u tốt nhất. Gi&uacute;p cho m&oacute;n ăn dậy hương, đậm đ&agrave; m&agrave; kh&ocirc;ng mất đi vị đặc trưng vốn c&oacute; của thực phẩm. N&oacute; gi&uacute;p cho m&oacute;n rau x&agrave;o xanh mướp, m&oacute;n canh th&ecirc;m ngon ngọt, c&aacute;c m&oacute;n kho đậm đ&agrave; hơn.</p>
', 29000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1118, N'Đường tinh luyện Auchan', 1010, 1010, N'Gói', N'/img/duong.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đường tinh luyện Auchan l&agrave; loại đường tinh khiết cao cấp, sản xuất từ giống m&iacute;a tốt nhất bởi nh&agrave; m&aacute;y c&oacute; hệ thống quản l&yacute; được chứng nhận ph&ugrave; hợp với ti&ecirc;u chuẩn ISO 22000HACCP.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="font-weight: bolder; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Đặc điểm nổi bật:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		100% m&iacute;a đường tinh khiết.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng tạp chất.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng h&oacute;a chất tẩy trắng</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Đường Saccaroza&nbsp;&ge; 99.8%.</p>
', 18000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1119, N'Đường phèn Auchan', 1010, 1010, N'Gói', N'/img/duongphen.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Trong y học Phương Đ&ocirc;ng, đường ph&egrave;n được xem như một vị thuốc nhờ chất ngọt, t&iacute;nh b&igrave;nh. Tắc chưng mật ong đường ph&egrave;n gi&uacute;p giảm ho khan, nước bầu non nấu đường ph&egrave;n hỗ trợ ti&ecirc;u h&oacute;a, tạo cảm gi&aacute;c ngon miệng, &ocirc; mai ướp đường ph&egrave;n lại hữu hiệu với cổ họng kh&ocirc;, kh&aacute;t nước hay ch&aacute;n ăn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Đường Saccharose &gt;= 99.5%.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu (tr&ecirc;n 100g):</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Năng lượng: &gt;= 398 kcal.</li>
	<li style="box-sizing: inherit;">
		H&agrave;m lượng Carbohydrate: &gt;= 99.5%.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>Sử dụng trực tiếp trong chế biến thức uống, nước giải kh&aacute;t, thực phẩm ăn tr&aacute;ng miệng như nấu ch&egrave;, c&aacute;c m&oacute;n chưng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:</span>&nbsp;Bảo quản hoặc trưng b&agrave;y nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t.</p>
', 23000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1120, N'Muối Iot Thành Phát', 1010, 1010, N'Gói', N'/img/muoi.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Muối Iot Th&agrave;nh Ph&aacute;t l&agrave; sản phẩm kh&ocirc;ng thể thiếu trong gian bếp của mỗi gia đ&igrave;nh, gi&uacute;p m&oacute;n ăn th&ecirc;m đậm đ&agrave; v&agrave; tr&ograve;n vị.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Muối được coi l&agrave; một gia vị quan trọng trong nấu ăn kh&ocirc;ng chỉ bởi gi&uacute;p cho m&oacute;n ăn tăng hương vị m&agrave; c&ograve;n c&oacute; nhiều lợi &iacute;ch đối với sức khỏe. Muối Iot Th&agrave;nh Ph&aacute;t được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại, đem đến cho người ti&ecirc;u d&ugrave;ng những sản phẩm tốt nhất.</span></p>
', 7000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1121, N'Nước mắm Nam Ngư', 1010, 1009, N'Chai', N'/img/nuocmam.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>&nbsp;Nước mắm cốt c&aacute; cơm(95%), đường, chất điều vị(640, 621, 635), chất điều chỉnh độ axit(330), hương nước mắm tổng hợp, chất tạo ngọt tổng hợp(950). Kh&ocirc;ng d&ugrave;ng chất bảo quản.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng chế biến c&aacute;c m&oacute;n ăn hoặc để chấm, c&oacute; thể pha th&ecirc;m ch&uacute;t chanh, đường cho ph&ugrave; họp khẩu vị.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;</span>&nbsp;Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp. Đậy nắp&nbsp;k&iacute;n sau khi sử dụng. Sản phẩm chứa nguy&ecirc;n liệu c&oacute; nguồn gốc từ thủy sản.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Thể t&iacute;ch thực:&nbsp;</span>500ml.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất:&nbsp;</span>Cty TNHH Một Th&agrave;nh Vi&ecirc;n Nam Ngư Ph&uacute; Quốc.</p>
', 58000, 0)
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1122, N'Nước mắm Hương Việt', 1010, 1009, N'Chai', N'/img/nuocmamhv.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước mắm Hương Việt với th&agrave;nh phần ch&iacute;nh từ c&aacute; cơm tươi được chế biến từ tinh chất c&aacute; cơm tươi với quy tr&igrave;nh sản xuất hiện đại, mang đến m&agrave;u sắc hấp dẫn, vị đậm đ&agrave;. Nước mắm d&ugrave;ng để chấm trực tiếp với thức ăn hoặc th&ecirc;m tỏi, ớt v&agrave;o v&agrave; pha chế cho vừa khẩu vị của từng người hoặc l&agrave;m gia vị cho ướp, tẩm, chi&ecirc;n, x&agrave;o, nấu...</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Nước mắm Hương Việt được chế biến từ tinh cốt c&aacute; cơm tươi th&ocirc;ng qua phương ph&aacute;p ủ chượp truyền thống kết hợp với c&ocirc;ng nghệ sản xuất hiện đại, loại bỏ được h&agrave;m lượng Nitơ Amoniac (đạm xấu) đến mức tối thiểu, đồng thời giữ lại c&aacute;c&nbsp;Nitơ axit amin(đạm tốt) được tạo th&agrave;nh qua &aacute;u tr&igrave;nh ph&acirc;n giải protein c&oacute; trong c&aacute;, ph&ugrave; hợp với ti&ecirc;u chuẩn Việt Nam, tạo ra những giọt nước mắm thơm ngon đặc trưng với m&agrave;u sắc hấp dẫn, hậu vị ngọt dịu.&nbsp;</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	Nước mắm Hương Việt - Tinh hoa ẩm thực Việt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;</span>Nước cốt mắm c&aacute; cơm (50%), nước, muối, đường, chất điều vị: Mononatri glutamat (621), Disodium 5&#39;-Inosinate (631), Disodium 5&#39;-Guanylate (627), Acesulfam-k (950), chất bảo quản: Natri benzoat (211), Kali sorbat (202), hương nước mắm tổng hợp, phẩm m&agrave;u: caramen (150a).</p>
', 22000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1123, N'Hạt nêm Knorr', 1010, 1010, N'Gói', N'/img/hatnem.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hạt n&ecirc;m Knorr với thịt thăn, xương ống v&agrave; tủy l&agrave; sự kết hợp tuyệt vời từ 3 nguy&ecirc;n liệu ch&iacute;nh l&agrave; thịt thăn, xương ống, tủy cho đến c&aacute;c loại nấm tạo th&agrave;nh loại gia vị n&ecirc;m nếm thơm ngon, hấp dẫn. Sản phẩm c&oacute; vị ngọt đặc trưng của thịt v&agrave; nấm mang đến cho bạn những m&oacute;n ăn với hương vị tự nhi&ecirc;n v&agrave; đậm đ&agrave;.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hạt n&ecirc;m Knorr với thịt thăn, xương ống v&agrave; tủy nay c&ograve;n bổ sung th&ecirc;m vitamin A! Gi&uacute;p mọi m&oacute;n ăn bạn nấu thật thơm ngon, tr&ograve;n vị v&agrave; tốt cho sức khỏe cả gia đ&igrave;nh.</span></p>
', 68000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1124, N'Hạt nêm Aji-ngon Heo', 1010, 1010, N'Gói', N'/img/hatnemaj.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hạt n&ecirc;m Aji-ngon Heo, một gia vị quen thuộc kh&ocirc;ng thể thiếu trong gian bếp của những b&agrave; nội trợ, gi&uacute;p m&oacute;n ăn th&ecirc;m đậm đ&agrave; v&agrave; tr&ograve;n vị.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Hạt n&ecirc;m vị heo Aji-Ngon được sản xuất theo c&ocirc;ng nghệ hiện đại Nhật Bản với quy tr&igrave;nh kh&eacute;p k&iacute;n, chiết xuất c&ocirc; đặc từ thịt thăn v&agrave; xương ống l&agrave;m cho m&oacute;n ăn th&ecirc;m đậm đ&agrave; hơn. Với Aji-Ngon bạn c&oacute; thể chế biến nhiều m&oacute;n ăn như tẩm ướp, x&agrave;o, nấu, gi&uacute;p tiết kiệm thời gian tối đa, l&agrave; người bạn đồng h&agrave;nh tuyệt vời của những b&agrave; nội trợ.</span></p>
', 7000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1125, N'Tương ớt Cholimex', 1010, 1010, N'Chai', N'/img/tuongot.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tương ớt Cholimex pet l&agrave; sản phẩm được sản xuất tr&ecirc;n quy tr&igrave;nh hiện đại kh&eacute;p k&iacute;n, bảo đảm an to&agrave;n vệ sinh thực phẩm. M&oacute;n ăn của bạn sẽ c&oacute; th&ecirc;m hương vị đậm đ&agrave; thơm ngon nhờ hương vị cay nồng của sản phẩm.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tương ớt Cholimex chai pet 270g với thành ph&acirc;̀n tự nhi&ecirc;n g&ocirc;̀m ớt và các loại gia vị hòa tr&ocirc;̣n với nhau tạo n&ecirc;n m&ocirc;̣t loại tương ớt làm tăng th&ecirc;m mùi vị khi dùng chung với các món nướng, chi&ecirc;n, phở, pizza... Sản ph&acirc;̉m đảm bảo an toàn v&ecirc;̣ sinh thực ph&acirc;̉m, người ti&ecirc;u dùng có th&ecirc;̉ an t&acirc;m khi sử dụng.</span></p>
<p dir="ltr" style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:&nbsp;&nbsp;</span>Nước, đường, ớt (25%), đường, cà chua, tỏi, mu&ocirc;́i ăn, d&acirc;́m. Ch&acirc;́t &ocirc;̉n định: Acetylated Distarch Adipat (1422). Ch&acirc;́t bảo quản: Natri benzoat (211) hoặc Kali sorbat (202), Ch&acirc;́t đi&ecirc;̀u vị: Mononatri glutamat (621). Ph&acirc;̉m màu t&ocirc;̉ng hợp: Sunset yellow FCF (110).</p>
<p dir="ltr" style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chỉ ti&ecirc;u chất lượng chủ yếu:&nbsp;</span>Hàm lượng mu&ocirc;́i ăn&nbsp;<span style="box-sizing: inherit; color: rgb(84, 84, 84); font-family: arial, sans-serif; font-size: small;">&le;&nbsp;</span>6% kh&ocirc;́i lượng.</p>
<p dir="ltr" style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>Dùng với kh&ocirc; mực nướng, hải sản lu&ocirc;̣c, hải sản t&acirc;̉m b&ocirc;̣t chi&ecirc;n, chả giò, gà rán, khoai t&acirc;y chi&ecirc;n, khoai t&acirc;y ph&ocirc; mai, mì, hamburger, phở, bánh pizza...</p>
', 9000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1126, N'Tương cà Cholimex', 1010, 1010, N'Chai', N'/img/tuongca.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tương c&agrave; Cholimex l&agrave; loại sốt chấm tuyệt hảo cho c&aacute;c m&oacute;n ăn th&ecirc;m ngon miệng hấp dẫn. Tương c&agrave; được sản xuất từ những tr&aacute;i c&agrave; chua tươi ngon với th&agrave;nh phần dinh dưỡng cao, kh&ocirc;ng chất bảo quản, an to&agrave;n cho sức khỏe người sử dụng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Với sự h&ograve;a quyện tuyệt vời giữa năm vị: ngọt, mặn, cay, đắng, ngọt dịu, tương c&agrave; Cholimex k&iacute;ch th&iacute;ch vị gi&aacute;c, l&agrave;m tăng cảm gi&aacute;c ngon miệng khi ăn. Chai pet 270gr nhỏ gọn tiện lợi sử dụng ở c&aacute;c qu&aacute;n ăn, gia đ&igrave;nh hoặc đem theo đi du lịch, d&atilde; ngoại.</span></p>
', 9000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1127, N'Tương ớt chua ngọt Cholimex', 1010, 1010, N'Chai', N'/img/tuongotchuangot.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tương ớt chua ngọt Cholimex chai Pet 270g với hương vị cay nồng của ớt h&ograve;a quyện vị chua ngọt dễ chịu của c&aacute;c th&agrave;nh phần nguy&ecirc;n phụ liệu, sản phẩm được đ&oacute;ng chai nhựa Pet tiện lợi an to&agrave;n cho cả gia đ&igrave;nh. Vị tương ớt chua ngọt k&iacute;ch th&iacute;ch vị gi&aacute;c khi kết hợp c&ugrave;ng c&aacute;c m&oacute;n chi&ecirc;n, r&aacute;n...</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Tương ớt chua ngọt Cholimex c&oacute; th&agrave;nh phần an to&agrave;n từ ớt v&agrave; c&aacute;c gia vị như gừng, chanh, đường... cho vị tương ớt chua ngọt tr&ograve;n vị.&nbsp;Sản phẩm của Choilimex trải qua qu&aacute; tr&igrave;nh kiểm định nghi&ecirc;m ngặt trong sản xuất lẫn qu&aacute; tr&igrave;nh đ&oacute;ng chai kh&eacute;p k&iacute;n... cho cả gia đ&igrave;nh bạn an t&acirc;m sử dụng.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm nổi bật:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Tương ớt Cholimex cho m&oacute;n ăn th&ecirc;m thơm ngon v&agrave; đậm đ&agrave;. Bữa ăn của bạn sẽ hấp dẫn hơn bao giờ hết khi c&oacute; m&oacute;n tương n&agrave;y ho&agrave; quyện c&ugrave;ng.</li>
	<li style="box-sizing: inherit;">
		Chai c&oacute; nắp đậy tiện lợi,&nbsp;k&iacute;n, gi&uacute;p bảo quản tốt hơn c&aacute;c gia vị dạng g&oacute;i, cho bạn thời gian sử dụng l&acirc;u.</li>
	<li style="box-sizing: inherit;">
		Tương ớt Choilimex dần trở th&agrave;nh loại nước chấm kh&ocirc;ng thể thiếu trong tủ bếp của mỗi gia đ&igrave;nh.</li>
	<li style="box-sizing: inherit;">
		Sản phẩm đảm bảo chất lượng an to&agrave;n, kh&ocirc;ng c&oacute; đường h&oacute;a học, kh&ocirc;ng chứa h&oacute;a chất độc hại được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, được kiểm duyệt chặt chẽ.</li>
</ul>
', 12000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1128, N'Chảo chiên nướng Fivestar', 1011, 1010, N'Cái', N'/img/chao.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Chảo chi&ecirc;n nướng Fivestar CKD24-3DI 24cm với thiết kế chắc chắn, phần l&ograve;ng chảo được tr&aacute;n 3 lớp sơn chống d&iacute;nh gi&uacute;p sử dụng l&acirc;u bền hơn. Sản phẩm với h&igrave;nh d&aacute;ng nhỏ gọn, c&oacute; thể d&ugrave;ng để chi&ecirc;n hoặc nướng, gi&uacute;p bạn chế biến được nhiều m&oacute;n ăn phong ph&uacute;, đa dạng hơn về khẩu vị cũng như h&igrave;nh thức. Chảo với vẻ ngo&agrave;i sang trọng, bắt mắt gi&uacute;p tạo điểm nhấn cho gian bếp của bạn.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Inox 430 tr&aacute;ng 3 lớp sơn chống d&iacute;nh, vỏ ngo&agrave;i sơn m&agrave;u chịu nhiệt.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Số lượng:&nbsp;</span>1 c&aacute;i/ hộp.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số:</span>&nbsp;Size 24cm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:</span>&nbsp;D&ugrave;ng để chế biến m&oacute;n ăn.</p>
', 220000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1129, N'Búa đập thịt', 1011, 1010, N'Cái', N'/img/bua.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">B&uacute;a đập thịt được l&agrave;m từ chất liệu inox, kh&ocirc;ng gỉ s&eacute;t, đảm bảo an to&agrave;n cho sức khỏe người sử dụng. Sản phẩm được thiết kế với những ụ đinh tr&ograve;n ở 2 mặt, kh&ocirc;ng nhọn. Gi&uacute;p dễ d&agrave;ng đập dập v&agrave; t&aacute;n đều miếng thịt hơn.</span></p>
', 50000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1130, N'Sạn lỗ nhựa L383', 1011, 1010, N'Cái', N'/img/san.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chất liệu :&nbsp;</span>Nhựa PP.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">K&iacute;ch thước :&nbsp;</span>34x10x3,5 cm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng :&nbsp;</span>D&ugrave;ng để m&uacute;c thức ăn. Rửa sạch v&agrave; lau kh&ocirc; sau mỗi lần sử dụng. Bảo quản nơi kh&ocirc; r&aacute;o, tr&aacute;nh để nhiệt độ cao.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ :&nbsp;</span>Thổ Nhĩ Kỳ.</p>
', 57000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1131, N'Ray lọc nhựa trung', 1011, 1010, N'Cái', N'/img/ray.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần :&nbsp;</span>PP- lưới inox.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Định lượng :&nbsp;</span>60g.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số kỹ thuật :</span>&nbsp;đường k&iacute;nh 140mm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Lưu &yacute; :&nbsp;</span>Bảo quản nơi kh&ocirc; r&aacute;o, tr&aacute;nh xa nguồn nhiệt.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Việt Nam.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất :&nbsp;</span>Nhựa gia dụng Tự Lập</p>
', 12000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1132, N'Auchan dao đa năng', 1011, 1010, N'Cái', N'/img/daodn.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần :&nbsp;</span>Lưỡi dao bằng inox, c&aacute;n nhựa PP.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số kỹ thuật :&nbsp;</span>Lưỡi dao d&agrave;i 175mm (kh&ocirc;ng bao gồm c&aacute;n).</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Cảnh b&aacute;o :&nbsp;</span>Để xa tầm tay trẻ em để tr&aacute;nh g&acirc;y s&aacute;t thương.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng :&nbsp;</span>C&aacute;n dao kh&ocirc;ng n&ecirc;n tiếp x&uacute;c trược tiếp với nhiệt độ cao, sau khi tiếp x&uacute;c với sản phẩm c&oacute; t&iacute;nh axit n&ecirc;n lập tức rửa sạch v&agrave; lau kh&ocirc;.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản :&nbsp;</span>sau khi sử dụng ,rửa sạch v&agrave; d&ugrave;ng vải mềm lau kh&ocirc; lưỡi dao.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ :&nbsp;</span>Trung Quốc.</p>
', 55000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1133, N'Dao inox Kiwi', 1011, 1010, N'Cái', N'/img/daoinox.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nguy&ecirc;n liệu :&nbsp;</span>Th&eacute;p kh&ocirc;ng gỉ.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">D&agrave;i :&nbsp;&nbsp;</span>26 cm.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng :&nbsp;</span>d&ugrave;ng cắt, thịt,rau, củ, quả,</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản :&nbsp;</span>rửa sach, lau kh&ocirc; sau khi sử dụng.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ :&nbsp;</span>Th&aacute;i Lan.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Nh&agrave; sản xuất :&nbsp;</span>Kiwi &amp; Kom-Kom Products Co.,LTD</p>
', 39000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1134, N'Vá múc canh inox', 1011, 1010, N'Cái', N'/img/va.jpg', N'<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Th&ocirc;ng số sản phẩm:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Chất liệu: Inox, c&aacute;n nhựa PP.</li>
	<li style="box-sizing: inherit;">
		K&iacute;ch thước: d&agrave;i 31.5cm.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Đặc điểm, c&ocirc;ng dụng sản phẩm:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		V&aacute; m&uacute;c canh inox được l&agrave;m bằng chất liệu th&eacute;p kh&ocirc;ng gỉ chắc, &iacute;t bị trầy xước, cũng như c&oacute; khả năng chịu được nhiệt độ cao, cho độ bền sử dụng l&acirc;u d&agrave;i theo thời gian.</li>
	<li style="box-sizing: inherit;">
		Tay cầm bằng nhựa c&aacute;ch nhiệt tốt, cho người d&ugrave;ng thoải m&aacute;i sử dụng m&agrave; kh&ocirc;ng lo phỏng tay.</li>
	<li style="box-sizing: inherit;">
		Chất liệu cao cấp kh&ocirc;ng sản sinh ra c&aacute;c h&oacute;a chất g&acirc;y hại, đảm bảo an to&agrave;n cho sức khỏe người d&ugrave;ng.</li>
	<li style="box-sizing: inherit;">
		Nổi bật với gam m&agrave;u bạc đẹp mắt kết hợp c&ugrave;ng m&agrave;u n&acirc;u của tay cầm, v&aacute; m&uacute;c canh g&oacute;p phần mang đến sự sang trọng v&agrave; thanh lịch cho kh&ocirc;ng gian b&agrave;n ăn.</li>
	<li style="box-sizing: inherit;">
		Cấu tạo đầu v&aacute; tr&ograve;n, s&acirc;u l&ograve;ng gi&uacute;p m&uacute;c nước sốt, canh, soup gọn g&agrave;ng hơn.&nbsp;</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>Nấu ăn, rửa sạch sau khi sử dụng nhằm ngăn ngừa sự ph&aacute;t triển của vi khuẩn.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẩn bảo quản:</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Để bảo đảm an to&agrave;n, kh&ocirc;ng n&ecirc;n sử dụng khi tay cầm đang ướt, trơn trượt.</li>
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng để tay cầm ở gần nơi c&oacute; nhiệt độ cao nhằm tr&aacute;nh biến dạng/ch&aacute;y sản phẩm.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:&nbsp;</span>Trung Quốc.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Sản xuất tại:&nbsp;</span>Yangdong Meijiayi Company.</p>
', 18000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1135, N'Dụng cụ đánh trứng inox', 1011, 1010, N'Cái', N'/img/danhtrung.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dụng cụ đ&aacute;nh trứng inox Shika - SK 1729 c&oacute; thiết kế nhiều v&ograve;ng, gi&uacute;p đ&aacute;nh tan trứng một c&aacute;ch hiệu quả. Đồng thời c&ograve;n l&agrave;m cho bột trở n&ecirc;n mịn v&agrave; đều hơn. Tr&ecirc;n th&acirc;n dụng cụ đ&aacute;nh trứng được thiết kế dạng m&oacute;c treo, gi&uacute;p kh&ocirc;ng gian nh&agrave; bếp th&ecirc;m gọn g&agrave;ng.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">Th&agrave;nh phần:</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">&nbsp;Th&eacute;p kh&ocirc;ng gỉ 430.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span>D&ugrave;ng để đ&aacute;nh trứng, đ&aacute;nh bột...</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn bảo quản:&nbsp;</span>Rửa sạch sau khi d&ugrave;ng, để nơi kh&ocirc; r&aacute;o.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Xuất xứ:</span>&nbsp;Trung Quốc.</p>
', 24000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [HinhAnh], [ChiTiet], [GiaBan], [KhuyenMai]) VALUES (1136, N'Dụng cụ gọt vỏ Shika', 1011, 1010, N'Cái', N'/img/gotvo.jpg', N'<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">Dụng cụ gọt vỏ Shika SK0043 với thiết kế nhỏ gọn, vừa l&ograve;ng b&agrave;n tay gi&uacute;p bạn c&oacute; thao t&aacute;c nhanh khi gọt củ quả. Đồng thời, bạn c&oacute; thể đem theo để sử dụng khi đi chơi xa để gọt vỏ tr&aacute;i c&acirc;y giải nhiệt. N&ecirc;n vệ sinh dao sạch sẽ sau khi d&ugrave;ng để bảo quản v&agrave; sử dụng được l&acirc;u.</span></p>
<p>
	&nbsp;</p>
<p>
	<span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px; box-sizing: inherit; font-weight: bolder;">C&ocirc;ng dụng:&nbsp;</span><span style="color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">D&ugrave;ng để gọt vỏ c&aacute;c loại củ, quả nhanh ch&oacute;ng.</span></p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Chất liệu:&nbsp;</span>Lưỡi bằng inox, th&acirc;n bằng nhựa.</p>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Hướng dẫn sử dụng:&nbsp;</span></p>
<ul style="box-sizing: inherit; margin-top: 0px; margin-bottom: 1rem; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<li style="box-sizing: inherit;">
		Kh&ocirc;ng được hơ lưỡi gọt vỏ tr&ecirc;n l&ograve; lửa, hoặc phơi nắng gắt để tr&aacute;nh l&agrave;m lưỡi bị hỏng hoặc mềm.</li>
	<li style="box-sizing: inherit;">
		Lưỡi rất dễ bị gỉ v&agrave; c&ugrave;n đi nếu đồ ăn vẫn c&ograve;n d&iacute;nh tr&ecirc;n lưỡi sau khi đ&atilde; d&ugrave;ng xong. V&igrave; thế, lu&ocirc;n phải rửa sạch lưỡi sau khi sử dụng. Khi rửa lưỡi,&nbsp; n&ecirc;n d&ugrave;ng miếng bọt biển hoặc vải mềm để rửa, kh&ocirc;ng d&ugrave;ng tay v&igrave; lưỡi rất b&eacute;n.</li>
	<li style="box-sizing: inherit;">
		tuyệt đối kh&ocirc;ng cho gọt vỏ v&agrave;o m&aacute;y rửa b&aacute;t hoặc ng&acirc;m xuống nước. Điều n&agrave;y sẽ l&agrave;m lưỡi bị hỏng v&agrave; bị rỉ s&eacute;t. Ngo&agrave;i ra, tr&aacute;nh để va đập mạnh dụng cụ với c&aacute;c thiết bị hoặc vật dụng kh&aacute;c sẽ l&agrave;m lưỡi bị cong v&ecirc;nh sẽ kh&ocirc;ng sử dụng được.</li>
</ul>
<p style="box-sizing: inherit; margin-top: 0px; margin-bottom: 10px; color: rgb(89, 89, 89); font-family: Roboto, &quot;Helvatica Neue&quot;, Arial, sans-serif; font-size: 16px;">
	<span style="box-sizing: inherit; font-weight: bolder;">Bảo quản:&nbsp;</span>Rửa sạch, để nơi kh&ocirc; r&aacute;o.&nbsp;</p>
', 24000, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (1012, N'0983404810', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Khách hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (1018, N'0983404811', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Khách hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (1019, N'0983404812', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Khách hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (1005, N'0983404818', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Khách hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (1007, N'0983404819', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Khách hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (2013, N'2013', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Admin')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (2031, N'2031', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Nhân viên bán hàng')
INSERT [dbo].[TaiKhoan] ([MaND], [TenND], [MatKhau], [LoaiND]) VALUES (2032, N'2032', N'2F-24-16-BA-3B-CF-5D-B1-83-62-CA-D2-0C-A9-00-89-51-5A-BE-0F', N'Nhân viên kho')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_1]    Script Date: 13/05/2019 19:37:23 ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UQ_1] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LienHe] ADD  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__CTDonDatHa__MaDH__60083D91] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonDatHang] ([MaDH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonDatHang] CHECK CONSTRAINT [FK__CTDonDatHa__MaDH__60083D91]
GO
ALTER TABLE [dbo].[CTDonDatHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__MaHD__267ABA7A] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__MaHD__267ABA7A]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CTHoaDon__MaSP__276EDEB3] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK__CTHoaDon__MaSP__276EDEB3]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuNhap] ([MaPhieu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__CTPhieuNha__MaSP__1FCDBCEB] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK__CTPhieuNha__MaSP__1FCDBCEB]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK__DonDatHang__MaKH__5D2BD0E6] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK__DonDatHang__MaKH__5D2BD0E6]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__239E4DCF] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__239E4DCF]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__22AA2996] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__22AA2996]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhap__MaNV__1BFD2C07] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK__PhieuNhap__MaNV__1BFD2C07]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaLoai__182C9B23] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaLoai__182C9B23]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaNCC__1920BF5C] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaNCC__1920BF5C]
GO
/****** Object:  Trigger [dbo].[TinhTien_CTDDH]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TinhTien_CTDDH]
on [dbo].[CTDonDatHang]
for insert,update
as
begin
	declare @masp int,@mahd int, @soluong int
	declare @giaban float, @km float
	select @masp = MaSP,@mahd=MaDH,@soluong=SoLuong,@giaban=DonGia from inserted
	select @km=KhuyenMai from SanPham where MaSP=@masp
	if(@km<>0)
		update CTDonDatHang set ThanhTien = @giaban*@soluong*(1-@km*0.01) where MaSP=@masp and MaDH=@mahd
	else
		update CTDonDatHang set ThanhTien = @giaban*@soluong*(1-@km*0.01)
		where MaSP=@masp and MaDH=@mahd
end
GO
/****** Object:  Trigger [dbo].[trg_CapNhatDDH]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_CapNhatDDH]
on [dbo].[CTDonDatHang]
for insert,update
as
begin
	declare @mahd int
	declare @tt float
	select @mahd=MaDH,@tt=ThanhTien from inserted
	update DonDatHang set TriGia = TriGia + @tt  where MaDH=@mahd
end
GO
/****** Object:  Trigger [dbo].[TinhTien_CTHD]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TinhTien_CTHD]
on [dbo].[CTHoaDon]
for insert,update
as
begin
	declare @masp int,@mahd int, @soluong int
	declare @giaban float, @km float
	select @masp = MaSP,@mahd=MaHD,@soluong=SoLuong,@giaban=DonGia from inserted
	select @km=KhuyenMai from SanPham where MaSP=@masp
	if(@km>0)
		update CTHoaDon set ThanhTien = @giaban*@soluong*(1-@km*0.01), GhiChu= concat(N'Giảm ',@km,'%') where MaSP=@masp and MaHD=@mahd
	else
		update CTHoaDon set ThanhTien = @giaban*@soluong*(1-@km*0.01) where MaSP=@masp and MaHD=@mahd
end
GO
/****** Object:  Trigger [dbo].[trg_CapNhatHD]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_CapNhatHD]
on [dbo].[CTHoaDon]
for insert,update
as
begin
	declare @mahd int
	declare @tt float
	select @mahd=MaHD,@tt=ThanhTien from inserted
	update HoaDon set TriGia = TriGia + @tt  where MaHD=@mahd
end

GO
/****** Object:  Trigger [dbo].[trg_CapNhatHoaDon]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trg_CapNhatHoaDon]
on [dbo].[CTHoaDon]
for delete
as
begin
	declare @mahd int
	declare @tt float
	select @mahd=MaHD,@tt=ThanhTien from deleted
	update HoaDon set TriGia = TriGia - @tt  where MaHD=@mahd
end

GO
/****** Object:  Trigger [dbo].[KTra_GiaNhap]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[KTra_GiaNhap]
on [dbo].[CTPhieuNhap]
for insert, update
as
begin
	declare @masp int, @giaban float, @gianhap float
	select @masp= MaSP, @gianhap=GiaNhap from inserted
	select @giaban=GiaBan from SanPham where MaSP=@masp
	if(@gianhap>@giaban)
		Rollback tran
end
GO
/****** Object:  Trigger [dbo].[TinhTien_CTPN]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TinhTien_CTPN]
on [dbo].[CTPhieuNhap]
for insert,update
as
begin
	declare @masp int,@maphieu int, @soluong int
	declare @gianhap float
	select @masp = MaSP,@maphieu=MaPhieu,@soluong=SoLuong from inserted
	select @gianhap=GiaNhap from CTPhieuNhap where MaSP=@masp and MaPhieu=@maphieu
	update CTPhieuNhap set ThanhTien = @gianhap*@soluong where MaSP=@masp and MaPhieu=@maphieu

end
GO
/****** Object:  Trigger [dbo].[trg_CapNhatPhieuNhap]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_CapNhatPhieuNhap]
on [dbo].[CTPhieuNhap]
for delete
as
begin
	declare @mapn int
	declare @tt float
	select @mapn=MaPhieu,@tt=ThanhTien from deleted
	update PhieuNhap set TriGia = TriGia - @tt  where MaPhieu=@mapn
end
GO
/****** Object:  Trigger [dbo].[trg_CapNhatPN]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_CapNhatPN]
on [dbo].[CTPhieuNhap]
for insert,update
as
begin
	declare @mapn int
	declare @tt float
	select @mapn=MaPhieu,@tt=ThanhTien from inserted
	update PhieuNhap set TriGia = TriGia + @tt  where MaPhieu=@mapn
end
GO
/****** Object:  Trigger [dbo].[KTra_GiaBan]    Script Date: 13/05/2019 19:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[KTra_GiaBan]
on [dbo].[SanPham]
for insert, update
as
begin
	declare @masp int, @giaban float, @gianhap float
	select @masp= MaSP, @giaban=GiaBan from inserted
	select top 1 @gianhap=GiaNhap from CTPhieuNhap where MaSP=@masp order by MaPhieu desc
	if(@gianhap>@giaban)
		Rollback tran
end
GO
USE [master]
GO
ALTER DATABASE [QuanLySieuThi] SET  READ_WRITE 
GO

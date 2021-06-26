using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlTypes;
using System.Data.Sql;
using System.Data.Odbc;
using HospitalProject.DAO;

namespace HospitalProject
{
    public partial class loginAdmin : Form
    {
        public loginAdmin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            //xu ly login vao mot user
            string nameandpass= comboBoxServiceName.Text + ";DBA Privilege = SYSDBA; User Id=" + this.txbUserName.Text + "; Password=" + this.txbPassword.Text;//User Id = c##bv_schema;Password=bv_schema;";
            DataProvider.ConnStr = "DATA SOURCE=localhost:1521/" + nameandpass;
            string vaitro = "";
            //DataProvider dataPro = new DataProvider();
            //int result = dataPro.ExecuteParameterNonQuery("select * from dual");
            string query = "select username from dba_users where username = '" + txbUserName.Text + "'";
            int result = DataProvider.Instance.ExecuteParameterQuery(query).Rows.Count;

            //MessageBox.Show(DataProvider.Instance.ExecuteScalar("SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') FROM DUAL").ToString());

            if (result <= 0)
            {
                MessageBox.Show("Sai tai khoan hoac mat khau!");
                return;
            }


            if(txbUserName.Text == "SYS" && DataProvider.Instance.ExecuteScalar("SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') FROM DUAL").ToString() == "SYS")
            {
                admin fadmin = new admin();
                this.Hide();
                fadmin.ShowDialog();
                this.Show();
                return;
            }

            //Lấy vai trò để điều khiển truy cập vào form tương ứng
            query = "select vaitro from bv_schema.nhanvien where tennv = '" + txbUserName.Text + "'";
            vaitro = DataProvider.Instance.ExecuteScalar(query).ToString();

            //Change sys connection to user connection
            //DataProvider.Instance.ExecuteParameterNonQuery("disconnect");
            nameandpass = comboBoxServiceName.Text + ";" + " User Id=" + this.txbUserName.Text + "; Password=" + this.txbPassword.Text;//User Id = c##bv_schema;Password=bv_schema;";
            DataProvider.ConnStr = "DATA SOURCE=localhost:1521/" + nameandpass;
            if (DataProvider.Instance.ExecuteScalar("SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER') FROM DUAL").ToString() != "0")
            {
                switch (vaitro)
                {
                    case "bac si":
                        fBacSi fbacsi = new fBacSi();
                        this.Hide();
                        fbacsi.ShowDialog();
                        this.Show();
                        break;
                    case "quan ly tai nguyen va nhan su":
                        fQuanlyTainguyenNhansu fquanlytainguyennhansu = new fQuanlyTainguyenNhansu();
                        this.Hide();
                        fquanlytainguyennhansu.ShowDialog();
                        this.Show();
                        break;
                    case "quan ly tai vu":
                        fQuanlyTaivu fquanlytaivu = new fQuanlyTaivu();
                        this.Hide();
                        fquanlytaivu.ShowDialog();
                        this.Show();
                        break;
                    case "quan ly chuyen mon":
                        fQuanlyChuyenmon fquanlychuyenmon = new fQuanlyChuyenmon();
                        this.Hide();
                        fquanlychuyenmon.ShowDialog();
                        this.Show();
                        break;
                    case "tiep tan va dieu phoi benh":
                        fTieptanDieuphoiBenh ftieptandieuphoibenh = new fTieptanDieuphoiBenh();
                        this.Hide();
                        ftieptandieuphoibenh.ShowDialog();
                        this.Show();
                        break;
                    case "tai vu":
                        fTaivu ftaivu = new fTaivu();
                        this.Hide();
                        ftaivu.ShowDialog();
                        this.Show();
                        break;
                    case "bo phan ban thuoc":
                        fBophanBanThuoc fbophanbanthuoc = new fBophanBanThuoc();
                        this.Hide();
                        fbophanbanthuoc.ShowDialog();
                        this.Show();
                        break;
                    case "ke toan":
                        fKetoan fketoan = new fKetoan();
                        this.Hide();
                        fketoan.ShowDialog();
                        this.Show();
                        break;
                }
                
                return;
            }


            //MessageBox.Show("Sai tai khoan hoac mat khau!");
        }

        private void loginAdmin_Load(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
              Application.Exit();
        }

        private void loginAdmin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát chương trình?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }
    }
}

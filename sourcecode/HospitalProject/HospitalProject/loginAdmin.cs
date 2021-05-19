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
            string nameandpass= comboBoxServiceName.Text + "; DBA Privilege = SYSDBA;" +  " User Id=" + this.txbUserName.Text + "; Password=" + this.txbPassword.Text;//User Id = c##bv_schema;Password=bv_schema;";
            DataProvider.ConnStr += nameandpass;
            //DataProvider dataPro = new DataProvider();
            //int result = dataPro.ExecuteParameterNonQuery("select * from dual");
            string query = "select * from dual";
            int result = DataProvider.Instance.ExecuteParameterQuery(query).Rows.Count;
            if(result <= 0)
            {
                
                return;
            }

            //query = "select * from benhnhan";
            //int a = DataProvider.Instance.ExecuteParameterQuery(query).Rows.Count;

            admin fadmin = new admin();
            this.Hide();
            fadmin.ShowDialog();
            this.Show();
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

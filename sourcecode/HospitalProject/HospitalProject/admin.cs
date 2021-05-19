using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using HospitalProject.DAO;

namespace HospitalProject
{
    public partial class admin : Form
    {
        public admin()
        {
            InitializeComponent();
        }

        private void showalluser_Click(object sender, EventArgs e)
        {
            string query = "select * from dba_users";
            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowAllUser.DataSource = data;
        }

        private void dtgvShowAllUser_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void buttonShowUserPriv_Click(object sender, EventArgs e)
        {
            string query = "select o.owner as chusohuu, o.object_name as tendoituong, o.object_type as loai , t.grantee as nguoiduocquyenBang,t.privilege as quyen from dba_objects o left join dba_tab_privs t on o.object_name = t.table_name";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowAllUser.DataSource = data;
        }

        //### Tạo user ###\\
        private void buttonCreateUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn tạo người dùng " + textBoxUserName.Text + "?", "Tạo người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(yesno == DialogResult.No)
            {
                return;
            }

            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "create", "user", textBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonDropUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn xóa người dùng " + textBoxUserName.Text + "?", "Xóa người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "delete", "user", textBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonAlterUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn đổi mật khẩu người dùng " + textBoxUserName.Text + "?", "Sửa người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "update", "user", textBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }


        //### Phân quyền trên user ###\\
        private void buttonGrantUser_Click(object sender, EventArgs e)
        {
            string query = "grantPriv priv cot obj objectname WRO";
            object[] parameter = { comboBoxGrantUserPriv.Text, textBoxGrantUserColumn.Text, textBoxGrantUserObject.Text, textBoxGrantUserGrantee.Text, comboBoxGrantUserAdminOption.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonRevokeUserPriv_Click(object sender, EventArgs e)
        {
            string query = "revokePriv objectname priv obj";
            object[] parameter = { textBoxGrantUserGrantee.Text, comboBoxGrantUserPriv.Text, textBoxGrantUserObject.Text};
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonAlterUserPriv_Click(object sender, EventArgs e)
        {
            string query = "alterUserOrRole objectname obj priv";
            object[] parameter = { textBoxGrantUserGrantee.Text, "user", comboBoxGrantUserPriv.Text };//Cần nhập quyền vào para 3
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        

        //### Role ###\\

        private void buttonCreateRole_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn tạo vai trò " + textBoxRoleName.Text + "?", "Tạo vai trò", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }

            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "create", "role", textBoxRoleName.Text, textBoxRolePassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonDropRole_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn xóa vai trò " + textBoxRoleName.Text + "?", "Xóa vai trò", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "delete", "role", textBoxRoleName.Text, textBoxRolePassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonAlterRole_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn đổi mật khẩu vai trò " + textBoxRoleName.Text + "?", "Sửa vai trò", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "update", "role", textBoxRoleName.Text, textBoxRolePassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }


        //### Phân quyền role ###\\
        private void buttonGrantRolePriv_Click(object sender, EventArgs e)
        {
            string query = "grantPriv priv cot obj objectname WRO";
            object[] parameter = { comboBoxGrantRolePriv.Text, textBoxGrantRoleColumn.Text, textBoxGrantRoleObject.Text, textBoxGrantRoleGrantee.Text, comboBoxGrantRoleAdminOption.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonRevokeRolePriv_Click(object sender, EventArgs e)
        {
            string query = "revokePriv objectname priv obj";
            object[] parameter = { textBoxGrantRoleGrantee.Text, comboBoxGrantRolePriv.Text, textBoxGrantRoleObject.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonAlterRolePriv_Click(object sender, EventArgs e)
        {
            string query = "alterUserOrRole objectname obj priv";
            object[] parameter = { textBoxGrantRoleGrantee.Text, "role", comboBoxGrantRolePriv.Text };//Cần nhập quyền vào para 3
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonShowRecentUserPriv_Click(object sender, EventArgs e)
        {
            string query = "select u.username, s.grantee, r.granted_role, s.privilege " +
                "from all_users u left " +
                 "join dba_sys_privs s on u.username = s.grantee left " +
                    "join dba_role_privs r on r.grantee = s.grantee "
                      + "where u.username = '" + textBoxGrantUserGrantee.Text + "'";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowAllUser.DataSource = data;
        }

        private void buttonShowRecentRolePriv_Click(object sender, EventArgs e)
        {

            string query = "select dr.grantee, dr.granted_role, rs.privilege as sysprivs, rs.admin_option," +
                   "rt.table_name, rt.privilege as tabbleprivs, rt.owner" +
                    " from dba_role_privs dr join role_sys_privs rs on dr.granted_role = rs.role" +
                    " join role_tab_privs rt on rt.role = dr.granted_role" +
                        " where dr.grantee = '" + textBoxGrantRoleGrantee.Text + "'";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dataGridViewRole.DataSource = data;
        }
    }
}

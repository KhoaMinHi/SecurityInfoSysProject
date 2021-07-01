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
            string query = "select u.username as TENNGUOIDUNG, U.user_id as ID, u.account_status as trangthaitaikhoan,  " +
                "p.privilege as quyen, p.admin_option as chiase, u.lock_date as ngaybikhoa, u.expiry_date as ngayhethang, " +
                "u.created as ngaytao, u.last_login as ngaydangnhapgannhat, u.password_change_date as ngaydoimatkhau " +
                "from dba_sys_privs p join dba_users u on p.grantee = u.username";
            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowAllUser.DataSource = data;
        }

        private void dtgvShowAllUser_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void buttonShowUserPriv_Click(object sender, EventArgs e)
        {
            string query = "select o.owner as chusohuu, o.object_name as tendoituong, o.object_type as loai ," +
                " t.grantee as nguoiduocquyenBang,t.privilege as quyen " +
                "from dba_objects o left join dba_tab_privs t on o.object_name = t.table_name";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowAllUser.DataSource = data;
        }

        //### Tạo user ###\\
        private void buttonCreateUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn tạo người dùng " + comboBoxUserName.Text + "?", "Tạo người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(yesno == DialogResult.No)
            {
                return;
            }

            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "create", "user", comboBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);

        }

        private void buttonDropUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn xóa người dùng " + comboBoxUserName.Text + "?", "Xóa người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "delete", "user", comboBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonAlterUser_Click(object sender, EventArgs e)
        {
            var yesno = MessageBox.Show("Bạn có muốn đổi mật khẩu người dùng " + comboBoxUserName.Text + "?", "Sửa người dùng", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (yesno == DialogResult.No)
            {
                return;
            }
            string query = "CDUUSERORROLE CDU obj objectname pass";
            object[] parameter = { "update", "user", comboBoxUserName.Text, textBoxUserPassWord.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }


        //### Phân quyền trên user ###\\
        private void buttonGrantUser_Click(object sender, EventArgs e)
        {
            string query = "grantPriv priv cot obj objectname WRO";
            object[] parameter = { comboBoxGrantUserPriv.Text, textBoxGrantUserColumn.Text, comboBoxGrantUserObject.Text, textBoxGrantUserGrantee.Text, comboBoxGrantUserAdminOption.Text };
            DataProvider.Instance.ExecuteParameterNonQuery(query, "procedure", parameter);
        }

        private void buttonRevokeUserPriv_Click(object sender, EventArgs e)
        {
            string query = "revokePriv objectname priv obj";
            object[] parameter = { textBoxGrantUserGrantee.Text, comboBoxGrantUserPriv.Text, comboBoxGrantUserObject.Text};
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

            string query = "select dr.granted_role, dr.grantee, rs.privilege as quyenhethong, dr.admin_option,"
                  +  " rt.table_name, rt.privilege as quyentrenbang, rt.owner" 
               + " from dba_role_privs dr left join role_sys_privs rs on dr.granted_role = rs.role"
                    +" left join role_tab_privs rt on rt.role = dr.granted_role"
                + " where dr.granted_role = '" + textBoxGrantRoleGrantee.Text + "'";
                
            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dataGridViewRole.DataSource = data;
        }

        private void buttonShowAudited_Click(object sender, EventArgs e)
        {
            if(comboBoxAuditedActivity.Text == "logon-logff")
            {
                string query = "select audit_type, session_id, db_user, os_user, statement_type, " +
                    "extended_timestamp as" + "\"thuc hien luc\"" + " from dba_common_audit_trail;";  //\" get "

                DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
                dataGridViewAudit.DataSource = data;
            }
            else if(comboBoxAuditedActivity.Text == "tieptan-xoasua-hosobenhnhan")
            {
                string query = "select audit_type, db_user, os_user, object_schema, object_name, statement_type," +
                    "sql_text, extended_timestamp from dba_common_audit_trail " +
                    " where statement_type = 'UPDATE' OR statement_type = 'DELETE'";

                DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
                dataGridViewAudit.DataSource = data;
            }
            else if(comboBoxAuditedActivity.Text == "nhanvientaivu-capnhat-tienluong")
            {
                string query = "select db_user, os_user, object_schema, policy_name, sql_text, statement_type, " +
                    "extended_timestamp from dba_fga_audit_trail;";

                DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
                dataGridViewAudit.DataSource = data;
            }

               
        }

        private void comboBoxUserPositions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void buttonShowKeyEncrypted_Click(object sender, EventArgs e)
        {
            string query = "SELECT K.MAKB, k.keystring, h.makb, h.ketluanbs, F_MYDECRYPTION(h.ketluanbs, k.keystring) " +
                "FROM BV_SCHEMA.hosobenhnhankeytable K JOIN  BV_SCHEMA.HOSOKB H ON K.MAKB = H.MAKB";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dataGridViewShowKeyEncrypted.DataSource = data;
        }

        private void buttonShowListRole_Click(object sender, EventArgs e)
        {
            string query = "select * from dba_roles";

            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dataGridViewRole.DataSource = data;
        }
    }
}

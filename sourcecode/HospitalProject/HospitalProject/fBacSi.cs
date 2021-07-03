using HospitalProject.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HospitalProject
{
    public partial class fBacSi : Form
    {
        public fBacSi()
        {
            InitializeComponent();
        }


        void updateDoctorConclusionBidingTEXTBOXMEDICAL()
        {
            textBoxMedicalExaminationCode2Updat.DataBindings.Add(new Binding("Text", textBoxMedicalExaminationCode, "Text"));
            textBoxMedicalExaminationCode2Updat.DataBindings.Clear();
            
        }
        private void buttonUpdateDoctorConclusion_Click(object sender, EventArgs e)
        {
            string query = "update bv_schema.hosokb set ketluanbs = '" + textBoxEnterDoctorConclusion.Text;         
            

            if (textBoxMedicalExaminationCode2Updat.Text != "")
            {
                query += "' where makb = " + textBoxMedicalExaminationCode2Updat.Text;
            }
            DataProvider.Instance.ExecuteParameterNonQuery(query);
        }

        private void textBoxMedicalExaminationCode_TextChanged(object sender, EventArgs e)
        {
            updateDoctorConclusionBidingTEXTBOXMEDICAL();
        }

        private void dtgvShowPatients_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBoxMedicalExaminationCode2Updat.DataBindings.Add(new Binding("Text", dtgvShowPatients.DataSource, "makb", true, DataSourceUpdateMode.OnValidation));
            textBoxMedicalExaminationCode2Updat.DataBindings.Clear();
        }

        private void buttonSearchPatients_Click(object sender, EventArgs e)
        {
            string query = "select h.manv_don as bacsi, b.mabn, b.tenbn, h.makb, h.trieuchung, SYS.F_MYDECRYPTION(h.ketluanbs, k.keystring), h.ngaykb" +
            " from bv_schema.benhnhan b join BV_SCHEMA.hosokb h on h.mabn = b.mabn " +
            " left JOIN BV_SCHEMA.hosobenhnhankeytable k on k.makb = h.makb";

            if (textBoxMedicalExaminationCode.Text != "")
            {
                query += " where h.makb = " + textBoxMedicalExaminationCode.Text;
            }
            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dtgvShowPatients.DataSource = data;
        }

        private void buttonShowDoctorSalary_Click(object sender, EventArgs e)
        {
            string query = "select * from BV_SCHEMA.NHANVIEN";

        
            DataTable data = DataProvider.Instance.ExecuteParameterQuery(query);
            dataGridViewShowSalaryDoctor.DataSource = data;
        }
    }
}

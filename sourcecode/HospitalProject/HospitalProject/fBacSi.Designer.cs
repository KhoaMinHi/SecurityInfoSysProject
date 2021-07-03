
namespace HospitalProject
{
    partial class fBacSi
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabPageUser = new System.Windows.Forms.TabPage();
            this.panel4 = new System.Windows.Forms.Panel();
            this.buttonSearchPatients = new System.Windows.Forms.Button();
            this.dateTimePickerMedicalExamination = new System.Windows.Forms.DateTimePicker();
            this.comboBoxPatientName = new System.Windows.Forms.ComboBox();
            this.textBoxPatientID = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.textBoxMedicalExaminationCode = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.textBoxEnterDoctorConclusion = new System.Windows.Forms.TextBox();
            this.buttonUpdateDoctorConclusion = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.textBoxMedicalExaminationCode2Updat = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.dtgvShowPatients = new System.Windows.Forms.DataGridView();
            this.tabControlAdmin = new System.Windows.Forms.TabControl();
            this.tabPageShowDoctorSalary = new System.Windows.Forms.TabPage();
            this.dataGridViewShowSalaryDoctor = new System.Windows.Forms.DataGridView();
            this.buttonShowDoctorSalary = new System.Windows.Forms.Button();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPageUser.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvShowPatients)).BeginInit();
            this.tabControlAdmin.SuspendLayout();
            this.tabPageShowDoctorSalary.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewShowSalaryDoctor)).BeginInit();
            this.SuspendLayout();
            // 
            // tabPageUser
            // 
            this.tabPageUser.Controls.Add(this.panel4);
            this.tabPageUser.Controls.Add(this.panel2);
            this.tabPageUser.Controls.Add(this.dtgvShowPatients);
            this.tabPageUser.Location = new System.Drawing.Point(4, 25);
            this.tabPageUser.Name = "tabPageUser";
            this.tabPageUser.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageUser.Size = new System.Drawing.Size(1085, 563);
            this.tabPageUser.TabIndex = 0;
            this.tabPageUser.Text = "Bệnh nhân";
            this.tabPageUser.UseVisualStyleBackColor = true;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.buttonSearchPatients);
            this.panel4.Controls.Add(this.dateTimePickerMedicalExamination);
            this.panel4.Controls.Add(this.comboBoxPatientName);
            this.panel4.Controls.Add(this.textBoxPatientID);
            this.panel4.Controls.Add(this.label7);
            this.panel4.Controls.Add(this.label1);
            this.panel4.Controls.Add(this.label11);
            this.panel4.Controls.Add(this.label8);
            this.panel4.Controls.Add(this.label9);
            this.panel4.Controls.Add(this.textBoxMedicalExaminationCode);
            this.panel4.Controls.Add(this.label4);
            this.panel4.Location = new System.Drawing.Point(661, 6);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(418, 211);
            this.panel4.TabIndex = 5;
            // 
            // buttonSearchPatients
            // 
            this.buttonSearchPatients.Location = new System.Drawing.Point(326, 162);
            this.buttonSearchPatients.Name = "buttonSearchPatients";
            this.buttonSearchPatients.Size = new System.Drawing.Size(75, 36);
            this.buttonSearchPatients.TabIndex = 6;
            this.buttonSearchPatients.TabStop = false;
            this.buttonSearchPatients.Text = "Tìm";
            this.buttonSearchPatients.UseVisualStyleBackColor = true;
            this.buttonSearchPatients.Click += new System.EventHandler(this.buttonSearchPatients_Click);
            // 
            // dateTimePickerMedicalExamination
            // 
            this.dateTimePickerMedicalExamination.Location = new System.Drawing.Point(129, 100);
            this.dateTimePickerMedicalExamination.Name = "dateTimePickerMedicalExamination";
            this.dateTimePickerMedicalExamination.Size = new System.Drawing.Size(271, 22);
            this.dateTimePickerMedicalExamination.TabIndex = 11;
            // 
            // comboBoxPatientName
            // 
            this.comboBoxPatientName.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.comboBoxPatientName.FormattingEnabled = true;
            this.comboBoxPatientName.Location = new System.Drawing.Point(129, 28);
            this.comboBoxPatientName.Name = "comboBoxPatientName";
            this.comboBoxPatientName.Size = new System.Drawing.Size(272, 24);
            this.comboBoxPatientName.TabIndex = 10;
            // 
            // textBoxPatientID
            // 
            this.textBoxPatientID.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxPatientID.Location = new System.Drawing.Point(129, 65);
            this.textBoxPatientID.Name = "textBoxPatientID";
            this.textBoxPatientID.Size = new System.Drawing.Size(272, 22);
            this.textBoxPatientID.TabIndex = 5;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(3, 125);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(0, 17);
            this.label7.TabIndex = 8;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(131, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "TẠO NGƯỜI DÙNG";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(9, 100);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(83, 17);
            this.label11.TabIndex = 7;
            this.label11.Text = "Ngày khám:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(9, 66);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(103, 17);
            this.label8.TabIndex = 7;
            this.label8.Text = "Mã bệnh nhân:";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(9, 35);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(37, 17);
            this.label9.TabIndex = 2;
            this.label9.Text = "Tên:";
            // 
            // textBoxMedicalExaminationCode
            // 
            this.textBoxMedicalExaminationCode.Location = new System.Drawing.Point(129, 134);
            this.textBoxMedicalExaminationCode.Name = "textBoxMedicalExaminationCode";
            this.textBoxMedicalExaminationCode.Size = new System.Drawing.Size(272, 22);
            this.textBoxMedicalExaminationCode.TabIndex = 10;
            this.textBoxMedicalExaminationCode.TextChanged += new System.EventHandler(this.textBoxMedicalExaminationCode_TextChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(9, 137);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(105, 17);
            this.label4.TabIndex = 0;
            this.label4.Text = "Mã khám bệnh:";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.textBoxEnterDoctorConclusion);
            this.panel2.Controls.Add(this.buttonUpdateDoctorConclusion);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.textBoxMedicalExaminationCode2Updat);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(661, 236);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(418, 306);
            this.panel2.TabIndex = 4;
            // 
            // textBoxEnterDoctorConclusion
            // 
            this.textBoxEnterDoctorConclusion.Location = new System.Drawing.Point(129, 67);
            this.textBoxEnterDoctorConclusion.MinimumSize = new System.Drawing.Size(250, 100);
            this.textBoxEnterDoctorConclusion.Name = "textBoxEnterDoctorConclusion";
            this.textBoxEnterDoctorConclusion.Size = new System.Drawing.Size(272, 22);
            this.textBoxEnterDoctorConclusion.TabIndex = 17;
            // 
            // buttonUpdateDoctorConclusion
            // 
            this.buttonUpdateDoctorConclusion.Location = new System.Drawing.Point(325, 95);
            this.buttonUpdateDoctorConclusion.Name = "buttonUpdateDoctorConclusion";
            this.buttonUpdateDoctorConclusion.Size = new System.Drawing.Size(75, 36);
            this.buttonUpdateDoctorConclusion.TabIndex = 15;
            this.buttonUpdateDoctorConclusion.TabStop = false;
            this.buttonUpdateDoctorConclusion.Text = "Cập nhật";
            this.buttonUpdateDoctorConclusion.UseVisualStyleBackColor = true;
            this.buttonUpdateDoctorConclusion.Click += new System.EventHandler(this.buttonUpdateDoctorConclusion_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 4);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 17);
            this.label2.TabIndex = 7;
            this.label2.Text = "KẾT LUẬN BỆNH";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(9, 67);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(100, 17);
            this.label5.TabIndex = 7;
            this.label5.Text = "Nhập kết luận:";
            // 
            // textBoxMedicalExaminationCode2Updat
            // 
            this.textBoxMedicalExaminationCode2Updat.Location = new System.Drawing.Point(129, 29);
            this.textBoxMedicalExaminationCode2Updat.Name = "textBoxMedicalExaminationCode2Updat";
            this.textBoxMedicalExaminationCode2Updat.Size = new System.Drawing.Size(272, 22);
            this.textBoxMedicalExaminationCode2Updat.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 32);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(105, 17);
            this.label3.TabIndex = 0;
            this.label3.Text = "Mã khám bệnh:";
            // 
            // dtgvShowPatients
            // 
            this.dtgvShowPatients.ColumnHeadersHeight = 29;
            this.dtgvShowPatients.Location = new System.Drawing.Point(6, 6);
            this.dtgvShowPatients.Name = "dtgvShowPatients";
            this.dtgvShowPatients.RowHeadersWidth = 51;
            this.dtgvShowPatients.RowTemplate.Height = 24;
            this.dtgvShowPatients.Size = new System.Drawing.Size(649, 551);
            this.dtgvShowPatients.TabIndex = 0;
            this.dtgvShowPatients.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvShowPatients_CellContentClick);
            // 
            // tabControlAdmin
            // 
            this.tabControlAdmin.Controls.Add(this.tabPageUser);
            this.tabControlAdmin.Controls.Add(this.tabPageShowDoctorSalary);
            this.tabControlAdmin.Controls.Add(this.tabPage1);
            this.tabControlAdmin.Location = new System.Drawing.Point(-4, 2);
            this.tabControlAdmin.Name = "tabControlAdmin";
            this.tabControlAdmin.SelectedIndex = 0;
            this.tabControlAdmin.Size = new System.Drawing.Size(1093, 592);
            this.tabControlAdmin.TabIndex = 4;
            // 
            // tabPageShowDoctorSalary
            // 
            this.tabPageShowDoctorSalary.Controls.Add(this.buttonShowDoctorSalary);
            this.tabPageShowDoctorSalary.Controls.Add(this.dataGridViewShowSalaryDoctor);
            this.tabPageShowDoctorSalary.Location = new System.Drawing.Point(4, 25);
            this.tabPageShowDoctorSalary.Name = "tabPageShowDoctorSalary";
            this.tabPageShowDoctorSalary.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageShowDoctorSalary.Size = new System.Drawing.Size(1085, 563);
            this.tabPageShowDoctorSalary.TabIndex = 1;
            this.tabPageShowDoctorSalary.Text = "Xem lương";
            this.tabPageShowDoctorSalary.UseVisualStyleBackColor = true;
            // 
            // dataGridViewShowSalaryDoctor
            // 
            this.dataGridViewShowSalaryDoctor.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewShowSalaryDoctor.Location = new System.Drawing.Point(3, 3);
            this.dataGridViewShowSalaryDoctor.Name = "dataGridViewShowSalaryDoctor";
            this.dataGridViewShowSalaryDoctor.RowHeadersWidth = 51;
            this.dataGridViewShowSalaryDoctor.RowTemplate.Height = 24;
            this.dataGridViewShowSalaryDoctor.Size = new System.Drawing.Size(695, 427);
            this.dataGridViewShowSalaryDoctor.TabIndex = 0;
            // 
            // buttonShowDoctorSalary
            // 
            this.buttonShowDoctorSalary.Location = new System.Drawing.Point(704, 6);
            this.buttonShowDoctorSalary.Name = "buttonShowDoctorSalary";
            this.buttonShowDoctorSalary.Size = new System.Drawing.Size(90, 34);
            this.buttonShowDoctorSalary.TabIndex = 1;
            this.buttonShowDoctorSalary.Text = "Xem lương";
            this.buttonShowDoctorSalary.UseVisualStyleBackColor = true;
            this.buttonShowDoctorSalary.Click += new System.EventHandler(this.buttonShowDoctorSalary_Click);
            // 
            // tabPage1
            // 
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1085, 563);
            this.tabPage1.TabIndex = 2;
            this.tabPage1.Text = "tabPage1";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // fBacSi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1101, 628);
            this.Controls.Add(this.tabControlAdmin);
            this.Name = "fBacSi";
            this.Text = "fBacSi";
            this.tabPageUser.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvShowPatients)).EndInit();
            this.tabControlAdmin.ResumeLayout(false);
            this.tabPageShowDoctorSalary.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewShowSalaryDoctor)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage tabPageUser;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.ComboBox comboBoxPatientName;
        private System.Windows.Forms.TextBox textBoxPatientID;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button buttonSearchPatients;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button buttonUpdateDoctorConclusion;
        private System.Windows.Forms.TextBox textBoxMedicalExaminationCode;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.DataGridView dtgvShowPatients;
        private System.Windows.Forms.TabControl tabControlAdmin;
        private System.Windows.Forms.DateTimePicker dateTimePickerMedicalExamination;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox textBoxMedicalExaminationCode2Updat;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxEnterDoctorConclusion;
        private System.Windows.Forms.TabPage tabPageShowDoctorSalary;
        private System.Windows.Forms.Button buttonShowDoctorSalary;
        private System.Windows.Forms.DataGridView dataGridViewShowSalaryDoctor;
        private System.Windows.Forms.TabPage tabPage1;
    }
}
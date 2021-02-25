namespace Integrador.Formularios.Reportes
{
    partial class frmReporteEmpleados
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
            this.components = new System.ComponentModel.Container();
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource1 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.empleadosDS = new Integrador.EmpleadosDS();
            this.empleadosDSBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spMostrarEmpleadoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sp_MostrarEmpleadoTableAdapter = new Integrador.EmpleadosDSTableAdapters.sp_MostrarEmpleadoTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.empleadosDS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.empleadosDSBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarEmpleadoBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "EmpleadosDataSet";
            reportDataSource1.Value = this.spMostrarEmpleadoBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "Integrador.RptEmpleados.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(800, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // empleadosDS
            // 
            this.empleadosDS.DataSetName = "EmpleadosDS";
            this.empleadosDS.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // empleadosDSBindingSource
            // 
            this.empleadosDSBindingSource.DataSource = this.empleadosDS;
            this.empleadosDSBindingSource.Position = 0;
            // 
            // spMostrarEmpleadoBindingSource
            // 
            this.spMostrarEmpleadoBindingSource.DataMember = "sp_MostrarEmpleado";
            this.spMostrarEmpleadoBindingSource.DataSource = this.empleadosDSBindingSource;
            // 
            // sp_MostrarEmpleadoTableAdapter
            // 
            this.sp_MostrarEmpleadoTableAdapter.ClearBeforeFill = true;
            // 
            // frmReporteEmpleados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReporteEmpleados";
            this.Text = "frmReporteEmpleados";
            this.Load += new System.EventHandler(this.frmReporteEmpleados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.empleadosDS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.empleadosDSBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarEmpleadoBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private EmpleadosDS empleadosDS;
        private System.Windows.Forms.BindingSource empleadosDSBindingSource;
        private System.Windows.Forms.BindingSource spMostrarEmpleadoBindingSource;
        private EmpleadosDSTableAdapters.sp_MostrarEmpleadoTableAdapter sp_MostrarEmpleadoTableAdapter;
    }
}
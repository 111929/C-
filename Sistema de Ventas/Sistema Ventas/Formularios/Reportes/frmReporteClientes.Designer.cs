namespace Integrador.Formularios.Reportes
{
    partial class frmReporteClientes
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
            this.sistemaVentasIntegradorDataSet = new Integrador.SistemaVentasIntegradorDataSet();
            this.spMostrarClientesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sp_MostrarClientesTableAdapter = new Integrador.SistemaVentasIntegradorDataSetTableAdapters.sp_MostrarClientesTableAdapter();
            this.sistemaVentasIntegradorDataSet1 = new Integrador.SistemaVentasIntegradorDataSet1();
            this.sistemaVentasIntegradorDataSet1BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.spMostrarClientesBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.sp_MostrarClientesTableAdapter1 = new Integrador.SistemaVentasIntegradorDataSet1TableAdapters.sp_MostrarClientesTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarClientesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet1BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarClientesBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            reportDataSource1.Name = "ClienteDataSet";
            reportDataSource1.Value = this.spMostrarClientesBindingSource1;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource1);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "Integrador.RptCliente.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(0, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(800, 450);
            this.reportViewer1.TabIndex = 0;
            // 
            // sistemaVentasIntegradorDataSet
            // 
            this.sistemaVentasIntegradorDataSet.DataSetName = "SistemaVentasIntegradorDataSet";
            this.sistemaVentasIntegradorDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // spMostrarClientesBindingSource
            // 
            this.spMostrarClientesBindingSource.DataMember = "sp_MostrarClientes";
            this.spMostrarClientesBindingSource.DataSource = this.sistemaVentasIntegradorDataSet;
            // 
            // sp_MostrarClientesTableAdapter
            // 
            this.sp_MostrarClientesTableAdapter.ClearBeforeFill = true;
            // 
            // sistemaVentasIntegradorDataSet1
            // 
            this.sistemaVentasIntegradorDataSet1.DataSetName = "SistemaVentasIntegradorDataSet1";
            this.sistemaVentasIntegradorDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // sistemaVentasIntegradorDataSet1BindingSource
            // 
            this.sistemaVentasIntegradorDataSet1BindingSource.DataSource = this.sistemaVentasIntegradorDataSet1;
            this.sistemaVentasIntegradorDataSet1BindingSource.Position = 0;
            // 
            // spMostrarClientesBindingSource1
            // 
            this.spMostrarClientesBindingSource1.DataMember = "sp_MostrarClientes";
            this.spMostrarClientesBindingSource1.DataSource = this.sistemaVentasIntegradorDataSet1BindingSource;
            // 
            // sp_MostrarClientesTableAdapter1
            // 
            this.sp_MostrarClientesTableAdapter1.ClearBeforeFill = true;
            // 
            // frmReporteClientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReporteClientes";
            this.Text = "frmReporteClientes";
            this.Load += new System.EventHandler(this.frmReporteClientes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarClientesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sistemaVentasIntegradorDataSet1BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarClientesBindingSource1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private SistemaVentasIntegradorDataSet sistemaVentasIntegradorDataSet;
        private System.Windows.Forms.BindingSource spMostrarClientesBindingSource;
        private SistemaVentasIntegradorDataSetTableAdapters.sp_MostrarClientesTableAdapter sp_MostrarClientesTableAdapter;
        private SistemaVentasIntegradorDataSet1 sistemaVentasIntegradorDataSet1;
        private System.Windows.Forms.BindingSource sistemaVentasIntegradorDataSet1BindingSource;
        private System.Windows.Forms.BindingSource spMostrarClientesBindingSource1;
        private SistemaVentasIntegradorDataSet1TableAdapters.sp_MostrarClientesTableAdapter sp_MostrarClientesTableAdapter1;
    }
}
namespace Integrador.Formularios.Reportes
{
    partial class frmReporteArticulos
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
            Microsoft.Reporting.WinForms.ReportDataSource reportDataSource3 = new Microsoft.Reporting.WinForms.ReportDataSource();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.articulosDataSet = new Integrador.ArticulosDataSet();
            this.articulosDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.articulosBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.articulosTableAdapter = new Integrador.ArticulosDataSetTableAdapters.ArticulosTableAdapter();
            this.articulosBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.articuloDataSet = new Integrador.ArticuloDataSet();
            this.spMostrarArticulosBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sp_MostrarArticulosTableAdapter = new Integrador.ArticuloDataSetTableAdapters.sp_MostrarArticulosTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.articulosDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.articuloDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarArticulosBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            reportDataSource3.Name = "ArticulosDS";
            reportDataSource3.Value = this.spMostrarArticulosBindingSource;
            this.reportViewer1.LocalReport.DataSources.Add(reportDataSource3);
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "Integrador.RptArticulo.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(-1, 1);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(802, 409);
            this.reportViewer1.TabIndex = 0;
            // 
            // articulosDataSet
            // 
            this.articulosDataSet.DataSetName = "ArticulosDataSet";
            this.articulosDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // articulosDataSetBindingSource
            // 
            this.articulosDataSetBindingSource.DataSource = this.articulosDataSet;
            this.articulosDataSetBindingSource.Position = 0;
            // 
            // articulosBindingSource
            // 
            this.articulosBindingSource.DataMember = "Articulos";
            this.articulosBindingSource.DataSource = this.articulosDataSetBindingSource;
            // 
            // articulosTableAdapter
            // 
            this.articulosTableAdapter.ClearBeforeFill = true;
            // 
            // articulosBindingSource1
            // 
            this.articulosBindingSource1.DataMember = "Articulos";
            this.articulosBindingSource1.DataSource = this.articulosDataSetBindingSource;
            // 
            // articuloDataSet
            // 
            this.articuloDataSet.DataSetName = "ArticuloDataSet";
            this.articuloDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // spMostrarArticulosBindingSource
            // 
            this.spMostrarArticulosBindingSource.DataMember = "sp_MostrarArticulos";
            this.spMostrarArticulosBindingSource.DataSource = this.articuloDataSet;
            // 
            // sp_MostrarArticulosTableAdapter
            // 
            this.sp_MostrarArticulosTableAdapter.ClearBeforeFill = true;
            // 
            // frmReporteArticulos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReporteArticulos";
            this.Text = "frmReporteArticulos";
            this.Load += new System.EventHandler(this.frmReporteArticulos_Load);
            ((System.ComponentModel.ISupportInitialize)(this.articulosDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.articulosBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.articuloDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spMostrarArticulosBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private ArticulosDataSet articulosDataSet;
        private System.Windows.Forms.BindingSource articulosDataSetBindingSource;
        private System.Windows.Forms.BindingSource articulosBindingSource;
        private ArticulosDataSetTableAdapters.ArticulosTableAdapter articulosTableAdapter;
        private System.Windows.Forms.BindingSource articulosBindingSource1;
        private ArticuloDataSet articuloDataSet;
        private System.Windows.Forms.BindingSource spMostrarArticulosBindingSource;
        private ArticuloDataSetTableAdapters.sp_MostrarArticulosTableAdapter sp_MostrarArticulosTableAdapter;
    }
}
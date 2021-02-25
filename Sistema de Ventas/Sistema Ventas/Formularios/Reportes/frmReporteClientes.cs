using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Reportes
{
    public partial class frmReporteClientes : Form
    {
        public frmReporteClientes()
        {
            InitializeComponent();
        }

        private void frmReporteClientes_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'sistemaVentasIntegradorDataSet1.sp_MostrarClientes' Puede moverla o quitarla según sea necesario.
            this.sp_MostrarClientesTableAdapter1.Fill(this.sistemaVentasIntegradorDataSet1.sp_MostrarClientes);
            

            this.reportViewer1.RefreshReport();
        }
    }
}

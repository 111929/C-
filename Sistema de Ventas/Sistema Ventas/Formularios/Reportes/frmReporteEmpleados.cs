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
    public partial class frmReporteEmpleados : Form
    {
        public frmReporteEmpleados()
        {
            InitializeComponent();
        }

        private void frmReporteEmpleados_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'empleadosDS.sp_MostrarEmpleado' Puede moverla o quitarla según sea necesario.
            this.sp_MostrarEmpleadoTableAdapter.Fill(this.empleadosDS.sp_MostrarEmpleado);

            this.reportViewer1.RefreshReport();
        }
    }
}

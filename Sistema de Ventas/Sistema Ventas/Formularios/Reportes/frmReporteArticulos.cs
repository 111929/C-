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
    public partial class frmReporteArticulos : Form
    {

        Clases.Conexion conexion = new Clases.Conexion();
        
        
        public frmReporteArticulos()
        {
            InitializeComponent();
        }

        private void frmReporteArticulos_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'articuloDataSet.sp_MostrarArticulos' Puede moverla o quitarla según sea necesario.
            this.sp_MostrarArticulosTableAdapter.Fill(this.articuloDataSet.sp_MostrarArticulos);
            // TODO: esta línea de código carga datos en la tabla 'articulosDataSet.Articulos' Puede moverla o quitarla según sea necesario.
            this.articulosTableAdapter.Fill(this.articulosDataSet.Articulos);
            
            this.reportViewer1.RefreshReport();
        }

       
    }
}

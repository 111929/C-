using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Empleados
{
    public partial class frmListarEmpleados : Form
    {
        Clases.Empleado e = new Clases.Empleado();
        public frmListarEmpleados()
        {
            InitializeComponent();
        }

        public void Cargardtg()
        {

            if (rbtNombre.Checked)
            {
                dtgListadoEmpleados.DataSource = e.BuscarEmpleadoPorNombre(txtBuscaremp.Text);

            }
            else
            {
                dtgListadoEmpleados.DataSource = e.BuscarEmpleadoPorDNI(txtBuscaremp.Text);

            }
        }

        public void AlternarColorFilasDtg(DataGridView dtg)
        {
            dtg.RowsDefaultCellStyle.BackColor = Color.GhostWhite;
            dtg.AlternatingRowsDefaultCellStyle.BackColor = Color.White;
        }

        private void frmListarEmpleados_Load(object sender, EventArgs e)
        {
            AlternarColorFilasDtg(dtgListadoEmpleados);
            Cargardtg();
            txtBuscaremp.Focus();
            rbtNombre.Checked = true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Cargardtg();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Clientes
{
    public partial class frmListarClientes : Form
    {
        Clases.Cliente c = new Clases.Cliente();
        public frmListarClientes()
        {
            InitializeComponent();
        }

        public void Cargardtg()
        {

            if (rbtNombre.Checked)
            {
                dtgListadoCliente.DataSource = c.BuscarClientePorNombre(textBox1.Text);
                
            }
            else
            {
                dtgListadoCliente.DataSource = c.BuscarClientePorDNI(textBox1.Text);
                
            }
   
        }



        public void AlternarColorFilasDtg(DataGridView dtg)
        {
            dtg.RowsDefaultCellStyle.BackColor = Color.GhostWhite;
            dtg.AlternatingRowsDefaultCellStyle.BackColor = Color.White;
        }

        private void frmListarClientes_Load(object sender, EventArgs e)
        {
            AlternarColorFilasDtg(dtgListadoCliente);
            Cargardtg();
            rbtNombre.Checked = true;
            textBox1.Focus();
            
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

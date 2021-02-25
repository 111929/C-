using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Articulos
{
    public partial class frmListarArticulos : Form
    {
        Clases.Articulo a = new Clases.Articulo();


        public frmListarArticulos()
        {
            InitializeComponent();
        }


        public void Cargardtg()
        {

            if (rbtNombre.Checked)
            {
                dtgListadoArticulos.DataSource = a.BuscarArticuloPorNombre(txtBuscarArt.Text);

            }
            else
            {
                dtgListadoArticulos.DataSource = a.BuscarArticuloPorCodigo(txtBuscarArt.Text);

            }

        }

        public void AlternarColorFilasDtg(DataGridView dtg)
        {
            dtg.RowsDefaultCellStyle.BackColor = Color.GhostWhite;
            dtg.AlternatingRowsDefaultCellStyle.BackColor = Color.White;
        }

        private void frmListarArticulos_Load(object sender, EventArgs e)
        {
            AlternarColorFilasDtg(dtgListadoArticulos);
            Cargardtg();
            txtBuscarArt.Focus();
            rbtNombre.Checked = true;
            txtBuscarArt.Focus();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void txtBuscarArt_TextChanged(object sender, EventArgs e)
        {
            Cargardtg();
        }
    }
}

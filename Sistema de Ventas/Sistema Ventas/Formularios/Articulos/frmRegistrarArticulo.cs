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
    public partial class frmRegistrarArticulo : Form
    {

        List<Clases.Articulo> ar = new List<Clases.Articulo>();
        Clases.Articulo ObjetoArticulo = new Clases.Articulo();
        Clases.Conexion conexion = new Clases.Conexion();
        Clases.Categoria c = new Clases.Categoria();
        Clases.Presentacion p = new Clases.Presentacion();
        Clases.Marca m = new Clases.Marca();

        public frmRegistrarArticulo()
        {
            InitializeComponent();
        }

        private void RegistroCorrecto()
        {
            pnlEditarElim.Visible = true;
            pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
            lblEditElim.ForeColor = Color.White;
            lblEditElim.Text = "Artículo registrado correctamente...";
        }

        //Metodo para limpiar campos

        private void Limpiar()
        {
            txtDescripcion.Clear();
            txtprecioVenta.Clear();
            txtProducto.Clear();
            txtStock.Clear();
            cboCategoria.SelectedIndex = -1;
            cboMarca.SelectedIndex = -1;
            cboPresentacion.SelectedIndex = -1;

        }



        public void InsertarArticulos(string nom, string descripcion, int marca, int categoria, decimal precio, int presentacion, int stock)
        {
            Clases.Articulo a = new Clases.Articulo();
            a.pNombre = nom;
            a.pDescripcion = descripcion;
            a.pMarca = marca;
            a.pCategoria = categoria;
            a.pPrecioVenta = precio;
            a.pPresentacion = presentacion;
            a.pStock = stock;

            ObjetoArticulo.InsertarArticulos(a);
        }



        private void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (txtProducto.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtProducto.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtDescripcion.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtDescripcion.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtprecioVenta.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtprecioVenta.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtStock.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtStock.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtProducto.Text!=""&&txtDescripcion.Text!=""&&txtprecioVenta.Text!=""&&txtStock.Text!="")
            {
                InsertarArticulos(txtProducto.Text, txtDescripcion.Text, (int)cboMarca.SelectedValue, (int)cboCategoria.SelectedValue, decimal.Parse(txtprecioVenta.Text), (int)cboPresentacion.SelectedValue, Convert.ToInt32(txtStock.Text));
                RegistroCorrecto();
                Limpiar();
            }

            
        }

        private void frmRegistrarArticulo_Load(object sender, EventArgs e)
        {
            m.CargarComboMarca(cboMarca);
            p.CargarComboPresentacion(cboPresentacion);
            c.CargarComboCategoria(cboCategoria);
            txtProducto.Focus();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void txtProducto_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtProducto.BackColor = Color.White;
                e.Handled = false;
            }
            else if (char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtDescripcion_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtDescripcion.BackColor = Color.White;
                e.Handled = false;
            }
            else if (char.IsSeparator(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtprecioVenta_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar)
                  || e.KeyChar == ',' || e.KeyChar == '.')
            {
                pnlEditarElim.Visible = false;
                txtprecioVenta.BackColor = Color.White;
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtStock_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))

            {
                pnlEditarElim.Visible = false;
                txtStock.BackColor = Color.White;
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }
    }
}

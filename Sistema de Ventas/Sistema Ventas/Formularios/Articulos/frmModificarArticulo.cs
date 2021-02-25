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
    public partial class frmModificarArticulo : Form
    {
        List<Clases.Articulo> ar = new List<Clases.Articulo>();
        Clases.Articulo ObjetoArticulo = new Clases.Articulo();
        Clases.Conexion conexion = new Clases.Conexion();
        Clases.Categoria c = new Clases.Categoria();
        Clases.Presentacion p = new Clases.Presentacion();
        Clases.Marca m = new Clases.Marca();


        public frmModificarArticulo()
        {
            InitializeComponent();
        }


        private void CargarLista(string nombreTabla)
        {
            ar.Clear();
            conexion.LeerTabla(nombreTabla);
            while (conexion.Lector.Read())
            {
                Clases.Articulo a = new Clases.Articulo();
                if (!conexion.Lector.IsDBNull(0))
                    a.pAriculoId = conexion.Lector.GetInt32(0);
                if (!conexion.Lector.IsDBNull(1))
                    a.pNombre = conexion.Lector.GetString(1);
                if (!conexion.Lector.IsDBNull(2))
                    a.pDescripcion = conexion.Lector.GetString(2);
                if (!conexion.Lector.IsDBNull(3))
                    a.pMarca = conexion.Lector.GetInt32(3);
                if (!conexion.Lector.IsDBNull(4))
                    a.pCategoria = conexion.Lector.GetInt32(4);
                if (!conexion.Lector.IsDBNull(5))
                    a.pPresentacion = conexion.Lector.GetInt32(5);
                if (!conexion.Lector.IsDBNull(6))
                    a.pPrecioVenta = conexion.Lector.GetDecimal(6);
                if (!conexion.Lector.IsDBNull(7))
                    a.pStock = conexion.Lector.GetInt32(7);


                ar.Add(a);
            }
            conexion.Lector.Close();
            conexion.CerrarConexion();
            lstArticulo.Items.Clear();

            for (int i = 0; i < ar.Count; i++)
            {
                lstArticulo.Items.Add(ar[i].toStringArticulos());
            }
            lstArticulo.SelectedIndex = 0;
        }

        public void EditarArticulos(string nombre, string descripcion, int marca, int categoria, decimal precio, int presentacion, int stock,int idart)
        {
            Clases.Articulo a = new Clases.Articulo();
            a.pNombre = nombre;
            a.pDescripcion = descripcion;
            a.pMarca = marca;
            a.pCategoria = categoria;
            a.pPrecioVenta = precio;
            a.pPresentacion = presentacion;
            a.pStock = stock;
            a.pAriculoId = idart;

            ObjetoArticulo.ModificarArticulos(a);
        }

       


        private void EdicionCorrecta()
        {
            pnlEditarElim.Visible = true;
            pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
            lblEditElim.ForeColor = Color.White;
            lblEditElim.Text = "Artículo modificado correctamente...";
        }


        public void EliminarArticulo(int articulo)
        {
            Clases.Articulo a = new Clases.Articulo();
            a.pAriculoId = articulo;
            ObjetoArticulo.EliminarArticulo(a);
        }


        private void EliminacionCorrecta()
        {
            pnlEditarElim.Visible = true;
            pnlEditarElim.BackColor = Color.FromArgb(246, 109, 79);
            lblEditElim.ForeColor = Color.White;
            lblEditElim.Text = "Artículo eliminado correctamente...";
        }


        private void CargarCamposArticulos(int posicion)
        {
            txtCodigo.Text = ar[posicion].pAriculoId.ToString();
            txtProducto.Text = ar[posicion].pNombre.ToString();
            txtDescripcion.Text = ar[posicion].pDescripcion;
            cboMarca.SelectedValue = ar[posicion].pMarca;
            cboCategoria.SelectedValue = ar[posicion].pCategoria;
            cboPresentacion.SelectedValue = ar[posicion].pPresentacion;
            txtPrecioVenta.Text = ar[posicion].pPrecioVenta.ToString();
            txtStock.Text = ar[posicion].pStock.ToString();
        }



        //Metodo para limpiar campos

        private void Limpiar()
        {
            txtCodigo.Clear();
            txtDescripcion.Clear();
            txtPrecioVenta.Clear();
            txtProducto.Clear();
            txtStock.Clear();
            cboCategoria.SelectedIndex = -1;
            cboMarca.SelectedIndex = -1;
            cboPresentacion.SelectedIndex = -1;

        }




        private void btnEditar_Click(object sender, EventArgs e)
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
            if (txtPrecioVenta.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtPrecioVenta.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtStock.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtStock.BackColor = Color.FromArgb(252, 248, 185);

            }
            if (txtProducto.Text != "" && txtDescripcion.Text != "" && txtPrecioVenta.Text != "" && txtStock.Text != "")
            {
                EditarArticulos(txtProducto.Text, txtDescripcion.Text, (int)cboMarca.SelectedValue, (int)cboCategoria.SelectedValue, decimal.Parse(txtPrecioVenta.Text), (int)cboPresentacion.SelectedValue, Convert.ToInt32(txtStock.Text), int.Parse(txtCodigo.Text));
                CargarLista("Articulos");
                EdicionCorrecta();
                Limpiar();
            }



        }

        private void frmModificarArticulo_Load(object sender, EventArgs e)
        {
            CargarLista("Articulos");
            m.CargarComboMarca(cboMarca);
            p.CargarComboPresentacion(cboPresentacion);
            c.CargarComboCategoria(cboCategoria);
            txtCodigo.Enabled = false;
            txtProducto.Focus();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("estas seguro de eliminar esta persona?", "eliminando",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes) 
            {
                EliminarArticulo(int.Parse(txtCodigo.Text));
                CargarLista("Articulos");
                EliminacionCorrecta();
                Limpiar();
            }
            else
            {
                pnlEditarElim.Visible = false;
            }
            
        }

        private void lstArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCamposArticulos(lstArticulo.SelectedIndex);
            pnlEditarElim.Visible = false;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}

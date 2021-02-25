using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace Integrador.Formularios.Clientes
{
    public partial class frmModificarClientes : Form
    {

        List<Clases.Cliente> lCliente = new List<Clases.Cliente>();
        Clases.Cliente ObjetoCliente = new Clases.Cliente();
        Clases.Conexion conexion = new Clases.Conexion();
        Clases.Barrio b = new Clases.Barrio();
        Clases.Genero g = new Clases.Genero();
        Clases.TipoDocumento td = new Clases.TipoDocumento();
        Clases.Localidad loc = new Clases.Localidad();
        Clases.Provincia prov = new Clases.Provincia();

        public frmModificarClientes()
        {
            InitializeComponent();
        }

        //METODO PARA CARGAR LISTA
        private void CargarLista(string nombreTabla)
        {
            lCliente.Clear();
            conexion.LeerTabla(nombreTabla);
            while (conexion.Lector.Read())
            {
                Clases.Cliente cli = new Clases.Cliente();
                if (!conexion.Lector.IsDBNull(0))
                    cli.pClienteId = conexion.Lector.GetInt32(0);
                if (!conexion.Lector.IsDBNull(1))
                    cli.pNombre = conexion.Lector.GetString(1);
                if (!conexion.Lector.IsDBNull(2))
                    cli.pApellido = conexion.Lector.GetString(2);
                if (!conexion.Lector.IsDBNull(3))
                    cli.pidTipoDoc = conexion.Lector.GetInt32(3);
                if (!conexion.Lector.IsDBNull(4))
                    cli.pNroDocumento = conexion.Lector.GetInt32(4);
                if (!conexion.Lector.IsDBNull(5))
                    cli.pFechaNacimiento = conexion.Lector.GetDateTime(5);
                if (!conexion.Lector.IsDBNull(6))
                    cli.pGenero = conexion.Lector.GetInt32(6);
                if (!conexion.Lector.IsDBNull(7))
                    cli.pCalle = conexion.Lector.GetString(7);
                if (!conexion.Lector.IsDBNull(8))
                    cli.pAltura = conexion.Lector.GetInt32(8);
                if (!conexion.Lector.IsDBNull(9))
                    cli.pBarrio = conexion.Lector.GetInt32(9);
                if (!conexion.Lector.IsDBNull(10))
                    cli.pTelefono = (int)conexion.Lector.GetInt64(10);
                if (!conexion.Lector.IsDBNull(11))
                    cli.pEmail = conexion.Lector.GetString(11);
                if (!conexion.Lector.IsDBNull(12))
                    cli.pLocalidad = conexion.Lector.GetInt32(12);
                if (!conexion.Lector.IsDBNull(13))
                    cli.pProvincia = conexion.Lector.GetInt32(13);

                lCliente.Add(cli);
            }
            conexion.Lector.Close();
            conexion.CerrarConexion();
            lstClientes.Items.Clear();

            for (int i = 0; i < lCliente.Count; i++)
            {
                lstClientes.Items.Add(lCliente[i].toStringCliente());
            }
            lstClientes.SelectedIndex = 0;
        }


        public void EditarCliente(string nombre, string apellido, int idTipodoc, DateTime fecha, int idGenero, string calle, int altura, int idBarrio, long telefono, string email, int localidad, int provincia,int numerodoc)
        {
            Clases.Cliente c = new Clases.Cliente();
            c.pNombre = nombre;
            c.pApellido = apellido;
            c.pidTipoDoc = idTipodoc;
            c.pFechaNacimiento = fecha;
            c.pGenero = idGenero;
            c.pCalle = calle;
            c.pAltura = altura;
            c.pBarrio = idBarrio;
            c.pTelefono = telefono;
            c.pEmail = email;
            c.pLocalidad = localidad;
            c.pProvincia = provincia;
            c.pNroDocumento = numerodoc;
            ObjetoCliente.ModificarCliente(c);
        }

        public void EliminarCliente(int nroDocumento)
        {
            Clases.Cliente c = new Clases.Cliente();
            c.pNroDocumento = nroDocumento;
            ObjetoCliente.EliminarCliente(c);
        }


        //METODO LIMPIAR CAMPOS

        private void Limpiar()
        {
            txtAltura.Clear();
            txtApellido.Clear();
            txtCalle.Clear();
            txtDocumento.Clear();
            txtEmail.Clear();
            txtNombre.Clear();
            txtTelefono.Clear();
            cboBarrio.SelectedIndex = -1;
            cboGenero.SelectedIndex = -1;
            cboLocalidad.SelectedIndex = -1;
            cboTipoDoc.SelectedIndex = -1;
            cboProvincia.SelectedIndex = -1;
            dtpFechaNacimiento.Value = DateTime.Today;

        }




        private void btnRegistrar_Click(object sender, EventArgs e)
        {

            if (txtNombre.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtNombre.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtApellido.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtApellido.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtDocumento.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtDocumento.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtTelefono.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtTelefono.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtCalle.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtCalle.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtAltura.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtAltura.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtEmail.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtEmail.BackColor = Color.FromArgb(252, 248, 185);
            }
            else
            {
                EditarCliente(txtNombre.Text, txtApellido.Text, (int)cboTipoDoc.SelectedValue, dtpFechaNacimiento.Value, (int)cboGenero.SelectedValue, txtCalle.Text, int.Parse(txtAltura.Text), (int)cboBarrio.SelectedValue, Convert.ToInt64(txtTelefono.Text), txtEmail.Text, (int)cboLocalidad.SelectedValue, (int)cboProvincia.SelectedValue, int.Parse(txtDocumento.Text));
                CargarLista("Clientes");
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Los datos del Cliente se modificaron correctamente...";
                Limpiar();
            }

           
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("estas seguro de eliminar esta persona?", "eliminando",
                      MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                EliminarCliente(int.Parse(txtDocumento.Text));
                CargarLista("Clientes");
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(246, 109, 79);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Cliente eliminado con Exito...";
                Limpiar();
            }
            else
            {
                pnlEditarElim.Visible = false;
            }
            
        }

        private void frmModificarClientes_Load(object sender, EventArgs e)
        {
            txtNombre.Focus();
            CargarLista("Clientes");
            var primerCliente = lCliente.FirstOrDefault();
            b.CargarComboBarrio(cboBarrio);
            g.CargarComboGenero(cboGenero);
            td.CargarComboTipoDocumento(cboTipoDoc);
            loc.CargarComboLocalidades(cboLocalidad);
            prov.CargarComboProvincias(cboProvincia);
            txtDocumento.Enabled = false;
            if (primerCliente!=null)
            {
                cboProvincia.SelectedValue = primerCliente.pProvincia;
            }
            
        }

        private void CargarCampos(int posicion)
        {
            txtNombre.Text = lCliente[posicion].pNombre;
            txtApellido.Text = lCliente[posicion].pApellido;
            cboTipoDoc.SelectedValue = lCliente[posicion].pidTipoDoc;
            txtDocumento.Text = lCliente[posicion].pNroDocumento.ToString();
            dtpFechaNacimiento.Value = lCliente[posicion].pFechaNacimiento;
            cboGenero.SelectedValue = lCliente[posicion].pGenero;
            txtCalle.Text = lCliente[posicion].pCalle;
            txtAltura.Text = lCliente[posicion].pAltura.ToString();
            cboBarrio.SelectedValue = lCliente[posicion].pBarrio;
            cboLocalidad.SelectedValue = lCliente[posicion].pLocalidad;
            cboProvincia.SelectedValue = lCliente[posicion].pProvincia;
            txtTelefono.Text = lCliente[posicion].pTelefono.ToString();
            txtEmail.Text = lCliente[posicion].pEmail.ToString();
            

        }
        private void lstClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCampos(lstClientes.SelectedIndex);
            pnlEditarElim.Visible = false;
            
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtNombre.BackColor = Color.White;
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

        private void txtApellido_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtApellido.BackColor = Color.White;
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

        private void txtDocumento_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))

            {
                pnlEditarElim.Visible = false;
                txtDocumento.BackColor = Color.White;
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtCalle_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtCalle.BackColor = Color.White;
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

        private void txtAltura_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))

            {
                pnlEditarElim.Visible = false;
                txtAltura.BackColor = Color.White;
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }

        private void txtTelefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))
            {
                pnlEditarElim.Visible = false;
                txtTelefono.BackColor = Color.White;
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }


        private Boolean FormatoCorrectoMail(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {

                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        private void txtEmail_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtEmail.BackColor = Color.White;
        }

        private void txtEmail_Leave(object sender, EventArgs e)
        {
            if (FormatoCorrectoMail(txtEmail.Text))
            {

            }
            else
            {
                MessageBox.Show("Formato de correo incorrecto, el correo debe estar formado de la siguiente manera: nombre@dominio.com");
            }
        }
    }
}

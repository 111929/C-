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
    public partial class frmRegistrarClientes : Form
    {
        Clases.Cliente ObjetoCliente = new Clases.Cliente();
        Clases.Barrio b = new Clases.Barrio();
        Clases.Localidad l = new Clases.Localidad();
        Clases.Provincia p = new Clases.Provincia();
        Clases.Genero g = new Clases.Genero();
        Clases.TipoDocumento td = new Clases.TipoDocumento();
        Clases.Conexion conexion = new Clases.Conexion();

        public frmRegistrarClientes()
        {
            InitializeComponent();
        }

        public void InsertarClientes(string nombre, string apellido, int idTipodoc, int documento, DateTime fecha, int idGenero,string calle,int altura,int idBarrio,long telefono, string email, int localidad, int provincia)
        {
            Clases.Cliente c = new Clases.Cliente();
            c.pNombre = nombre;
            c.pApellido = apellido;
            c.pidTipoDoc = idTipodoc;
            c.pNroDocumento = documento;
            c.pFechaNacimiento = fecha;
            c.pGenero = idGenero;
            c.pCalle = calle;
            c.pAltura = altura;
            c.pBarrio = idBarrio;
            c.pTelefono = telefono;
            c.pEmail = email;
            c.pLocalidad = localidad;
            c.pProvincia = provincia;
            ObjetoCliente.InsertarCliente(c);
        }

        


        //METODO PARA VALIDAR SI EXISTE EL CLIENTE O LA DIRECCION DE EMAIL
        private bool ClienteExistente(int doc,string ema)
        {
            DataTable tabla = new DataTable();
            bool existe = false;
            tabla = conexion.ValidarDatos("Clientes",Convert.ToInt32(txtDocumento.Text),txtemail.Text);
            if (tabla.Rows.Count != 0)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(246, 109, 79);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Datos existentes...";
                return true;
            }


            return existe;
        }


        //METODO PARA LIMPIAR CAMPOS

        private void limpiar()
        {
            txtAltura.Clear();
            txtApellido.Clear();
            txtCalle.Clear();
            txtDocumento.Clear();
            txtemail.Clear();
            txtNombre.Clear();
            txtTelefono.Clear();
            cboBarrio.SelectedIndex = -1;
            cboGenero.SelectedIndex = -1;
            cboLocalidad.SelectedIndex = -1;
            cboTipoDoc.SelectedIndex = -1;
            cboProvincia.SelectedIndex = -1;
            dtpFechaNacimiento.Value = DateTime.Today;

        }




        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnRegistrar_Click(object sender, EventArgs e)
        {

            if (txtNombre.Text==string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtNombre.BackColor = Color.FromArgb(252,248,185);
            }
            if (txtApellido.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtApellido.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtDocumento.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtDocumento.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtTelefono.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtTelefono.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtCalle.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtCalle.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtAltura.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtAltura.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtemail.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtemail.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (!ClienteExistente(ObjetoCliente.pNroDocumento,ObjetoCliente.pEmail))
            {
                InsertarClientes(txtNombre.Text, txtApellido.Text, (int)cboTipoDoc.SelectedValue, int.Parse(txtDocumento.Text), dtpFechaNacimiento.Value, (int)cboGenero.SelectedValue, txtCalle.Text, int.Parse(txtAltura.Text), (int)cboBarrio.SelectedValue, Convert.ToInt64(txtTelefono.Text), txtemail.Text, (int)cboLocalidad.SelectedValue, (int)cboProvincia.SelectedValue);
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Los datos del Cliente se Registraron correctamente...";
                limpiar();
            }
            

        }

        private void frmRegistrarClientes_Load(object sender, EventArgs e)
        {
            b.CargarComboBarrio(cboBarrio);
            l.CargarComboLocalidades(cboLocalidad);
            p.CargarComboProvincias(cboProvincia);
            g.CargarComboGenero(cboGenero);
            td.CargarComboTipoDocumento(cboTipoDoc);
            pnlEditarElim.Visible = false;
            txtNombre.Focus();
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

        private void txtemail_Leave(object sender, EventArgs e)
        {
            if (FormatoCorrectoMail(txtemail.Text))
            {
                
            }
            else
            {
                MessageBox.Show("Formato de correo incorrecto, el correo debe estar formado de la siguiente manera: nombre@dominio.com");
            }
        }

        private void txtemail_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtemail.BackColor = Color.White;
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
    }
}

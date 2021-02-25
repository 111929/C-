using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Empleados
{
    public partial class frmRegistrarEmpleados : Form
    {
        Clases.Empleado ObjetoEmpleado = new Clases.Empleado();
        Clases.Barrio b = new Clases.Barrio();
        Clases.Localidad l = new Clases.Localidad();
        Clases.Provincia p = new Clases.Provincia();
        Clases.Genero g = new Clases.Genero();
        Clases.TipoDocumento td = new Clases.TipoDocumento();
        Clases.TipoEmpleado te = new Clases.TipoEmpleado();
        Clases.Conexion conexion = new Clases.Conexion();
        public frmRegistrarEmpleados()
        {
            InitializeComponent();
        }


        public void InsertarEmpleados(string nombre, string apellido, int tipoDoc, int documento, DateTime fecha, int idGenero, DateTime fechaIngreso,int tipo, string calle, int altura, int idBarrio, long telefono, string email, int localidad, int provincia, string usuario, string contraseña)
        {
            Clases.Empleado e = new Clases.Empleado();
            e.pNombre = nombre;
            e.pApellido = apellido;
            e.pTipoDoc = tipoDoc;
            e.pNroDoc = documento;
            e.pFecNac = fecha;
            e.pGenero = idGenero;
            e.pFechaIngreso = fechaIngreso;
            e.ptipo = tipo;
            e.pCalle = calle;
            e.pAltura = altura;
            e.pBarrio = idBarrio;
            e.pTelefono = telefono;
            e.pEmail = email;
            e.pLocalidad = localidad;
            e.pProvincia = provincia;
            e.pUsuario = usuario;
            e.pContrasena = contraseña;
            ObjetoEmpleado.InsertarEmpleado(e);
        }


        //METODO PARA VALIDAR SI EXISTE UN EMPLEADO O LA DIRECCION DE EMAIL
        private bool EmpleadoExistente(int doc, string ema)
        {
            DataTable tabla = new DataTable();
            bool existe = false;
            tabla = conexion.ValidarDatos("Empleados", Convert.ToInt32(txtNroDoc.Text), txtMail.Text);
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

        //METODO LIMPIAR CAMPOS

        private void Limpiar()
        {
            txtAltura.Clear();
            txtApellido.Clear();
            txtCalle.Clear();
            txtNroDoc.Clear();
            txtMail.Clear();
            txtNombre.Clear();
            txtTelefono.Clear();
            cboBarrio.SelectedIndex = -1;
            cboGenero.SelectedIndex = -1;
            cboLocalidad.SelectedIndex = -1;
            cboTipoDoc.SelectedIndex = -1;
            cboProvincia.SelectedIndex = -1;
            dtpFechaNacimiento.Value = DateTime.Today;
            dtpFechaIngreso.Value = DateTime.Today;
            cboTipoEmpleado.SelectedIndex = -1;
            txtUsuario.Clear();
            txtContrasena.Clear();

        }




        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
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
            if (txtApellido.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtApellido.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtNroDoc.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtNroDoc.BackColor = Color.FromArgb(252, 248, 185);
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
            if (txtUsuario.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtUsuario.BackColor = Color.FromArgb(252, 248, 185);
            }
            if (txtContrasena.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtContrasena.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtMail.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtMail.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (!EmpleadoExistente(ObjetoEmpleado.pNroDoc,ObjetoEmpleado.pEmail))
            {
                InsertarEmpleados(txtNombre.Text, txtApellido.Text, (int)cboTipoDoc.SelectedValue, int.Parse(txtNroDoc.Text), dtpFechaNacimiento.Value, (int)cboGenero.SelectedValue, dtpFechaIngreso.Value, (int)cboTipoEmpleado.SelectedValue, txtCalle.Text, int.Parse(txtAltura.Text), (int)cboBarrio.SelectedValue, Convert.ToInt64(txtTelefono.Text), txtMail.Text, (int)cboLocalidad.SelectedValue, (int)cboProvincia.SelectedValue, txtUsuario.Text, txtContrasena.Text);
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Los datos del Empleado se Registraron correctamente...";
                Limpiar();
            }
            
        }

        private void frmRegistrarEmpleados_Load(object sender, EventArgs e)
        {
            b.CargarComboBarrio(cboBarrio);
            l.CargarComboLocalidades(cboLocalidad);
            p.CargarComboProvincias(cboProvincia);
            g.CargarComboGenero(cboGenero);
            td.CargarComboTipoDocumento(cboTipoDoc);
            te.CargarComboTipoEmpleado(cboTipoEmpleado);
            txtNombre.Focus();
            pnlEditarElim.Visible = false;
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

        private void txtNroDoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))

            {
                pnlEditarElim.Visible = false;
                txtNroDoc.BackColor = Color.White;
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


        private void txtMail_Leave(object sender, EventArgs e)
        {
            if (FormatoCorrectoMail(txtMail.Text))
            {

            }
            else
            {
                MessageBox.Show("Formato de correo incorrecto, el correo debe estar formado de la siguiente manera: nombre@dominio.com");
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

        private void txtUsuario_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtUsuario.BackColor = Color.White;
        }

        private void txtContrasena_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtContrasena.BackColor = Color.White;
        }

        private void txtMail_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtMail.BackColor = Color.White;
        }
    }
}

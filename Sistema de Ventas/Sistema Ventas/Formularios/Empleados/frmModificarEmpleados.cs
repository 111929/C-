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
    public partial class frmModificarEmpleados : Form
    {

        List<Clases.Empleado> lEmpleado = new List<Clases.Empleado>();
        Clases.Empleado ObjetoEmpleado = new Clases.Empleado();
        Clases.Conexion conexion = new Clases.Conexion();
        Clases.Barrio b = new Clases.Barrio();
        Clases.Genero g = new Clases.Genero();
        Clases.TipoDocumento td = new Clases.TipoDocumento();
        Clases.TipoEmpleado te = new Clases.TipoEmpleado();
        Clases.Localidad loc = new Clases.Localidad();
        Clases.Provincia prov = new Clases.Provincia();

        public frmModificarEmpleados()
        {
            InitializeComponent();
        }


        private void CargarLista(string nombreTabla)
        {
            lEmpleado.Clear();
            conexion.LeerTabla(nombreTabla);
            while (conexion.Lector.Read())
            {
                Clases.Empleado e = new Clases.Empleado();
                if (!conexion.Lector.IsDBNull(0))
                    e.pLegajo = conexion.Lector.GetInt32(0);
                if (!conexion.Lector.IsDBNull(1))
                    e.pNombre = conexion.Lector.GetString(1);
                if (!conexion.Lector.IsDBNull(2))
                    e.pApellido = conexion.Lector.GetString(2);
                if (!conexion.Lector.IsDBNull(3))
                    e.pTipoDoc = conexion.Lector.GetInt32(3);
                if (!conexion.Lector.IsDBNull(4))
                    e.pNroDoc = conexion.Lector.GetInt32(4);
                if (!conexion.Lector.IsDBNull(5))
                    e.pFecNac = conexion.Lector.GetDateTime(5);
                if (!conexion.Lector.IsDBNull(6))
                    e.pGenero = conexion.Lector.GetInt32(6);
                if (!conexion.Lector.IsDBNull(7))
                    e.pFechaIngreso = conexion.Lector.GetDateTime(7);
                if (!conexion.Lector.IsDBNull(8))
                    e.ptipo = conexion.Lector.GetInt32(8);
                if (!conexion.Lector.IsDBNull(9))
                    e.pCalle = conexion.Lector.GetString(9);
                if (!conexion.Lector.IsDBNull(10))
                    e.pAltura = conexion.Lector.GetInt32(10);
                if (!conexion.Lector.IsDBNull(11))
                    e.pBarrio = conexion.Lector.GetInt32(11);
                if (!conexion.Lector.IsDBNull(12))
                    e.pTelefono = (int)conexion.Lector.GetInt64(12);
                if (!conexion.Lector.IsDBNull(13))
                    e.pEmail = conexion.Lector.GetString(13);
                if (!conexion.Lector.IsDBNull(14))
                    e.pUsuario = conexion.Lector.GetString(14);
                if (!conexion.Lector.IsDBNull(15))
                    e.pContrasena = conexion.Lector.GetString(15);
                if (!conexion.Lector.IsDBNull(16))
                    e.pLocalidad = conexion.Lector.GetInt32(16);
                if (!conexion.Lector.IsDBNull(17))
                    e.pProvincia = conexion.Lector.GetInt32(17);

                lEmpleado.Add(e);
            }
            conexion.Lector.Close();
            conexion.CerrarConexion();
            lstEmpleados.Items.Clear();

            for (int i = 0; i < lEmpleado.Count; i++)
            {
                lstEmpleados.Items.Add(lEmpleado[i].toStringEmpleado());
            }
            lstEmpleados.SelectedIndex = 0;
        }

        public void EditarEmpleado(string nombre, string apellido, int idTipodoc, DateTime fechaNac, int idGenero, DateTime fechaIng,string usuario, string contrasena, int tipoEmp, string calle, int altura, int idBarrio, long telefono, string email, int localidad, int provincia, int numerodoc)
        {
            Clases.Empleado empleado = new Clases.Empleado();
            empleado.pNombre = nombre;
            empleado.pApellido = apellido;
            empleado.pTipoDoc = idTipodoc;
            empleado.pFecNac = fechaNac;
            empleado.pGenero = idGenero;
            empleado.pFechaIngreso = fechaIng;
            empleado.pUsuario = usuario;
            empleado.pContrasena = contrasena;
            empleado.ptipo = tipoEmp;
            empleado.pCalle = calle;
            empleado.pAltura = altura;
            empleado.pBarrio = idBarrio;
            empleado.pTelefono = telefono;
            empleado.pEmail = email;
            empleado.pLocalidad = localidad;
            empleado.pProvincia = provincia;
            empleado.pNroDoc = numerodoc;
            ObjetoEmpleado.ModificarEmpleado(empleado);
        }

        public void EliminarEmpleado(int nroDocumento)
        {
            Clases.Empleado emp = new Clases.Empleado();
            emp.pNroDoc = nroDocumento;
            ObjetoEmpleado.EliminarEmpleado(emp);
        }

        //METODO PARA LIMPIAR CAMPOS

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
            dtpFechaIngreso.Value = DateTime.Today;
            cboTipoEmpleado.SelectedIndex = -1;
        }



        private void CargarCampos(int posicion)
        {
            txtNombre.Text = lEmpleado[posicion].pNombre;
            txtApellido.Text = lEmpleado[posicion].pApellido;
            cboTipoDoc.SelectedValue = lEmpleado[posicion].pTipoDoc;
            txtDocumento.Text = lEmpleado[posicion].pNroDoc.ToString();
            dtpFechaNacimiento.Value = lEmpleado[posicion].pFecNac;
            cboGenero.SelectedValue = lEmpleado[posicion].pGenero;
            dtpFechaIngreso.Value = lEmpleado[posicion].pFechaIngreso;
            txtCalle.Text = lEmpleado[posicion].pCalle;
            txtAltura.Text = lEmpleado[posicion].pAltura.ToString();
            cboBarrio.SelectedValue = lEmpleado[posicion].pBarrio;
            txtTelefono.Text = lEmpleado[posicion].pTelefono.ToString();
            txtUsuario.Text= lEmpleado[posicion].pUsuario;
            txtContrasena.Text = lEmpleado[posicion].pContrasena;
            txtEmail.Text = lEmpleado[posicion].pEmail;
            cboProvincia.SelectedValue= lEmpleado[posicion].pProvincia;
            cboLocalidad.SelectedValue = lEmpleado[posicion].pLocalidad;
            cboTipoEmpleado.SelectedValue = lEmpleado[posicion].ptipo;

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("estas seguro de eliminar esta persona?", "eliminando",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
            {
                EliminarEmpleado(int.Parse(txtDocumento.Text));
                CargarLista("Empleados");
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(246, 109, 79);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Empleado eliminado con Exito...";
                Limpiar();
            }
            else
            {
                pnlEditarElim.Visible = false;
            }
            
        }

        private void btnEditar_Click(object sender, EventArgs e)
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
            else if (txtUsuario.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtUsuario.BackColor = Color.FromArgb(252, 248, 185);
            }
            else if (txtContrasena.Text == string.Empty)
            {
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(252, 248, 185);
                lblEditElim.ForeColor = Color.FromArgb(121, 134, 160);
                lblEditElim.Text = "Campo requerido...";
                txtContrasena.BackColor = Color.FromArgb(252, 248, 185);
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
                EditarEmpleado(txtNombre.Text, txtApellido.Text, (int)cboTipoDoc.SelectedValue, dtpFechaNacimiento.Value, (int)cboGenero.SelectedValue, dtpFechaIngreso.Value, txtUsuario.Text, txtContrasena.Text, (int)cboTipoEmpleado.SelectedValue, txtCalle.Text, int.Parse(txtAltura.Text), (int)cboBarrio.SelectedValue, Convert.ToInt64(txtTelefono.Text), txtEmail.Text, (int)cboLocalidad.SelectedValue, (int)cboProvincia.SelectedValue, int.Parse(txtDocumento.Text));
                CargarLista("Empleados");
                pnlEditarElim.Visible = true;
                pnlEditarElim.BackColor = Color.FromArgb(25, 128, 119);
                lblEditElim.ForeColor = Color.White;
                lblEditElim.Text = "Los datos del Empleado se modificaron correctamente...";
                Limpiar();
            }


           
        }

        private void frmModificarEmpleados_Load(object sender, EventArgs e)
        {
            CargarLista("Empleados");
            txtNombre.Focus();
            var primerCliente = lEmpleado.FirstOrDefault();
            b.CargarComboBarrio(cboBarrio);
            g.CargarComboGenero(cboGenero);
            td.CargarComboTipoDocumento(cboTipoDoc);
            loc.CargarComboLocalidades(cboLocalidad);
            prov.CargarComboProvincias(cboProvincia);
            te.CargarComboTipoEmpleado(cboTipoEmpleado);
            txtDocumento.Enabled = false;
            if (primerCliente != null)
            {
                cboProvincia.SelectedValue = primerCliente.pProvincia;
            }
        }

        private void lstEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCampos(lstEmpleados.SelectedIndex);
            pnlEditarElim.Visible = false;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
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

        private void txtEmail_KeyPress(object sender, KeyPressEventArgs e)
        {
            pnlEditarElim.Visible = false;
            txtEmail.BackColor = Color.White;
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
        
    }
}

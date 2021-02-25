using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private DataTable Login(string usuario,string contrasena)
        {
            Clases.Empleado empleado = new Clases.Empleado();
            empleado.pUsuario = usuario;
            empleado.pContrasena = contrasena;
            return empleado.LoginDeAcceso(empleado);
        }



        private void frmLogin_Load(object sender, EventArgs e)
        {
            lblLogin.Visible = false;
            txtUsuario.Focus();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable tabla = Login(txtUsuario.Text,txtContrasena.Text);

            if (txtUsuario.Text == "")
            {
                lblLogin.ForeColor = Color.Red;
                lblLogin.Text = "Usuario no Ingresado";
                lblLogin.Visible = true;
                txtUsuario.Focus();
            }
            else if (txtContrasena.Text == "")
            {
                lblLogin.ForeColor = Color.Red;
                lblLogin.Text = "Contraseña no Ingresada";
                lblLogin.Visible = true;
                txtContrasena.Focus();
            }
            else if (tabla.Rows.Count==0)
            {
                lblLogin.ForeColor = Color.Red;
                lblLogin.Text = "Usuario o contraseña incorrectos";
                lblLogin.Visible = true;
                txtUsuario.Focus();

            }
            else
            {
                frmPrincipal frm = new frmPrincipal();
                frm.IdEmpleado = tabla.Rows[0][0].ToString();
                frm.Apellido = tabla.Rows[0][1].ToString();
                frm.Nombre = tabla.Rows[0][2].ToString();
                frm.TipoEmpleado = tabla.Rows[0][3].ToString();
                
                frm.Show();
                frm.FormClosed += CerrarSesion;
                this.Hide();
            }
        }

        private void CerrarSesion(object sender, FormClosedEventArgs e)
        {
            txtUsuario.Clear();
            txtContrasena.Clear();
            lblLogin.Visible = false;
            this.Show();
            txtUsuario.Focus();
        }


        private void txtUsuario_KeyPress(object sender, KeyPressEventArgs e)
        {
            lblLogin.Visible = false;
            if (char.IsLetter(e.KeyChar))
            {
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

        private void txtContrasena_KeyPress(object sender, KeyPressEventArgs e)
        {
            lblLogin.Visible = false;
        }
    }
}

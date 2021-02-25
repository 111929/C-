using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Formularios.Herramientas
{
    public partial class frmCalculadora : Form
    {
        float primero = 0;
        float segundo = 0;
        float resultado = 0;
        string operacion = "0";

        public frmCalculadora()
        {
            InitializeComponent();
        }

        private void btn00_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "00";
        }

        private void btn2_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "2";
        }

        private void btn3_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "3";
        }

        private void brn4_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "4";
        }

        private void btn5_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "5";
        }

        private void btn6_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "6";
        }

        private void btn7_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "7";
        }

        private void b_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "8";
        }

        private void btn9_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "9";
        }

        private void btnPunto_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + ",";
        }

        private void btnMenos_Click(object sender, EventArgs e)
        {
            operacion = "-";
            primero = float.Parse(txtPantalla.Text);
            txtPantalla.Clear();
        }

        private void btnSuma_Click(object sender, EventArgs e)
        {
            operacion = "+";
            primero = float.Parse(txtPantalla.Text);
            txtPantalla.Clear();
        }

        private void btnMultiplicacion_Click(object sender, EventArgs e)
        {
            operacion = "*";
            primero = float.Parse(txtPantalla.Text);
            txtPantalla.Clear();
        }

        private void btnDivision_Click(object sender, EventArgs e)
        {
            operacion = "/";
            primero = float.Parse(txtPantalla.Text);
            txtPantalla.Clear();
        }

        private void btnIgual_Click(object sender, EventArgs e)
        {
            segundo = float.Parse(txtPantalla.Text);

            switch (operacion)
            {

                case "+":

                    resultado = primero + segundo;
                    txtPantalla.Text = resultado.ToString();
                    primero = resultado;
                    break;
                case "-":
                    resultado = primero - segundo;
                    txtPantalla.Text = resultado.ToString();
                    break;
                case "*":
                    resultado = primero * segundo;
                    txtPantalla.Text = resultado.ToString();
                    break;
                case "/":
                    if (segundo == 0)
                    {
                        txtPantalla.Text = "Error";
                        break;
                    }
                    else
                        resultado = primero / segundo;
                    txtPantalla.Text = resultado.ToString();
                    break;
            }
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            txtPantalla.Clear();
            primero = 0;
            segundo = 0;
        }

        private void btn0_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "0";
        }

        private void btn1_Click(object sender, EventArgs e)
        {
            txtPantalla.Text = txtPantalla.Text + "1";
        }
    }
}

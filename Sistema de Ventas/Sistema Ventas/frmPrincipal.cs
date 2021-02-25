using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.Collections;

namespace Integrador
{
    public partial class frmPrincipal : Form
    {

        Form formulario;

        Clases.Cliente c = new Clases.Cliente();
        private string idEmpleado = "";
        private string apellido = "";
        private string nombre = "";
        private string tipoEmpleado = "";

        public string IdEmpleado { get => idEmpleado; set => idEmpleado = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string TipoEmpleado { get => tipoEmpleado; set => tipoEmpleado = value; }

        Clases.Conexion conexion = new Clases.Conexion();
        public frmPrincipal()
        {
            InitializeComponent();
            lblFecha.Text = DateTime.Now.ToShortDateString();
            OcultarSubMenus();
        }


        //METODO PARA CONTROLAR ACCESOS DE USUARIOS

        private void GestionDEUsuarios()
        {
            if (tipoEmpleado=="ADMINISTRADOR")
            {
                btnCliente.Enabled = true;
                btnEmpleados.Enabled = true;
                btnArticulos.Enabled = true;
                btnVentas.Enabled = true;
                btnReportes.Enabled = true;
                btnHerramientas.Enabled = true;
                btnUsuarios.Enabled = true;
            }
            else if (tipoEmpleado=="ENCARGADO")
            {
                btnCliente.Enabled = true;
                btnEmpleados.Enabled = true;
                btnArticulos.Enabled = true;
                btnVentas.Enabled = true;
                btnReportes.Enabled = true;
                btnHerramientas.Enabled = true;
                btnUsuarios.Enabled = false;
            }
            else if (tipoEmpleado=="VENDEDOR")
            {
                btnCliente.Enabled = true;
                btnEmpleados.Enabled = false;
                btnArticulos.Enabled = false;
                btnVentas.Enabled = true;
                btnReportes.Enabled = true;
                btnReporteEmp.Enabled = false;
                btnReporteCli.Enabled = false;
                btnReporteArt.Enabled = false;
                btnHerramientas.Enabled = true;
                btnUsuarios.Enabled = false;
            }

        }



        //METODO PARA OCULTAR SUB MENUS
        private void OcultarSubMenus()
        {
            pnlSubMenuArticulos.Visible = false;
            pnlSubMenuClientes.Visible = false;
            pnlSubMenuEmpleados.Visible = false;
            pnlSubMenuReportes.Visible = false;
            pnlSubMenuVentas.Visible = false;
            pnlSubMenuUsuarios.Visible = false;
            pnlSubMenuHerramientas.Visible = false;
        }

        //METODO PARA OCULTAR DE A UN SUBMENU
        private void OcultarUnSubMenu()
        {
            if (pnlSubMenuArticulos.Visible == true)
            {
                pnlSubMenuArticulos.Visible = false;
            }
            if (pnlSubMenuClientes.Visible == true)
            {
                pnlSubMenuClientes.Visible = false;
            }
            if (pnlSubMenuEmpleados.Visible == true)
            {
                pnlSubMenuEmpleados.Visible = false;
            }
            if (pnlSubMenuReportes.Visible == true)
            {
                pnlSubMenuReportes.Visible = false;
            }
            if (pnlSubMenuVentas.Visible == true)
            {
                pnlSubMenuVentas.Visible = false;
            }
            if (pnlSubMenuUsuarios.Visible == true)
            {
                pnlSubMenuUsuarios.Visible = false;
            }
            if (pnlSubMenuHerramientas.Visible == true)
            {
                pnlSubMenuHerramientas.Visible = false;
            }
        }


        //METODO PARA MOSTRAR SUBMENU
        private void MostrarSubMenu(Panel SubMenu)
        {
            if (SubMenu.Visible==false)
            {
                OcultarUnSubMenu();
                SubMenu.Visible = true;
            }
            else
            {
                SubMenu.Visible = false;
            }
        }
        //-----------------------------------------------------------------------------------------

        //METODO PARA ABRIR UN FORMULARIO DENTRO DEL PANEL
        private void AbrirFormulario<MiForm>() where MiForm : Form, new()
        {
            if (formulario != null)
            {
                formulario.Close();
            }
            formulario = pnlContenedorPrincipal.Controls.OfType<MiForm>().FirstOrDefault(); //Busca en la coleccion el formulario
            //si el formulario no existe
            if (formulario == null)
            {
                formulario = new MiForm();//Creamos una nueva instancia
                formulario.TopLevel = false;//No es un formulario de nivel superior
                formulario.FormBorderStyle = FormBorderStyle.None;//quito el borde al formulario
                formulario.Dock = DockStyle.Fill;//Es para acoplar al panel
                pnlContenedorPrincipal.Controls.Add(formulario);//Agrego un formulario a la coleccion de controles del panel
                pnlContenedorPrincipal.Tag = formulario;//Especifico la propiedad tag, esta obtiene o establece el objeto que contiene datos sobre el control
                formulario.Show();//Muestro el formulario
                formulario.BringToFront();//Es para traerlo al frente y no se superpongan con otros formularios.
            }
            //Si el formulario existe
            else
            {
                formulario.BringToFront();
            }
        }



        //--------------------------------------------------------------------------------------
        private void btnCliente_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuClientes);
        }

        private void btnEmpleados_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuEmpleados);
        }

        private void btnArticulos_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuArticulos);
        }

        private void btnVentas_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuVentas);
        }

        private void btnReportes_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuReportes);
        }

        private void btnRegistrarCliente_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Clientes.frmRegistrarClientes>();
            OcultarUnSubMenu();
        }

        private void btnModificarCliente_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Clientes.frmModificarClientes>();
            OcultarUnSubMenu();
        }

        

        private void btnListarClientes_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Clientes.frmListarClientes>();
            Formularios.Clientes.frmListarClientes frm = new Formularios.Clientes.frmListarClientes();
            frm.Close();
            OcultarUnSubMenu();
        }

        private void btnRegistrarEmpleados_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Empleados.frmRegistrarEmpleados>();
            OcultarUnSubMenu();
        }

        private void btnModificarEmpleados_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Empleados.frmModificarEmpleados>();
            OcultarUnSubMenu();
        }

       

        private void btnListarEmpleados_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Empleados.frmListarEmpleados>();
            OcultarUnSubMenu();
        }

        private void btnRegistrarArticulo_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Articulos.frmRegistrarArticulo>();
            OcultarUnSubMenu();
        }

        private void btnModificarArticulo_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Articulos.frmModificarArticulo>();
            OcultarUnSubMenu();
        }


        private void btnListarArticulos_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Articulos.frmListarArticulos>();
            OcultarUnSubMenu();
        }

        private void btnRegistrarVennta_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Ventas.frmRegistrarVentas>();
            OcultarUnSubMenu();
        }

        private void btnAnularVenta_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Ventas.frmAnularVenta>();
            OcultarUnSubMenu();
        }

        private void btnReporteCli_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Reportes.frmReporteClientes>();
            OcultarUnSubMenu();
        }

        private void btnReporteEmp_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Reportes.frmReporteEmpleados>();
            OcultarUnSubMenu();
        }

        private void btnReporteArt_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Reportes.frmReporteArticulos>();
            OcultarUnSubMenu();
        }

        private void btnReporteVentas_Click(object sender, EventArgs e)
        {
           // AbrirFormulario<Formularios.Reportes.frmReporteVentas>();
            OcultarUnSubMenu();
        }

        private void pnlDeMenu_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void btnUsuarios_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuUsuarios);
        }

        private void btnHerramientas_Click(object sender, EventArgs e)
        {
            MostrarSubMenu(pnlSubMenuHerramientas);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Usuarios.frmRegistrarUsuario>();
            OcultarUnSubMenu();
        }

        private void btnListadoUsuarios_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Usuarios.frmListarUsuarios>();
            OcultarUnSubMenu();
        }

        private void btnCalculadora_Click(object sender, EventArgs e)
        {
            AbrirFormulario<Formularios.Herramientas.frmCalculadora>();
            
            OcultarUnSubMenu();
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
           
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void pnlTitulos_Paint(object sender, PaintEventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblFecha.Text = DateTime.Now.ToShortDateString();
        }
        
        private void Contador(string nombreTabla,Label label)
        {
            int cantidad = 0;
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla(nombreTabla);
            cantidad=tabla.Rows.Count ;
            label.Text = cantidad.ToString();
        }


        private void Contador2(string nombreTabla, Label label)
        {
            int cantidad = 0;
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla(nombreTabla);
            cantidad = tabla.Rows.Count;
            label.Text = cantidad.ToString();
        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {
            
            GestionDEUsuarios();
            lblUsuario.Text = Nombre + " " + Apellido;
            if (TipoEmpleado=="ADMINISTRADOR")
            {
                lblTipoEmpleado.Text = "Administrador(a):";
            }
            else if (TipoEmpleado == "VENDEDOR")
            {
                lblTipoEmpleado.Text = "Vendedor(a):";
            }
            else if (TipoEmpleado == "ENCARGADO")
            {
                lblTipoEmpleado.Text = "Encargado(a):";
            }
            Contador2("Clientes",lblCantClientes);
            Contador2("Empleados", lblCantEmpleados);
            Contador2("Facturas", lblCantVentas);
            Contador2("Articulos", lblCantProductos);
            ObtenerDatos();
        }

        private void GraficoVentas_Click(object sender, EventArgs e)
        {

        }

        ArrayList anio = new ArrayList();
        ArrayList ventas = new ArrayList();

       

        //protected void ObtenerDatos()
        //{
        //    conexion.AbrirConexion();
        //    conexion.Comando.CommandText = "sp_GraficoVentas";
        //    conexion.Comando.CommandType = CommandType.StoredProcedure;
        //    conexion.Lector = conexion.Comando.ExecuteReader();
        //    while (conexion.Lector.Read())
        //    {
        //        anio.Add(conexion.Lector.GetInt32(0));
        //        ventas.Add(conexion.Lector.GetInt32(1));
        //    }

        //    conexion.Lector.Close();
        //    conexion.CerrarConexion();


        //    GraficoVentas.Series["Ventas"].Points.DataBindXY(anio,ventas);


        //}

        protected void ObtenerDatos()
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_GraficoVentas";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Lector = conexion.Comando.ExecuteReader();
            while (conexion.Lector.Read())
            {
                anio.Add(conexion.Lector.GetInt32(0));
                ventas.Add(conexion.Lector.GetInt32(1));
            }

            conexion.Lector.Close();
            conexion.CerrarConexion();


            GraficoVentas.Series["Ventas"].Points.DataBindXY(anio, ventas);


        }


        private void pnlContenedorPrincipal_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Esta seguro que desea salir?", "SALIENDO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            Application.Exit();
        }
    }
}

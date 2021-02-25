using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Integrador.Clases
{
    class Empleado
    {

        Conexion conexion = new Conexion();
        private SqlCommand comando = new SqlCommand();

        private int legajo;
        private string nombre;
        private string apellido;
        private int tipoDoc;
        private int nroDoc;
        private DateTime fecNac;
        private int genero;
        private DateTime fechaIngreso;
        private string usuario;
        private int tipo;
        private string calle;
        private int altura;
        private int barrio;
        private long telefono;
        private string email;
        private string contrasena;
        private int localidad;
        private int provincia;



        public int pLegajo
        {
            get { return legajo; }
            set { legajo = value; }
        }
        public string pNombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string pApellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        public int pTipoDoc
        {
            get { return tipoDoc; }
            set { tipoDoc = value; }
        }
        public int pNroDoc
        {
            get { return nroDoc; }
            set { nroDoc = value; }
        }

        public DateTime pFecNac
        {
            get { return fecNac; }
            set { fecNac = value; }
        }
        public int pGenero
        {
            get { return genero; }
            set { genero = value; }
        }
        public DateTime pFechaIngreso
        {
            get { return fechaIngreso; }
            set { fechaIngreso = value; }
        }
        public string pUsuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        public int ptipo
        {
            get { return tipo; }
            set { tipo = value; }
        }
        public string pCalle
        {
            get { return calle; }
            set { calle = value; }
        }
        public int pAltura
        {
            get { return altura; }
            set { altura = value; }
        }
        public int pBarrio
        {
            get { return barrio; }
            set { barrio = value; }
        }

        public long pTelefono
        {
            get { return telefono; }
            set { telefono = value; }
        }
        public string pEmail
        {
            get { return email; }
            set { email = value; }
        }
        public string pContrasena
        {
            get { return contrasena; }
            set { contrasena = value; }
        }

        public int pLocalidad
        {
            get { return localidad; }
            set { localidad = value; }
        }

        public int pProvincia
        {
            get { return provincia; }
            set { provincia = value; }
        }

        public Empleado()
        {
            legajo = 0;
            nombre = "";
            apellido = "";
            tipoDoc = 0;
            nroDoc = 0;
            fecNac = DateTime.Today;
            genero = 0;
            fechaIngreso = DateTime.Today;
            usuario = "";
            tipo = 0;
            calle = "";
            altura = 0;
            barrio = 0;
            contrasena = "";
            localidad = 0;
            provincia = 0;
        }

        public Empleado(int legajo, string nombre, string apellido, int tipoDoc, int nroDoc, DateTime fecNac, int genero, DateTime fechaIngreso, string usuario, int tipo, string calle, int altura, int barrio,string contrasena, int localidad, int provincia)
        {
            this.legajo = legajo;
            this.nombre = nombre;
            this.apellido = apellido;
            this.tipoDoc = tipoDoc;
            this.nroDoc = nroDoc;
            this.fecNac = fecNac;
            this.genero = genero;
            this.fechaIngreso = fechaIngreso;
            this.usuario = usuario;
            this.tipo = tipo;
            this.calle = calle;
            this.altura = altura;
            this.barrio = barrio;
            this.contrasena = contrasena;
            this.localidad = localidad;
            this.provincia = provincia;
        }

        public string toStringEmpleado()
        {
            return 
                      nombre +" "+ apellido;



        }

        //PROCEDIMIENTO LOGIN

        public DataTable LoginDeAcceso(Empleado empleado)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_Login";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@usuario", empleado.usuario);
            conexion.Comando.Parameters.AddWithValue("@contrasena", empleado.contrasena);
            DataTable tabla = new DataTable();
            tabla.Load(conexion.Comando.ExecuteReader());
            conexion.CerrarConexion();
            return tabla;
        }

        public DataTable MostrarEmpleado()
        {
            string nombreSP = "sp_MostrarEmpleado";
            DataTable tabla = conexion.Mostrar(nombreSP);
            return tabla;
        }

        public void InsertarEmpleado(Empleado empleado)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_insertarEmpleado";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre", empleado.pNombre);
            conexion.Comando.Parameters.AddWithValue("@apellido", empleado.pApellido);
            conexion.Comando.Parameters.AddWithValue("@idTipoDoc", empleado.pTipoDoc);
            conexion.Comando.Parameters.AddWithValue("@numeroDoc", empleado.pNroDoc);
            conexion.Comando.Parameters.AddWithValue("@fechaNac", empleado.fecNac);
            conexion.Comando.Parameters.AddWithValue("@idGenero", empleado.pGenero);
            conexion.Comando.Parameters.AddWithValue("@fechaIngreso", empleado.pFechaIngreso);
            conexion.Comando.Parameters.AddWithValue("@idTipoEmpleado", empleado.ptipo);
            conexion.Comando.Parameters.AddWithValue("@calle", empleado.pCalle);
            conexion.Comando.Parameters.AddWithValue("@altura", empleado.pAltura);
            conexion.Comando.Parameters.AddWithValue("@idBarrio", empleado.pBarrio);
            conexion.Comando.Parameters.AddWithValue("@telefono", empleado.pTelefono);
            conexion.Comando.Parameters.AddWithValue("@email", empleado.pEmail);
            conexion.Comando.Parameters.AddWithValue("@usuario", empleado.pUsuario);
            conexion.Comando.Parameters.AddWithValue("@contrasena", empleado.contrasena);
            conexion.Comando.Parameters.AddWithValue("@localidad", empleado.pLocalidad);
            conexion.Comando.Parameters.AddWithValue("@provincia", empleado.pProvincia);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public void ModificarEmpleado(Empleado empleado)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_ModificarEmpleado";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre", empleado.pNombre);
            conexion.Comando.Parameters.AddWithValue("@apellido", empleado.pApellido);
            conexion.Comando.Parameters.AddWithValue("@idTipoDoc", empleado.pTipoDoc);
            conexion.Comando.Parameters.AddWithValue("@fechaNac", empleado.pFecNac);
            conexion.Comando.Parameters.AddWithValue("@idGenero", empleado.pGenero);
            conexion.Comando.Parameters.AddWithValue("@fechaIngreso", empleado.pFechaIngreso);
            conexion.Comando.Parameters.AddWithValue("@idTipoEmpleado", empleado.ptipo);
            conexion.Comando.Parameters.AddWithValue("@calle", empleado.pCalle);
            conexion.Comando.Parameters.AddWithValue("@altura", empleado.pAltura);
            conexion.Comando.Parameters.AddWithValue("@idBarrio", empleado.pBarrio);
            conexion.Comando.Parameters.AddWithValue("@telefono", empleado.pTelefono);
            conexion.Comando.Parameters.AddWithValue("@email", empleado.pEmail);
            conexion.Comando.Parameters.AddWithValue("@localidad", empleado.pLocalidad);
            conexion.Comando.Parameters.AddWithValue("@provincia", empleado.pProvincia);
            conexion.Comando.Parameters.AddWithValue("@usuario", empleado.pUsuario);
            conexion.Comando.Parameters.AddWithValue("@contrasena", empleado.pContrasena);
            conexion.Comando.Parameters.AddWithValue("@numeroDoc", empleado.pNroDoc);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public void EliminarEmpleado(Empleado empleado)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_EliminarEmpleado";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@numeroDoc", empleado.pNroDoc);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }


        //BUSCAR EMPLEADO POR NOMBRE

        public DataTable BuscarEmpleadoPorNombre(string buscar)
        {
            string nombreSP = "spbuscar_empleado_nombre";
            DataTable tabla = conexion.Buscar(nombreSP, buscar);
            return tabla;
        }


        //METODO BUSCAR POR DOCUMENTO

        public DataTable BuscarEmpleadoPorDNI(string buscar)
        {
            string nombreSP = "spbuscar_empleado_documento";
            DataTable tabla = conexion.Buscar(nombreSP, buscar);
            return tabla;
        }



    }
}

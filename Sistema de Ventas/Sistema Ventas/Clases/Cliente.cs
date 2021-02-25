using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Integrador.Clases
{
    class Cliente
    {

        Conexion conexion = new Conexion();
        private SqlCommand comando = new SqlCommand();
        //private SqlDataReader Leer;


        private int clienteId;
        private string nombre;
        private string apellido;
        private int idtipoDoc;
        private int nroDocumento;
        private DateTime fechaNacimiento;
        private int idgenero;
        private string calle;
        private int altura;
        private int idbarrio;
        private long telefono;
        private string email;
        private int localidad;
        private int provincia;
        

        public int pClienteId
        {
            get { return clienteId; }
            set { clienteId = value; }
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

        public int pidTipoDoc
        {
            get { return idtipoDoc; }
            set { idtipoDoc = value; }
        }
        public int pNroDocumento
        {
            get { return nroDocumento; }
            set { nroDocumento = value; }
        }

        public DateTime pFechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }
        public int pGenero
        {
            get { return idgenero; }
            set { idgenero = value; }
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
            get { return idbarrio; }
            set { idbarrio = value; }
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

        public Cliente()
        {
            clienteId = 0;
            nombre = "";
            apellido = "";
            idtipoDoc = 0;
            nroDocumento = 0;
            fechaNacimiento = DateTime.Today;
            idgenero = 0;
            calle = "";
            altura = 0;
            idbarrio = 0;
            localidad = 0;
            provincia = 0;
        }
        public Cliente(int clienteId, string nombre, string apellido, int tipoDoc, int nroDocumento, DateTime fechaNacimiento, int genero, string calle, int altura, int barrio,long tel, string emai,int localidad, int provincia)
        {
            this.clienteId = clienteId;
            this.nombre = nombre;
            this.apellido = apellido;
            this.idtipoDoc = tipoDoc;
            this.nroDocumento = nroDocumento;
            this.fechaNacimiento = fechaNacimiento;
            this.idgenero = genero;
            this.calle = calle;
            this.altura = altura;
            this.idbarrio = barrio;
            this.pTelefono = tel;
            this.pEmail = emai;
            this.pLocalidad = localidad;
            this.pProvincia = provincia;
        }

        //METODO MOSTRAR CLIENTES
        public DataTable MostrarClientes()
        {
            string nombreSP = "sp_MostrarClientes";
            DataTable tabla = conexion.Mostrar(nombreSP);
            return tabla;
        }

       


        
        //METODO INSERTAR

        public void InsertarCliente(Cliente cliente)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_insertarClientes";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre",cliente.pNombre);
            conexion.Comando.Parameters.AddWithValue("@apellido", cliente.pApellido);
            conexion.Comando.Parameters.AddWithValue("@idTipoDoc", cliente.pidTipoDoc);
            conexion.Comando.Parameters.AddWithValue("@numeroDoc", cliente.pNroDocumento);
            conexion.Comando.Parameters.AddWithValue("@fechaNac", cliente.pFechaNacimiento);
            conexion.Comando.Parameters.AddWithValue("@idGenero", cliente.pGenero);
            conexion.Comando.Parameters.AddWithValue("@calle", cliente.pCalle);
            conexion.Comando.Parameters.AddWithValue("@altura", cliente.pAltura);
            conexion.Comando.Parameters.AddWithValue("@idBarrio", cliente.pBarrio);
            conexion.Comando.Parameters.AddWithValue("@telefono", cliente.pTelefono);
            conexion.Comando.Parameters.AddWithValue("@email", cliente.pEmail);
            conexion.Comando.Parameters.AddWithValue("@idlocalidad", cliente.pLocalidad);
            conexion.Comando.Parameters.AddWithValue("@idprovincia", cliente.pProvincia);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }


        //METODO EDITAR
        public void ModificarCliente(Cliente cliente)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_ModificarClientes";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre", cliente.pNombre);
            conexion.Comando.Parameters.AddWithValue("@apellido", cliente.pApellido);
            conexion.Comando.Parameters.AddWithValue("@idTipoDoc", cliente.pidTipoDoc);
            conexion.Comando.Parameters.AddWithValue("@fechaNac", cliente.pFechaNacimiento);
            conexion.Comando.Parameters.AddWithValue("@idGenerto", cliente.pGenero);
            conexion.Comando.Parameters.AddWithValue("@calle", cliente.pCalle);
            conexion.Comando.Parameters.AddWithValue("@altura", cliente.pAltura);
            conexion.Comando.Parameters.AddWithValue("@idBarrio", cliente.pBarrio);
            conexion.Comando.Parameters.AddWithValue("@telefono", cliente.pTelefono);
            conexion.Comando.Parameters.AddWithValue("@email", cliente.pEmail);
            conexion.Comando.Parameters.AddWithValue("@idlocalidad", cliente.pLocalidad);
            conexion.Comando.Parameters.AddWithValue("@idprovincia", cliente.pProvincia);
            conexion.Comando.Parameters.AddWithValue("@numeroDoc", cliente.pNroDocumento);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }


        //METODO ELIMINAR

        public void EliminarCliente(Cliente cliente)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_EliminarClientes";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@numeroDocu", cliente.pNroDocumento);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }


        //METODO BUSCAR POR NOMBRE

        public DataTable BuscarClientePorNombre(string buscar)
        {
            string nombreSP = "spbuscar_cliente_nombre";
            DataTable tabla = conexion.Buscar(nombreSP,buscar);
            return tabla;
        }

        //METODO BUSCAR POR DOCUMENTO

        public DataTable BuscarClientePorDNI(string buscar)
        {
            string nombreSP = "spbuscar_cliente_documento";
            DataTable tabla = conexion.Buscar(nombreSP, buscar);
            return tabla;
        }

        

        public string toStringCliente()
        {
            return
                   pNroDocumento.ToString()+ "-"+ nombre +"  "+ apellido;

        }
    }
}

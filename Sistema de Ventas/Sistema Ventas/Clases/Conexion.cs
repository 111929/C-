using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Integrador.Clases
{
    class Conexion
    {
        SqlConnection conexion;
        SqlCommand comando;
        SqlDataReader lector;
        string cadenaConexion = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=SistemaVentasIntegrador;Integrated Security=True";


        //PROPIEDADES
        public SqlDataReader Lector { get => lector; set => lector = value; }
        public string CadenaConexion { get => cadenaConexion; set => cadenaConexion = value; }
        public SqlCommand Comando { get => comando; set => comando = value; }



        //METODOS CONSTRUCTORES
        public Conexion()
        {
            conexion = new SqlConnection();
            conexion.ConnectionString = CadenaConexion;
            Comando = new SqlCommand();
        }

        public Conexion(string cadenacon)
        {
            conexion = new SqlConnection(CadenaConexion);
            Comando = new SqlCommand();
        }


        //METODO ABRIR CONEXION

        public void AbrirConexion()
        {
            conexion.Open();
            Comando.Connection = conexion;
            Comando.CommandType = CommandType.Text;
        }

        //METODO CERRAR CONEXION

        public void CerrarConexion()
        {
            conexion.Close();
        }

        //METODO PARA LEER DATAREADER

        public void LeerTabla(string nombreTabla)
        {
            AbrirConexion();
            Comando.CommandText = "select * from " + nombreTabla;
            Lector = Comando.ExecuteReader();
        }

        //METODO PARA CONSULTAR TABLA

        public DataTable ConsultarTabla(string nombreTabla)
        {
            AbrirConexion();
            Comando.CommandText = "select * from " + nombreTabla;
            DataTable tabla = new DataTable();
            tabla.Load(Comando.ExecuteReader());
            CerrarConexion();
            return tabla;
        }



        //METODO PARA LISTAR LOS CAMPOS DE LAS TABLAS.
        public DataTable Mostrar(string nombreSp)
        {
            DataTable tabla = new DataTable();
            AbrirConexion();
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.CommandText = nombreSp;
            lector = Comando.ExecuteReader();
            tabla.Load(lector);
            CerrarConexion();
            return tabla;
        }

        public DataTable ValidarDatos(string nombreTabla, int doc, string email)
        {
            AbrirConexion();
            comando.CommandText = $"SELECT * FROM " + nombreTabla + " WHERE NroDocumento= '" + doc + "'or email= '" + email + "'";

            DataTable tabla = new DataTable();
            tabla.Load(comando.ExecuteReader());
            CerrarConexion();
            return tabla;
        }


        //METODO BUSCAR POR NOMBRE

        public DataTable Buscar(string nombreSP, string buscar)
        {
            DataTable tabla = new DataTable();
            AbrirConexion();
            comando.CommandText = nombreSP;
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@textobuscar", buscar);
            Lector = comando.ExecuteReader();
            tabla.Load(Lector);
            comando.Parameters.Clear();
            CerrarConexion();
            return tabla;
        }

        ////////////////////////////////////////////////////////////////////////////////
        ///




    }
}

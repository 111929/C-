using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Integrador.Clases
{
    class Articulo
    {
        Conexion conexion = new Conexion();

        private int ariculoId;
        private string nombre;
        private string descripcion;
        private int marcaId;
        private int categoriaId;
        private int presentacionId;
        private decimal precioVenta;
        private int stock;


        public int pAriculoId
        {
            get { return ariculoId; }
            set { ariculoId = value; }
        }
        public string pNombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string pDescripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        public int pMarca
        {
            get { return marcaId; }
            set { marcaId = value; }
        }
        public int pCategoria
        {
            get { return categoriaId; }
            set { categoriaId = value; }
        }
        public int pPresentacion
        {
            get { return presentacionId; }
            set { presentacionId = value; }
        }
        public decimal pPrecioVenta
        {
            get { return precioVenta; }
            set { precioVenta = value; }
        }
        public int pStock
        {
            get { return stock; }
            set { stock = value; }
        }


        public Articulo()
        {
            ariculoId = 0;
            nombre = "";
            descripcion = "";
            marcaId = 0;
            categoriaId = 0; ;
            presentacionId = 0;
            precioVenta = 0;
            stock = 0;
        }
        public Articulo(int ariculoId, string nombre,string desc, int marcaId, int categoriaI, int presentacionId, decimal precioVenta, int stock)
        {
            this.ariculoId = ariculoId;
            this.nombre = nombre;
            this.descripcion = desc;
            this.marcaId = marcaId;
            this.categoriaId =  categoriaI;
            this.presentacionId = presentacionId;
            this.precioVenta = precioVenta;
            this.stock = stock;
        }

        public DataTable MostrarArticulos()
        {
            string nombreSP = "sp_MostrarArticulos";
            DataTable tabla = conexion.Mostrar(nombreSP);
            return tabla;
        }

        //METODO INSERTAR ARTICULO
        public void InsertarArticulos(Articulo Articulo)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_insertarArticulos";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre", Articulo.pNombre);
            conexion.Comando.Parameters.AddWithValue("@descripcion", Articulo.pDescripcion);
            conexion.Comando.Parameters.AddWithValue("@idmarca", Articulo.pMarca);
            conexion.Comando.Parameters.AddWithValue("@idcategoria", Articulo.pCategoria);
            conexion.Comando.Parameters.AddWithValue("@idpresentacion", Articulo.pPresentacion);
            conexion.Comando.Parameters.AddWithValue("@stock", Articulo.pStock);
            conexion.Comando.Parameters.AddWithValue("@precioVenta", Articulo.pPrecioVenta);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        //METODO MODIFICAR ARTICULO
        public void ModificarArticulos(Articulo Articulo)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_modificarArticulos";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@nombre", Articulo.pNombre);
            conexion.Comando.Parameters.AddWithValue("@descripcion", Articulo.pDescripcion);
            conexion.Comando.Parameters.AddWithValue("@idmarca", Articulo.pMarca);
            conexion.Comando.Parameters.AddWithValue("@idcategoria", Articulo.pCategoria);
            conexion.Comando.Parameters.AddWithValue("@idpresentacion", Articulo.pPresentacion);
            conexion.Comando.Parameters.AddWithValue("@stock", Articulo.pStock);
            conexion.Comando.Parameters.AddWithValue("@precioVenta", Articulo.pPrecioVenta);
            conexion.Comando.Parameters.AddWithValue("@id_Articulo", Articulo.pAriculoId);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        //METODO ELIMINAR ARTICULO
        public void EliminarArticulo(Articulo Articulo)
        {
            conexion.AbrirConexion();
            conexion.Comando.CommandText = "sp_borrarArticulos";
            conexion.Comando.CommandType = CommandType.StoredProcedure;
            conexion.Comando.Parameters.AddWithValue("@id_Articulo", Articulo.pAriculoId);
            conexion.Comando.ExecuteNonQuery();
            conexion.Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }


        //METODO BUSCAR POR NOMBRE

        public DataTable BuscarArticuloPorNombre(string buscar)
        {
            string nombreSP = "spbuscar_articulo_nombre";
            DataTable tabla = conexion.Buscar(nombreSP, buscar);
            return tabla;
        }


        //METODO BUSCAR POR CODIGO

        public DataTable BuscarArticuloPorCodigo(string buscar)
        {
            string nombreSP = "spbuscar_articulo_codigo";
            DataTable tabla = conexion.Buscar(nombreSP, buscar);
            return tabla;
        }



        public string toStringArticulos()
        {
            return nombre;
        }




    }
}

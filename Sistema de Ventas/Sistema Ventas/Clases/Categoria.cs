using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;

namespace Integrador.Clases
{
    class Categoria
    {

        Conexion conexion = new Conexion();

        private int categoriaId;
        private string nombreCategoria;
        private string descripcion;

        public int pCategoriaId
        {
            get { return categoriaId; }
            set { categoriaId = value; }
        }
        public string pNombreCategoria
        {
            get { return nombreCategoria; }
            set { nombreCategoria = value; }
        }
        public string pDescripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public Categoria()
        {
            categoriaId = 0;
            nombreCategoria = "";
            descripcion = "";
        }
        public Categoria(int categoriaId, string nombreCategoria, string descripcion)
        {
            this.categoriaId = categoriaId;
            this.nombreCategoria = nombreCategoria;
            this.descripcion = descripcion;
        }

        //METODO PARA CARGAR COMBO DE CATEGORIA
        public void CargarComboCategoria(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Categorias");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class Marca
    {
        Conexion conexion = new Conexion();
        private int idMarca;
        private string NombreMarca;

        public Marca()
        {
            idMarca = 0;
            NombreMarca = "";

        }
        public Marca(int marca, string nombre)
        {
            this.idMarca = 0;
            this.NombreMarca = "";


        }
        public int pIdmarca
        {
            set { idMarca = value; }
            get { return idMarca; }
        }
        public string pNombreMarca
        {
            set { NombreMarca = value; }
            get { return NombreMarca; }
        }
        public void CargarComboMarca(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Marcas");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }
    }
}

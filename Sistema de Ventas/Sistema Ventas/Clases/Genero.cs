using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class Genero
    {
        Conexion conexion = new Conexion();
        private int generoId;
        private string genero;


        public int pGeneroId
        {
            get { return generoId; }
            set { generoId = value; }
        }


        public string pGenero
        {
            get { return genero; }
            set { genero = value; }
        }
        public Genero()
        {
            generoId = 0;
            genero = "";
        }

        public Genero(int generoId, string genero)
        {
            this.generoId = generoId;
            this.genero = genero;
        }

        public void CargarComboGenero(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Generos");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }



        public string toStringGenero()
        {
            return "Codigo Genero: " + generoId +
                    "Genero_ " + genero;
        }
    }
}

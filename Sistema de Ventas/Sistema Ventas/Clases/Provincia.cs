using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class Provincia
    {
        Conexion conexion = new Conexion();
        private int codigoProvincia;
        private string nombreProvincia;

        public int pCodigoProvincia
        {
            get { return codigoProvincia; }
            set { codigoProvincia = value; }
        }
        public string pNombreProvincia
        {
            get { return nombreProvincia; }
            set { nombreProvincia = value; }
        }


        public Provincia()
        {
            codigoProvincia = 0;
            nombreProvincia = "";
        }
        public Provincia(int codigoProvincia, string nombreProvincia)
        {
            this.codigoProvincia = codigoProvincia;
            this.nombreProvincia = nombreProvincia;
        }

        public void CargarComboProvincias(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Provincias");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
            
        }

    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class Localidad
    {
        Conexion conexion = new Conexion();
        private int codigoLocalidad;
        private string nombreLocalidad;
        


        public int pCodigoLocalidad
        {
            get { return codigoLocalidad; }
            set { codigoLocalidad = value; }
        }
        public string pNombreLocalidad
        {
            get { return nombreLocalidad; }
            set { nombreLocalidad = value; }
        }

       

        public Localidad()
        {
            codigoLocalidad = 0;
            nombreLocalidad = "";
            
        }
        public Localidad(int codigoLocalidad, string nombreLocalidad)
        {
            this.codigoLocalidad = codigoLocalidad;
            this.nombreLocalidad = nombreLocalidad;
           
        }

        public void CargarComboLocalidades(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Localidades");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }

    }
}

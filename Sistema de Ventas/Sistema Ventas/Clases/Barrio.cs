using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class Barrio
    {
        Conexion conexion = new Conexion();
        private int codigoBarrio;
        private string nombreBarrio;
        


        public int pCodigoBarrio
        {
            get { return codigoBarrio; }
            set { codigoBarrio = value; }
        }
        public string pNombreBarrio
        {
            get { return nombreBarrio; }
            set { nombreBarrio = value; }
        }

       

        public Barrio()
        {
            codigoBarrio = 0;
            nombreBarrio = "";
            
        }
        public Barrio(int codigoBarrio, string nombreBarrio)
        {
            this.codigoBarrio = codigoBarrio;
            this.nombreBarrio = nombreBarrio;
            
        }

        public void CargarComboBarrio(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Barrios");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;

        }
    }
}

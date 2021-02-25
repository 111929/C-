using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;

namespace Integrador.Clases
{
    class TipoEmpleado
    {
        Conexion conexion = new Conexion();
        private int tipoEmpleadoId;
        private string tipoEmpleado;


        public int pTipoEmpleadoId
        {
            get { return tipoEmpleadoId; }
            set { tipoEmpleadoId = value; }
        }
        public string pTipoEmpleado
        {
            get { return tipoEmpleado; }
            set { tipoEmpleado = value; }
        }

        public TipoEmpleado()
        {
            tipoEmpleadoId = 0;
            tipoEmpleado = "";

        }
        public TipoEmpleado(int tipoEmpleadoId, string tipoEmpleado)
        {
            this.tipoEmpleadoId = tipoEmpleadoId;
            this.tipoEmpleado = tipoEmpleado;

        }

        public void CargarComboTipoEmpleado(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("TiposEmpleados");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Integrador.Clases
{
    class TipoDocumento
    {
        Conexion conexion = new Conexion();
        private int tipoDocumentoId;
        private string tipoDocumento;


        public int pTipoDocumentoId
        {
            get { return tipoDocumentoId; }
            set { tipoDocumentoId = value; }
        }
        public string pTipoDocumento
        {
            get { return tipoDocumento; }
            set { tipoDocumento = value; }
        }

        public TipoDocumento()
        {
            tipoDocumentoId = 0;
            tipoDocumento = "";
        }

        public TipoDocumento(int tipoDocumentoId, string tipoDocumento)
        {
            this.tipoDocumentoId = tipoDocumentoId;
            this.tipoDocumento = tipoDocumento;
        }

        public void CargarComboTipoDocumento(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("TiposDocumentos");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }


       
    }
}

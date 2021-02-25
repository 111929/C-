using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;

namespace Integrador.Clases
{
    class Presentacion
    {

        Conexion conexion = new Conexion();
        private int idPresentaciones;
        private string NombrePresentacion;
        private string Descripcion;

        public Presentacion()
        {
            idPresentaciones = 0;
            NombrePresentacion = "";
            Descripcion = "";
        }

        public Presentacion(int idprese, string nombreprese, string descrip)
        {
            this.idPresentaciones = idprese;
            this.NombrePresentacion = nombreprese;
            this.Descripcion = descrip;

        }

        public int pIdpresentacion
        {
            set { idPresentaciones = value; }
            get { return idPresentaciones; }
        }
        public string pNombreprese
        {
            set { NombrePresentacion = value; }
            get { return NombrePresentacion; }
        }
        public string pDescripcionPrse
        {
            set { Descripcion = value; }
            get { return Descripcion; }
        }

        public void CargarComboPresentacion(ComboBox combo)
        {
            DataTable tabla = new DataTable();
            tabla = conexion.ConsultarTabla("Presentaciones");
            combo.DataSource = tabla;
            combo.ValueMember = tabla.Columns[0].ColumnName;
            combo.DisplayMember = tabla.Columns[1].ColumnName;
            combo.DropDownStyle = ComboBoxStyle.DropDownList;
        }


    }
}

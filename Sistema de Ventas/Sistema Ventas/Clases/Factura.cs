using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Integrador
{
    class Factura
    {
        private int nroFactura;
        private DateTime fecha;
        private int idcliente;
        private int idempleado;
        private int idtipo;
        private float iva;

        public int pnroFactura
        {
            get { return nroFactura; }
            set { nroFactura = value; }
        }
        public DateTime pFecha
        {
            get { return fecha; }
            set { fecha = value; }
        }
        public int pCliente
        {
            get { return idcliente; }
            set { idcliente = value; }
        }
        public int pEmpleado
        {
            get { return idempleado; }
            set { idempleado = value; }
        }
        public int pTipo
        {
            get { return idtipo; }
            set { idtipo = value; }
        }
        public float pIva
        {
            get { return iva; }
            set { iva = value; }
        }

        public Factura()
        {
            nroFactura = 0;
            fecha = DateTime.Today;
            idcliente = 0;
            idempleado = 0;
            idtipo = 0;
            iva = 0;
        }
        public Factura(int nroFactura, DateTime fecha, int cliente, int empleado, int tipo, float iva)
        {
            this.nroFactura = nroFactura;
            this.fecha = fecha;
            this.idcliente = cliente;
            this.idempleado = empleado;
            this.idtipo = tipo;
            this.iva = iva;
        }

    }
}

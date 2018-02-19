using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGLibrary.Services
{
    public class Obligaciones 
    {
  
        private TB_transCab _un_TB_transCab;

        public TB_transCab TB_transCab
        {
            get { return _un_TB_transCab; }
            set { _un_TB_transCab = value; }
        }

        private List<TB_ObligacionesTitulares> _un_TB_ObligacionesTitulares;

        public List<TB_ObligacionesTitulares> TB_ObligacionesTitulares
        {
            get { return _un_TB_ObligacionesTitulares; }
            set { _un_TB_ObligacionesTitulares = value; }
        }

        private List<TB_ObligacionesCuotas> _un_TB_ObligacionesCuotas;

        public List<TB_ObligacionesCuotas> TB_ObligacionesCuotas
        {
            get { return _un_TB_ObligacionesCuotas; }
            set { _un_TB_ObligacionesCuotas = value; }
        }


        public Obligaciones()
        {
           
        }

        public Obligaciones(TB_transCab p_TB_transCab, List<TB_ObligacionesTitulares> p_TB_ObligacionesTitulares, List<TB_ObligacionesCuotas>  p_TB_ObligacionesCuotas)
        {
            this._un_TB_transCab = p_TB_transCab;
            this._un_TB_ObligacionesTitulares = p_TB_ObligacionesTitulares;
            this._un_TB_ObligacionesCuotas = p_TB_ObligacionesCuotas;
        }

    }
}

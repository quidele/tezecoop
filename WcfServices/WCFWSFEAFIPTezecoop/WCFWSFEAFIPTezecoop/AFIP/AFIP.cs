using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WCFWSFEAFIPTezecoop.AFIP
{
    public static class AFIP
    {
        public static int ValidarCUIT(string p_cuit)
        {
            
        int l_verificador;
        int l_resultado = 0;
        string l_cuit_nro ="";
        int l_validacion =0;
        string l_codes  = "6789456789";
        int l_cuit_nro_numerico;

	    if (p_cuit ==null)
		    return 0;
		
	    l_cuit_nro = p_cuit.Trim ().Replace ("-","");  //  REPLACE(RTRIM(l_cuit), '-', '')

	    if (int.TryParse  (l_cuit_nro, out l_cuit_nro_numerico))
            return 0;
    	

	    if (l_cuit_nro.Length!= 11)
        {
		    l_validacion = 0;
		    return l_validacion;
	    }

	    l_verificador = int.Parse ( l_cuit_nro.Substring(10,1));

	    int l_x = 0;

	    while (l_x < 10)
        {
            int l_digitoValidador  = int.Parse ( l_codes.Substring ( l_x , 1));
		    int l_digito  = int.Parse ( l_cuit_nro.Substring( l_x , 1)); 
		    int l_digitoValidacion  = l_digitoValidador * l_digito;
		    l_resultado = l_resultado + l_digitoValidacion;
		    l_x = l_x + 1;
        }
	
		
	    l_resultado = l_resultado % 11; 

	    if (l_resultado == l_verificador)
		    l_validacion = 1;
	    else
		    l_validacion = 0;

        return l_validacion; 
            
        }
    }
}
using ADGV;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace SGLibrary.GUIUtilities
{
    public class ADGVInicilizations
    {

        public static void  ADGV_ColorearGrillaxCorteValorFormatearFecha(AdvancedDataGridView  dgv, string p_nombre_columna_corte, string p_nombre_columna_fecha)
        {

            // Coloreamos cortando por licencia 
            //  para asignar colores tenemos que realuizar un corte de control 
            // por licencia
            string nrLicencia_anterior = "";

            var Color_Fondo_1 = Color.DarkGreen;
            var Color_Letra_1 = Color.White;
            var Color_Fondo_2 = Color.Orange;
            var Color_Letra_2 = Color.Black;
            var Color_Fondo = Color.DarkGreen;
            var Color_Letra = Color.White;

            if (dgv.Rows.Count > 0)
            {
                nrLicencia_anterior = dgv.Rows[0].Cells[p_nombre_columna_corte].Value.ToString();
            }

            foreach (DataGridViewRow item in dgv.Rows)
            {
                var row = item;
                if (nrLicencia_anterior.CompareTo(row.Cells[p_nombre_columna_corte].Value.ToString()) != 0)
                {
                    if (Color_Fondo == Color_Fondo_1)
                    {
                        Color_Fondo = Color_Fondo_2;
                        Color_Letra = Color_Letra_2;
                    }
                    else
                    {
                        Color_Fondo = Color_Fondo_1;
                        Color_Letra = Color_Letra_1;
                    }
                }

                row.DefaultCellStyle.BackColor = Color_Fondo;
                row.DefaultCellStyle.ForeColor = Color_Letra;
                if (p_nombre_columna_fecha != "")
                    row.Cells[p_nombre_columna_fecha].Value = row.Cells[p_nombre_columna_fecha].Value.ToString().Remove(10);
                nrLicencia_anterior = row.Cells[p_nombre_columna_corte].Value.ToString();
            }


        } // Cierra  ADGV_TitularesCuotas_Inicilizacion
    }
}

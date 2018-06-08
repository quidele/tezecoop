using ADGV;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;


namespace SGLibrary.GUIUtilities
{
    public class ADGVInicilizations
    {

        public static void  ColorearGrillaxCorteValorFormatearFecha(AdvancedDataGridView  dgv, string p_nombre_columna_corte, string p_nombre_columna_fecha)
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

        // Agregar a datagridview la lista de datos
        public static void CargarDataGridView(DataGridView dgv, IEnumerable<Object> lista,
                                        DataSet p_DataSet, BindingSource p_BindingSource,
                                        Dictionary<string, ADGVFieldAdapter> p_lista_campo_tipo,
                                        Boolean muestra_indice = true)
        {

            /*
             this.dataSet1.Clear();
             this.bindingSource1.Clear();
             this.dataGridView1.Rows.Clear(); 
            **/

            // A la lista la transfiere al DATASET
            p_DataSet = Extensiones.Extensions.ToDataSet(lista, p_lista_campo_tipo,muestra_indice);
            //Al binding source le configuramos el dataset
            p_BindingSource.DataSource = p_DataSet;
            // Al binding source le configuramos su datamenber , sino no transfiere los datos al datagrid
            p_BindingSource.DataMember = p_DataSet.Tables[0].TableName;

            try
            {
                Trace.TraceInformation(dgv.ToString());
                Trace.TraceInformation(lista.ToString());

                dgv.AutoGenerateColumns = false;
                //dgv.Rows.Clear();
                dgv.Columns.Clear();

                foreach (var item in p_lista_campo_tipo)
                {
                    DataGridViewColumn columna = new DataGridViewColumn();
                    DataGridViewCell cell = new DataGridViewTextBoxCell();
                    columna.CellTemplate = cell;
                    columna.Name = item.Value.Name;
                    columna.HeaderText = item.Value.HeaderText;
                    columna.ReadOnly = item.Value.ReadOnly;
                    columna.Visible = item.Value.Visible;
                    columna.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                    dgv.Columns.Add(columna);
                    columna.DataPropertyName = item.Value.DataPropertyName;
                }

                dgv.DataSource = p_BindingSource;
                dgv.AutoResizeRowHeadersWidth(DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders);
            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                Trace.TraceError("Error Linea " + frame.GetFileLineNumber().ToString() + " columna " + frame.GetFileColumnNumber().ToString());
                Trace.TraceError(ex.ToString());
                throw;
            }

        }



        public static void ColorearGrillaxEstadoVencimiento(AdvancedDataGridView dgv, string p_nombre_columna_estado,
             string p_nombre_columna_fecha_vencimiento, Dictionary<string, Color> estados_color, string estado_fecha_vencida)
        {

            foreach (DataGridViewRow item in dgv.Rows)
            {
                var row = item;
                var estado = row.Cells[p_nombre_columna_estado].Value.ToString().Trim();

                if (estado.CompareTo("") == 0) continue;
                var estado_color = estados_color.Where(c => c.Key.CompareTo(estado) == 0).First();
                var fecha_vencimiento = DateTime.Parse(row.Cells[p_nombre_columna_fecha_vencimiento].Value.ToString().Remove(10));
                if ((estado_color.Key.CompareTo(estado_fecha_vencida)==0) &&  ( fecha_vencimiento < DateTime.Now  )) {
                    row.DefaultCellStyle.BackColor = Color.Red;
                } else{
                    row.DefaultCellStyle.BackColor = estado_color.Value;
                }
                

            }


        } // Cierra  ADGV_TitularesCuotas_Inicilizacion
    }// cierra clase 


}

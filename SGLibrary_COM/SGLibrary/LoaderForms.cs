using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Windows.Forms;

namespace SGLibrary
{
    

    [Guid("1E9AF149-048E-40E5-9B37-A399CA82950E")]
    public interface LoaderForms_Interface
    {
        [DispId(1)]
        void execFormulario(string nombre);
        [DispId(2)]
        void UsuarioActivo(string usuario);
        [DispId(3)]
        void CajaActiva(string caja);
        
    }

    // Events interface para LoaderForms 
    [Guid("29E9CB38-451C-40E0-AE9A-3C7B6F857C59"),
    InterfaceType(ComInterfaceType.InterfaceIsIDispatch)]
    public interface LoaderForms_Events
    {
    }


    [Guid("5D57578F-6786-4F9B-B7F9-6A362E360816"),
    ClassInterface(ClassInterfaceType.None),
    ComSourceInterfaces(typeof(LoaderForms_Events))]
    public class LoaderForms : ServiceModel, LoaderForms_Interface
    {

        private String _usuarioActivo;
        private String _cajactiva;
        private List<String> _listado_Errores;


        public override string Usuario
        {
            get
            {
                return this._usuarioActivo;
            }
            set
            {
                this._usuarioActivo = value;
            }
        }


        public override string CajaAdm
        {
            get
            {
                return this._cajactiva;
            }
            set
            {
                this._cajactiva = value;
            }
        }

        public override String ListaErrores()
        {
            String lista_errores = "";
            foreach (var item in this._listado_Errores)
            {
                lista_errores = lista_errores + "\n" + item;
            }
            return lista_errores;
        }


        public void UsuarioActivo(string value)
        {
            this._usuarioActivo = value;

        }


        public void CajaActiva(string value)
        {
            this._cajactiva = value;

        }

        public void execFormulario(string value)
        {
            try
            {
                Object  f = new Form ();
                switch (value)
                {
                    case "FrmResumenNrosCAIs":
                        f = new FrmResumenNrosCAIs();
                        break;
                    default:
                        break;
                }
                Form objForm = (Form) f;
                objForm.ShowDialog();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Trace.TraceError(ex.Message);
                System.Windows.Forms.MessageBox.Show(ex.Message, "ERROR ");
            }
        }
    }
}

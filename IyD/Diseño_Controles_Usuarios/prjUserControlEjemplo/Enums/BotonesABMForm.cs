using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApplication1.Enums
{

    using System.ComponentModel;

    /// <summary>
    /// Enumerator for ABMBotonesForm
    /// </summary>
    public enum ABMBotonesForm
    {


        /// <summary>
        /// ABMBotonesForm - FIND
        /// </summary>
        [Description("FIND")]
        FIND = 1,

        /// <summary>
        /// ABMBotonesForm - EDIT
        /// </summary>
        [Description("EDIT")]
        EDIT,

        /// <summary>
        /// ABMBotonesForm - ADD
        /// </summary>
        [Description("ADD")]
        ADD,

        /// <summary>
        /// ABMBotonesForm - DELETE
        /// </summary>
        [Description("DELETE")]
        DELETE,

        /// <summary>
        /// ABMBotonesForm - SAVE
        /// </summary>
        [Description("SAVE")]
        SAVE,

        /// <summary>
        /// ABMBotonesForm - CANCEL
        /// </summary>
        [Description("CANCEL")]
        CANCEL
    }

    
}

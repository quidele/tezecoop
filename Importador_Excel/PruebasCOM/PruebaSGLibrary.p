      
      
define variable miexcel as com-handle.
 
create "SGLibrary.ServiceExcel" miexcel.

/* configurando el ambiente de prueba */
miexcel:InitializeExcel(). 

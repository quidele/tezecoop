

/* define variable global_userid as character.*/

/* for each ad_mstr   where ad_addr >= "B2265" and ad__qad05 <>''  :
   display   ad_mstr with 1 col. 
   update  ad__qad05 . 
end. */

/* B2265 */ 


define variable averiguando_tamanio as character.

   for each zpart_mstr where zpart__chr02 > '': 
      
      assign averiguando_tamanio = zpart__chr02.
      if LENGTH(averiguando_tamanio)>8 then do:
          display zpart__chr02 with 1 col.
          
          message "EULISES: PRUEBA EUL ." VIEW-AS ALERT-BOX ERROR.
      end.
       /* zpart__chr02 */ 
   end.



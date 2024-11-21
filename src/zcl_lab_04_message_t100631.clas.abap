CLASS zcl_lab_04_message_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_04_message_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


* 1. Símbolos de texto

    out->write( TEXT-001 ).

*2. Funciones de descripción

    DATA: lv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          lv_char_number  TYPE i.



    lv_char_number = numofchar( lv_order_status ).

    out->write( |NUMOFCHAR = { lv_char_number }|  ).


    lv_char_number  = strlen( lv_order_status ).

    out->write( |STRLEN = { lv_char_number  }|  ).

    lv_char_number = count( val = lv_order_status sub = 'A' case = abap_false ).

    out->write( |CONTAR A = { lv_char_number  }|  ).

    lv_char_number = find( val = lv_order_status sub = 'Exit' ).

    out->write( |FIND = { lv_char_number  }|  ).


*3. Funciones de procesamiento

*Cambiar elformato del contenido de la variable a mayúsculas,minúsculas y a un mixto entre los 2 formatos.

    out->write( |MAYUSCULAS = { to_upper( lv_order_status )  } |  ).
    out->write( |MINUSCULAS = { to_lower( lv_order_status )  } |  ).
    out->write( |MIXTO = { to_mixed( lv_order_status )  } |  ).

* Desplazar los 9 primeros caracteres al final de la variable.

    out->write( |DESPLAZAR 9 = { shift_right( val = lv_order_status circular = 9 )  } |  ).

*Extraer la palabra “Completed” de la variable.

    out->write( |EXTRAER = { substring( val = lv_order_status  off = 9 len = 9 )  } |  ).

*Revertir el orden de los caracteres de la variable.

    out->write( |REVERTIR = { reverse( lv_order_status )  } |  ).


* 4. Funciones de contenido

    DATA: lv_pattern TYPE string,
          lv_phone   TYPE string.

    lv_pattern = '\d{3}-\d{3}-\d{4}'.
    lv_phone = '123-456-7899'.

    IF contains( val = lv_phone pcre = lv_pattern ).
      out->write( 'telefono ok' ).
    ELSE.
      out->write( 'formato no correcto' ).

    ENDIF.

* 5. Funciones con expresiones regulares

    DATA lv_email TYPE string.

    lv_email = 'abc2@gmail.com'.

    CLEAR lv_pattern.

    lv_pattern = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF contains( val = lv_email pcre = lv_pattern ).
      out->write( 'correo ok' ).
    ELSE.
      out->write( 'formato incorrecto' ).

    ENDIF.



  ENDMETHOD.

ENDCLASS.

CLASS zcl_lab_08_fieldsymbol_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_08_fieldsymbol_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* 1. Declaración

    DATA lv_employee TYPE string VALUE 'Maria'.

    FIELD-SYMBOLS <lfs_employee> TYPE string.

    ASSIGN lv_employee TO <lfs_employee>.

    <lfs_employee> = 'Roberto'.

    out->write( |Field symbols = { lv_employee } | ).
    out->write( |\n| ).

*2. Declaración en línea

*FIELD-SYMBOLS <lfs_employee2> TYPE ZEMP_LOGALI.

    SELECT FROM zemp_logali
    FIELDS *
    INTO TABLE @DATA(lt_employees).

    out->write( data = lt_employees name = 'tabla sin cambio' ).

    LOOP AT lt_employees ASSIGNING FIELD-SYMBOL(<lfs_employee2>).

      <lfs_employee2>-email = 'fs_email@gmail.com'.

    ENDLOOP.

    out->write( |\n| ).
    out->write( data = lt_employees name = 'field symbols' ).

*3. Añadir un registro

    APPEND INITIAL LINE TO lt_employees ASSIGNING FIELD-SYMBOL(<lsf_employee3>).

    <lsf_employee3> = VALUE #( client = sy-mandt
                               id     = 123456
                               email  = 'appendfs@gmail.com'
                               ape1   = 'Perez'
                               ape2   = 'Gomez'
                               name   = 'Maria'
                               fechan = '19891013'
                               fechaa = '20241025' ).
    IF <lsf_employee3> IS ASSIGNED .
      out->write( |\n| ).
      out->write( data = lt_employees name = 'Append' ).

      UNASSIGN <lsf_employee3>.
    ENDIF.

*4. Insertar un registro

    INSERT INITIAL LINE INTO lt_employees ASSIGNING FIELD-SYMBOL(<lsf_employee4>) INDEX 2.

    <lsf_employee4> = VALUE #( client = sy-mandt
                               id     = 654321
                               email  = 'insertfs@gmail.com'
                               ape1   = 'Lopez'
                               ape2   = 'Diaz'
                               name   = 'Juan'
                               fechan = '19900512'
                               fechaa = '20241105' ).

    IF <lsf_employee4> IS ASSIGNED .
      out->write( |\n| ).
      out->write( data = lt_employees name = 'Insert' ).

      UNASSIGN <lsf_employee4>.
    ENDIF.

*5. Leer registro

    READ TABLE lt_employees ASSIGNING FIELD-SYMBOL(<lsf_employee5>) INDEX 1.

    IF <lsf_employee5> IS ASSIGNED.
      <lsf_employee5>-name = 'Mario'.
      <lsf_employee5>-email = 'leer-modificarfs@gmail.com'.

      out->write( |\n| ).
      out->write( data = lt_employees name = 'leer y modificar' ).

    ENDIF.

* 6. Coerción– Casteo

    DATA lv_date TYPE d.
    lv_date = cl_abap_context_info=>get_system_date( ).

    ASSIGN lv_date TO FIELD-SYMBOL(<lsf_employee6>).

    out->write( |\n| ).
    out->write( |fecha: { lv_date DATE = USER } | ).







  ENDMETHOD.

ENDCLASS.

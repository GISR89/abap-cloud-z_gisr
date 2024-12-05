CLASS zcl_lab_05_invoice_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.




CLASS zcl_lab_05_invoice_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*1. Concatenación

 DATA: mv_exercise     TYPE n LENGTH 4,
          mv_invoice_no   TYPE n LENGTH 8,
          mv_invoice_code TYPE string.

    mv_exercise = '9876'.
    mv_invoice_no = '12345678'.

    CONCATENATE mv_exercise mv_invoice_no INTO mv_invoice_code  SEPARATED BY `/`.

    out->write( |Concatenacion = { mv_invoice_code } | ).


*2. Concatenaciones líneas de Tablas


 SELECT FROM zemp_logali
    FIELDS ape1
    INTO TABLE @DATA(lt_employees).

    DATA(lv_string_itab) = concat_lines_of( table = lt_employees sep = ` ` ).

    out->write( |concatenaciones linea de tablas = { lv_string_itab }| ).


*3. Condensación


    DATA : mv_case1 TYPE string,
           mv_case2 TYPE string.

    mv_case1 = 'Sales invoice with      status in process'.
    mv_case2 = '***ABAP*Cloud***'.


    mv_case1 = condense( mv_case1 ).

    out->write( |mv_case1 = { mv_case1 } | ).

    mv_case2 = condense(  val = mv_case2 del = '*' ).

    out->write( |mv_case2 = { mv_case2 } | ).



*4. SPLIT

    DATA: mv_data        TYPE string VALUE '0001111111;LOGALIGROUP;2024',
          mv_id_customer TYPE string,
          mv_customer    TYPE string,
          mv_year        TYPE string.

    SPLIT mv_data AT ';' INTO mv_id_customer mv_customer mv_year .

    out->write( |mv_id_customer = { mv_id_customer } | ).
    out->write( |mv_customer = { mv_customer } | ).
    out->write( |mmv_year = { mv_year } | ).



*5. SHIFT

DATA mv_invoice_num TYPE string VALUE '2015ABCD'.

    mv_invoice_num = shift_left( val = mv_invoice_num places = 2  ).
    mv_invoice_num = shift_right( val = mv_invoice_num places = 2  ).

    out->write( |shift = { mv_invoice_num  } | ).


*6. Funciones STRLEN y NUMOFCHAR

  DATA: mv_response TYPE string VALUE `  Generating Invoice  `,
          mv_count    TYPE i.

    mv_count = strlen( mv_response ).

    out->write( |STRLEN = { mv_count } | ).

    mv_count = numofchar( mv_response ).

    out->write( |NUMOFCHAR = { mv_count } | ).


*7. Funciones TO_LOWER y TO_UPPER

 DATA mv_translate_invoice TYPE string VALUE 'Report the issuance of this invoice'.

    mv_translate_invoice = to_upper( mv_translate_invoice ).

    out->write( |mayusculas = { mv_translate_invoice } | ).

    mv_translate_invoice = to_lower( mv_translate_invoice ).

    out->write( |minusculas = { mv_translate_invoice } | ).



*8. Función INSERT y REVERSE



 mv_translate_invoice = insert(  val = mv_translate_invoice sub = ' to client' off = 35 ).

    out->write( |Insert = { mv_translate_invoice } | ).

    mv_translate_invoice = reverse(  mv_translate_invoice ).

    out->write( |reverse = { mv_translate_invoice } | ).






  ENDMETHOD.

ENDCLASS.

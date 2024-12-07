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

**1. Concatenación
*
* DATA: mv_exercise     TYPE n LENGTH 4,
*          mv_invoice_no   TYPE n LENGTH 8,
*          mv_invoice_code TYPE string.
*
*    mv_exercise = '9876'.
*    mv_invoice_no = '12345678'.
*
*    CONCATENATE mv_exercise mv_invoice_no INTO mv_invoice_code  SEPARATED BY `/`.
*
*    out->write( |Concatenacion = { mv_invoice_code } | ).
*
*
**2. Concatenaciones líneas de Tablas
*
*
* SELECT FROM zemp_logali
*    FIELDS ape1
*    INTO TABLE @DATA(lt_employees).
*
*    DATA(lv_string_itab) = concat_lines_of( table = lt_employees sep = ` ` ).
*
*    out->write( |concatenaciones linea de tablas = { lv_string_itab }| ).
*
*
**3. Condensación
*

*    DATA : mv_case1 TYPE string,
*           mv_case2 TYPE string.
*
*    mv_case1 = 'Sales invoice with      status in process'.
*    mv_case2 = '***ABAP*Cloud***'.
*

*
*    mv_case1 = condense( mv_case1 ).
*
*    out->write( |mv_case1 = { mv_case1 } | ).
*
*    mv_case2 = condense(  val = mv_case2 del = '*' ).
*
*    out->write( |mv_case2 = { mv_case2 } | ).
*
*
*
**4. SPLIT
*
*    DATA: mv_data        TYPE string VALUE '0001111111;LOGALIGROUP;2024',
*          mv_id_customer TYPE string,
*          mv_customer    TYPE string,
*          mv_year        TYPE string.
*
*    SPLIT mv_data AT ';' INTO mv_id_customer mv_customer mv_year .
*
*    out->write( |mv_id_customer = { mv_id_customer } | ).
*    out->write( |mv_customer = { mv_customer } | ).
*    out->write( |mmv_year = { mv_year } | ).
*
*
*
**5. SHIFT
*
*DATA mv_invoice_num TYPE string VALUE '2015ABCD'.
*
*    mv_invoice_num = shift_left( val = mv_invoice_num places = 2  ).
*    mv_invoice_num = shift_right( val = mv_invoice_num places = 2  ).
*
*    out->write( |shift = { mv_invoice_num  } | ).
*
*
**6. Funciones STRLEN y NUMOFCHAR
*
*  DATA: mv_response TYPE string VALUE `  Generating Invoice  `,
*          mv_count    TYPE i.
*
*    mv_count = strlen( mv_response ).
*
*    out->write( |STRLEN = { mv_count } | ).
*
*    mv_count = numofchar( mv_response ).
*
*    out->write( |NUMOFCHAR = { mv_count } | ).
*
*
**7. Funciones TO_LOWER y TO_UPPER
*
* DATA mv_translate_invoice TYPE string VALUE 'Report the issuance of this invoice'.
*
*    mv_translate_invoice = to_upper( mv_translate_invoice ).
*
*    out->write( |mayusculas = { mv_translate_invoice } | ).
*
*    mv_translate_invoice = to_lower( mv_translate_invoice ).
*
*    out->write( |minusculas = { mv_translate_invoice } | ).
*
*
*
**8. Función INSERT y REVERSE
*
*
*
* mv_translate_invoice = insert(  val = mv_translate_invoice sub = ' to client' off = 35 ).
*
*    out->write( |Insert = { mv_translate_invoice } | ).
*
*    mv_translate_invoice = reverse(  mv_translate_invoice ).
*
*    out->write( |reverse = { mv_translate_invoice } | ).

*1. OVERLAY
    DATA(lv_sale) = 'Purchase Completed'.
    DATA(lv_sale_status) = 'Invoice           '.


    OVERLAY lv_sale_status WITH lv_sale.

    out->write( |Overlay = { lv_sale_status } | ).


*2. Función SUBSTRING

    DATA(lv_result) = 'SAP-ABAP-32-PE'.

    lv_result = substring( val = lv_result off = 9 len = 5 ).

    out->write( |Substring = { lv_result } | ).


    lv_result = 'SAP-ABAP-32-PE'.

    lv_result = substring_before( val = lv_result sub = 'ABAP' ).

    out->write( |ANTES DE ABAP = { lv_result } | ).

    lv_result = 'SAP-ABAP-32-PE'.

    lv_result = substring_after( val = lv_result sub = 'ABAP' ).

    out->write( |DESPUES DE ABAP = { lv_result } | ).

*3. FIND

    DATA: lv_status TYPE string VALUE 'INVOICE GENERATED SUCCESSFULLY',
          lv_count  TYPE i.

    lv_count = find_any_of( val = lv_status sub = 'GEN' ).

    lv_count = sy-fdpos .

    out->write( |posicion 'Gen' = { lv_count } | ).

    FIND ALL OCCURRENCES OF 'A' IN lv_status MATCH COUNT lv_count.

    out->write( |Cantidad de 'a' ' = { lv_count } | ).


*4. REPLACE

    DATA lv_request TYPE string VALUE 'SAP-ABAP-32-PE'.

    lv_request = replace( val = lv_request sub = '-' with = '/' occ = 0 ).

    out->write( |Replace = { lv_request } | ).


* 5. PCRE Regex

    DATA: lv_regex TYPE string VALUE '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$',
          lv_email TYPE string VALUE 'pepito_perez@gmail.com'.

    FIND PCRE lv_regex IN lv_email.

    IF sy-subrc EQ 0.

      out->write( 'CORREO OK' ).

    ELSE.

      out->write( 'CORREO NO OK' ).


    ENDIF.

* 6. Expresiones regulares

    DATA lv_idcustome TYPE string VALUE '0000012345'.

    lv_regex = '*'.

    lv_idcustome = replace(  val = lv_idcustome pcre = '0' with = lv_regex occ = 0 ).


    out->write( |expresiones regulares = { lv_idcustome } | ).


* 7. Repetición de strings

    lv_idcustome = repeat(  val = lv_idcustome occ = 3 ).

    out->write( |repeticion de string = { lv_idcustome } | ).


*8. Función ESCAPE

    DATA lv_format TYPE string VALUE 'Send payment data via Internet '.

    lv_format = escape(  val = lv_format format = cl_abap_format=>e_url_full ). "url

    out->write( |url = { lv_format } | ).

    lv_format = 'Send "payment" data via Internet \ @300 '.

    lv_format = escape(  val = lv_format format = cl_abap_format=>e_json_string ). "json

    out->write( |json = { lv_format } | ).

    lv_format = 'Send payment data via Internet: |,\,{*}'.

    lv_format = escape(  val = lv_format format = cl_abap_format=>e_string_tpl ). "string template

    out->write( |string template = { lv_format } | ).


  ENDMETHOD.

ENDCLASS.

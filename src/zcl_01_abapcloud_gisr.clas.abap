CLASS zcl_01_abapcloud_gisr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abapcloud_gisr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lv_string TYPE string, "variable de tipo string (cadena de caracteres)
          lv_int    TYPE i VALUE 20250110, " variable de tipo numero entero
          lv_date   TYPE d, " variable tipo fecha
          lv_dec    TYPE p LENGTH 8 DECIMALS 2 VALUE '202501.10',
          lv_car    TYPE c LENGTH 10 VALUE 'LOGALI'.

    lv_string = '20250110'.
    lv_date = '20250110'.


    out->write( lv_string ).
    out->write( lv_int ).
    out->write( lv_date ).
    out->write( lv_dec ).
    out->write( lv_car ).

  ENDMETHOD.

ENDCLASS.

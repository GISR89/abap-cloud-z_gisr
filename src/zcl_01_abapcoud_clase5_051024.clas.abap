CLASS zcl_01_abapcoud_clase5_051024 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_01_abapcoud_clase5_051024 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA: lv_num1  TYPE i VALUE 20,
*          lv_num2  TYPE i VALUE 30,
*          lv_suma  TYPE i,
*          lv_total TYPE p LENGTH 6 DECIMALS 2.
*
*    "suma
*    lv_suma = lv_num1 + lv_num2.
*    out->write( lv_suma ).
*
*    lv_suma += 50.
*    out->write( lv_suma ).
*
*    "ADD
*
*    "resta
*
*    DATA(lv_resta) = lv_num2 - lv_num1.
*    out->write( lv_resta ).
*
*    "subtract
*
*    "multiplicacion
*    lv_total = lv_num1 * lv_num2.
*    out->write( |Numer 1: { lv_num1 } numer 2: { lv_num2 } Total: { lv_total } | ).
*
*    "clear
*    "multiply
*
*    lv_total = lv_total * 5.
*    out->write( lv_total ).
*
*    "div
*    lv_total = lv_num1 / lv_num2.
*    out->write( lv_total ).
*
*    "divide
*
*    lv_total = ( lv_num1 + lv_num2 ) / 3.
*    out->write( lv_total ).
*
*    "exp
*
*    lv_num1 = 3.
*
*    lv_num1 = lv_num1 ** 2.
*    out->write( lv_num1 ).
*
*
*    "ipow
*    DATA(lv_result) = ipow( base = 2 exp = 3 ).
*    out->write( lv_result ).


*
*    DATA: lv_date    TYPE d,
*          lv_decimal TYPE p LENGTH 6 DECIMALS 4,
*          lv_string  TYPE string VALUE 'LOGALI',
*          lv_int     TYPE i,
*          lv_char    TYPE c LENGTH 2.

*    lv_int = lv_string.
*    out->write( lv_int ).

*    lv_string = '20250101'.
*
*    lv_date = lv_string

*    out->write( | string value = { lv_string } | ).
*    out->write( | date value = { lv_date DATE = USER } | ).

*
*    "TRUNCAMIENTO, SE PIERDEN CARACTERES
*    lv_char = lv_string.
*    out->write( lv_char ).
*
*    "redondeo
*    lv_decimal = 1 / 6.
*    out->write( lv_decimal ).
*
*    lv_decimal = 1 / 12.
*    out->write( lv_decimal ).

*
*    DATA(lv_date2) = '20250101'.
*    out->write( lv_date2 ).
*
*    DATA(lv_date3) = CONV d( lv_date2 ).
*    out->write( | { lv_date3 DATE = USER } | ).


    DATA: lv_date  TYPE d VALUE '20250101',
          lv_date2 TYPE d VALUE '20250622',
          lv_time  TYPE t,
          lv_type2 TYPE c LENGTH 6.

*    lv_date = cl_abap_context_info=>get_system_date( ).
*    lv_time = cl_abap_context_info=>get_system_time( ).
*    lv_time2 = cl_abap_context_info=>get_user_time_zone( ).
*
*    out->write( lv_date ).
*    out->write( lv_time ).
*    out->write( lv_time ).
*

*    DATA(lv_days) = lv_date2 - lv_date.
*    out->write(  lv_days ).
*
*
*    "aaaammdd
*    "offset
*
*    DATA(lv_month) = lv_date2+4(2).
*    out->write( lv_month ).
*
*    DATA(lv_year) = lv_date2(4).
*    out->write( lv_year ).
*
*    DATA(lv_day) = lv_date+6(2).
*    out->write( lv_day ).


    out->write( TEXT-001 ).
    out->write( TEXT-002 ).
    out->write(  'this is your first txt symbols' ).






  ENDMETHOD.

ENDCLASS.

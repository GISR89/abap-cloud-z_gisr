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

*
*    DATA: lv_date  TYPE d VALUE '20250101',
*          lv_date2 TYPE d VALUE '20250622',
*          lv_time  TYPE t,
*          lv_type2 TYPE c LENGTH 6.

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

*
*    out->write( TEXT-001 ).
*    out->write( TEXT-002 ).
*    out->write(  'this is your first txt symbols' ).
*
*    DATA: lv_num1 TYPE i VALUE 6,
*          lv_num2 TYPE i VALUE 4,
*          lv_num3 TYPE i.
*
*    lv_num3 = 3 ** 2.
*
*
*    out->write( lv_num3 ).

*CONCATENACION

*&&
*| |
*CONCATENATE

    DATA :lv_string_a TYPE string VALUE 'Welcome to logali group',
          lv_string_b TYPE string.
*
*    lv_string_b = 'ABAP' && `**` && 'Student'.
*
*    out->write( lv_string_b ).
*
*    CONCATENATE lv_string_a lv_string_b INTO DATA(lv_fin_string) SEPARATED BY ` `.
*
*    out->write( lv_fin_string ).
*
*    out->write( | Concatenation 1: { lv_fin_string } / { lv_string_a } | ).
*
*    SELECT FROM /dmo/flight
*    FIELDS carrier_id
*    INTO TABLE @DATA(lt_itab).
*
*    DATA(lv_itab_string) = concat_lines_of( table = lt_itab sep = '-' ).
*
*    out->write( lv_itab_string ).
*

*Condensacion

    lv_string_a = '          Welcome   to  Logali  Group  '.

*    lv_string_a = condense(  lv_string_a ).
*
*    out->write( lv_string_a ).
*
*    lv_string_a = condense( val = lv_string_a from = `` ).
*    out->write( lv_string_a ).
*
*      lv_string_a = condense( val = lv_string_a to = `` ).
*    out->write( lv_string_a ).

*    lv_string_a = condense( val = '!!!ABAP!!COURSE!!' del = '!' ).
*    out->write( lv_string_a ).


*Split
*
*    DATA(lv_inv) = 'INV-2024-001-000X'.
*
*    DATA(lv_year) = segment( val = lv_inv index = 2 sep = `-` ).
*    DATA(lv_cust) = segment( val = lv_inv index = 3 sep = `-` ).
*    out->write( | year { lv_year } | ).
*    out->write( lv_cust ).

*Shift
*
*    CONSTANTS gc_initial(20) TYPE c VALUE '       ABC123'.
*    DATA(lv_final_str) = gc_initial.
*
**out->write(  | initial value : { lv_final_str }| ).
**
**lv_final_str = shift_left( val = lv_final_str places = 2 ).
**out->write(  | initial value : { lv_final_str }| ).
**
**lv_final_str = shift_right( val = lv_final_str places = 2 ).
**out->write(  | initial value : { lv_final_str }| ).
*
**    lv_final_str = shift_right( val = lv_final_str circular = 2 ).
**    out->write( lv_final_str ).
*
* lv_final_str = shift_right( val = lv_final_str sub = '123' ).
*    out->write( lv_final_str ).

*strlen numofchar

*    DATA lv_val TYPE c LENGTH 6.
*
*    DATA(lv_val) = strlen( 'Logali group   ' ).
*    out->write( lv_val  ).
*
*    DATA(lv_val2) = strlen( `Logali group  ` ).
*    out->write( lv_val2 ).
*
*    DATA(lv_val3) = numofchar( 'Logali Group   ' ).
*    out->write( lv_val3 ).
*
*    DATA(lv_val4) = numofchar( `Logali group  ` ).
*    out->write( lv_val4 ).


* = EQ
* < LT
* > GT
* >= GE
* <= LE
* <> NE

    DATA(lv_cust) = 'X'.

*    IF lv_cust EQ 'A'.
*      out->write(  | Customer 1 { lv_cust }| ).
*
*    ELSEIF lv_cust EQ 'B'.
*      out->write(  | Customer 2 { lv_cust }| ).
*
*    ELSE.
*
*      out->write(  | Customer don´t exist | ).
*
*    ENDIF.
*
*    DATA(lv_text) = ' ABAP'.
*    DATA(lv_text2) = 'Programming'.
*    DATA(lv_text3) = 'X'.

*    IF lv_text = 'ABAP'.
*      IF lv_text2 = 'Programming'.
*        IF lv_text3 = 'Class'.
*          out->write( 'Correct' ).
*        ELSE.
*          out->write( 'Incorrect' ).
*
*        ENDIF.
*      ENDIF.
*    ENDIF.

*    DATA(lv_num) = 3.
*
*    IF lv_num EQ 3 AND lv_cust EQ 'A'.
*      out->write( 'Valid value' ).
*
*    ELSE.
*      out->write( 'Incorrect' ).
*
*    ENDIF.
*
*clear lv_num.
*
*if lv_num is INITIAL.
*out->write( 'THE VARIABLE IS EMPTY' ).
*ENDIF.

*CASE

    lv_cust = 'A'.

    CASE lv_cust.

      WHEN 'A'.
        out->write( |Customer 1 { lv_cust }| ).

      WHEN 'B'.
        out->write( |Customer 2 { lv_cust }| ).


      WHEN 'C'.
        out->write( |Customer 3 { lv_cust }| ).

      WHEN OTHERS.

        out->write(  'INCORRECT' ).

    ENDCASE.


*DO/ENDDO

    DATA lv_cont TYPE i.

*    DO 20 TIMES.
*
*      lv_cont += 1.
*
*      out->write(  |COUNT { lv_cont }| ).
*
*      IF lv_cont EQ 10.
*        out->write(  |stop { lv_cont }| ).
*
*      ENDIF.
*
*    ENDDO.

*WHILE

    WHILE lv_cont LT 30.
      lv_cont += 1.
      out->write(  |COUNT { lv_cont }| ).

    ENDWHILE.


*COND

    lv_cust = 'A'.

    DATA(lv_inv) = COND string( WHEN lv_cust = 'A' THEN | INVA01|
                                WHEN lv_cust = 'B' THEN | INVA02|
                                WHEN lv_cust = 'C' THEN | INVA03|
                                ELSE | INVALID| ).

    out->write( lv_inv ).

*SWITCH
*
    DATA(lv_inv2) = SWITCH string( lv_cust
                                 WHEN 'A' THEN | INVA01 |
                                 WHEN 'B' THEN | INVA02 |
                                 WHEN 'C' THEN | INVA03 |
                                  ELSE | INVALID | ).
*
*
  ENDMETHOD.

ENDCLASS.

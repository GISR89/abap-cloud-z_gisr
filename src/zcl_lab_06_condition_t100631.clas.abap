CLASS zcl_lab_06_condition_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS asignar_valor_a_variable IMPORTING im_valor TYPE string
                                     EXPORTING ex_valor TYPE string.


ENDCLASS.



CLASS zcl_lab_06_condition_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* 1. IF / ENDIF


    DATA lv_conditional TYPE i VALUE 7.

    IF lv_conditional EQ 5.

      out->write( lv_conditional ).

    ELSEIF lv_conditional EQ 7.

      out->write( 'es igual a 7' ).

    ELSE.

      out->write( 'no es igual a 7' ).


    ENDIF.


    out->write( |\n| ) .

* 2. CASE /ENDCASE

    DATA lv_string TYPE string.

    DO 3 TIMES.

      CASE sy-index.
        WHEN 1.
          lv_string = 'LOGALI'.
        WHEN 2.
          lv_string = 'SAP'.
        WHEN 3.
          lv_string = 'MOVISTAR'.
      ENDCASE.

      CASE lv_string.

        WHEN 'LOGALI'.

          out->write( |CASE = { lv_string } | ).
          out->write( 'Academy' ).

        WHEN 'SAP'.

          out->write( |CASE = { lv_string } | ).
          out->write( 'Enterprise software' ).

        WHEN OTHERS.
          out->write( |CASE = { lv_string } | ).
          out->write( 'Unknown' ).


      ENDCASE.

    ENDDO.

    out->write( |\n| ) .

*3. DO/ENDDO

    DATA lv_counter TYPE i.

    lv_counter = 0.

    DO 10 TIMES.

      out->write( | DO/ENDDO = { lv_counter } | ).

      lv_counter += 1.

    ENDDO.

    out->write( |\n| ) .

*4. CHECK

    lv_counter = 0.

    DO 10 TIMES.

      out->write( |CHECK = { lv_counter } | ).

      lv_counter += 1.

      CHECK lv_counter = 7 .

      EXIT.

    ENDDO.

    out->write( |\n| ) .

*5. SWITCH

    me->asignar_valor_a_variable( EXPORTING im_valor = 'LOGALI'
                                  IMPORTING ex_valor = DATA(lv_string_2) ).

    out->write( |switch = { lv_string_2 } | ).

    me->asignar_valor_a_variable( EXPORTING im_valor = 'SAP'
                                  IMPORTING ex_valor = lv_string_2 ).

    out->write( |switch = { lv_string_2 } | ).

    me->asignar_valor_a_variable( EXPORTING im_valor = 'MOVISTAR'
                                  IMPORTING ex_valor = lv_string_2  ).

    out->write( |switch = { lv_string_2 } | ).

    me->asignar_valor_a_variable( EXPORTING im_valor = 'ABAP'
                                  IMPORTING ex_valor = lv_string_2  ).

    out->write( |switch = { lv_string_2 } | ).

    out->write( |\n| ) .

*6. COND

    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).

    DATA(lv_time2) = COND #(  WHEN lv_time < '12000' THEN | { lv_time TIME = ISO } AM |
                              WHEN lv_time > '12000' THEN | { CONV t( lv_time - 12 * 3600 ) TIME = ISO } PM |
                              WHEN lv_time = '12000' THEN | High noon | ).

    out->write( |COND = { lv_time2 } | ).

    out->write( |\n| ) .

* 7. WHILE/ENDWHILE

    DATA lv_counter_2 TYPE i.

    WHILE lv_counter_2 LT 20.

      lv_counter_2 += 1.

      IF  lv_counter_2 < 11.

        out->write( |WHILE = { lv_counter_2 } | ).
      ENDIF.

    ENDWHILE.

    out->write( |\n| ) .

*8. LOOP/ENDLOOP

    SELECT FROM zemp_logali
    FIELDS *
    INTO TABLE @DATA(lt_employees).

    LOOP AT lt_employees INTO DATA(ls_employees) WHERE ape2 = 'JIMENEZ'.


      out->write( |LOOP= { ls_employees-email } | ).

    ENDLOOP.



*9. TRY/ENDTRY

    TRY.

        CLEAR lv_counter.

        DATA lv_exception TYPE f VALUE 5.

        lv_counter = 5.

        out->write( |\n| ).
        DO 5 TIMES.

          lv_counter -= 1.

          lv_exception = lv_exception /  lv_counter.

          out->write( |TRY = { lv_counter } | ).


        ENDDO.

      CATCH cx_sy_zerodivide INTO DATA(lx_zero_divide).

        out->write( 'ERROR: division by zero detected' ).

        lx_zero_divide->get_longtext(  ).

        out->write( lx_zero_divide->get_longtext(  ) ).

    ENDTRY.




  ENDMETHOD.

  METHOD asignar_valor_a_variable.


    ex_valor = SWITCH string( im_valor
                                  WHEN 'LOGALI' THEN |SAP Academy|
                                  WHEN 'SAP' THEN |Enterprise software|
                                  WHEN 'MOVISTAR' THEN |Telephony|
                                  ELSE |Unknown| ).

  ENDMETHOD.

ENDCLASS.

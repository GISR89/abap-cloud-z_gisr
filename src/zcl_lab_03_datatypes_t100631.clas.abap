CLASS zcl_lab_03_datatypes_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


*1. Conversiones de Tipo

    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345',
          mv_num   TYPE i,
          mv_float TYPE f.

    mv_num = mv_char.

    out->write( |Char como entero: { mv_char } | ).

    mv_char = mv_float.

    out->write( |Char como flotante: { mv_char } | ).


*2. Truncamiento y Redondeo

    DATA: mv_trunc TYPE i,
          mv_round TYPE i.

    mv_float = '123.45'.

    mv_trunc = mv_float.

    out->write( |Truncamiento: { mv_trunc } | ).

    mv_round =  mv_float + '0.5'.

    out->write( |Redondeo: { mv_round } | ).


*3. Tipos en declaraciones en línea

    DATA(mv_char2) = 'ABAP'.

    out->write( |Declaracion en linea: { mv_char2 } | ).


*4. Conversiones del Tipo Forzado

    mv_char = mv_num.

    out->write( |Char como entero: { mv_char } | ).

*5. Cálculo de Fecha y Hora

    DATA: mv_data_1 TYPE d VALUE '20240101',
          mv_data_2 TYPE d VALUE '20240927',
          mv_days   TYPE i,
          mv_time   TYPE t.


    mv_days = mv_data_2 - mv_data_1.


    out->write( |Numero de dias : { mv_days } | ).
    out->write( |Formato fecha : { mv_data_1 DATE = USER } | ).


*6. Campos Timestamp

    CLEAR  mv_data_2.

    DATA mv_timestamp TYPE utclong.


    mv_timestamp = utclong_current( ).

    out->write( |Fecha : { mv_timestamp } | ).

    DATA(time_zone) = cl_abap_context_info=>get_user_time_zone( ).
    CONVERT UTCLONG mv_timestamp
            INTO DATE mv_data_2 TIME mv_time
            TIME ZONE time_zone.


    out->write( |Fecha : { mv_data_2 DATE = USER }  Hora: { mv_time TIME = USER }| ).

    mv_data_2  = mv_data_2 - 2.

   out->write( |Fecha restando 2 dias : { mv_data_2  DATE = USER } | ).

  ENDMETHOD.

ENDCLASS.

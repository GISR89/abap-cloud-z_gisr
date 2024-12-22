CLASS zcl_lab_07_tables_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_07_tables_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

**1. Añadir registros
*
*    DATA: mt_employees TYPE STANDARD TABLE OF zemp_logali,
*          ms_employees TYPE zemp_logali.
*
*    mt_employees = VALUE #(  ( id   = 0001
*                             email  = 'pepito.perez@gmail.com'
*                             ape1   = 'Perez'
*                             ape2   = 'Lopez'
*                             name   = 'Pepito'
*                             fechan = '19891213'
*                             fechaa = '20241218' ) ).
*
*    APPEND VALUE #( id    = 0002
*                   email  = 'Roberto.Rios@gmail.com'
*                   ape1   = 'Rios'
*                   ape2   = 'Gomez'
*                   name   = 'Roberto'
*                   fechan = '19821020'
*                   fechaa = '20241215' ) TO mt_employees.
*
*    out->write( data = mt_employees name =  'mt_employees' ).
*
**2. Insertar registros
*
*    INSERT VALUE #( id     = 0003
*                    email  = 'diego.ramos@gmail.com'
*                    ape1   = 'Ramos'
*                    ape2   = 'Lopez'
*                    name   = 'Diego'
*                    fechan = '19910320'
*                    fechaa = '20240801' ) INTO TABLE mt_employees.
*
*    out->write( data = mt_employees name =  'mt_employees' ).
*
**3. Añadir registros con APPEND
*
*    DATA mt_employees_2 TYPE STANDARD TABLE OF zemp_logali.
*
*    ms_employees-id     = 0004.
*    ms_employees-email  = 'diego.trujillo@gmail.com'.
*    ms_employees-ape1   = 'Trujillo'.
*    ms_employees-ape2   = 'Lopez'.
*    ms_employees-name   = 'Diego'.
*    ms_employees-fechan = '19900210'.
*    ms_employees-fechaa = '20240915'.
*
*    APPEND ms_employees TO mt_employees_2.
*
*    APPEND VALUE #( id    = 0005
*                   email  = 'Luis.Martinez@gmail.com'
*                   ape1   = 'Martinez'
*                   ape2   = 'Godoy'
*                   name   = 'Luis'
*                   fechan = '19891020'
*                   fechaa = '20241025' ) TO mt_employees_2.
*
*    APPEND LINES OF mt_employees FROM 2 TO 3 TO mt_employees_2.
*
*    out->write( data = mt_employees_2  name =  'mt_employees_2' ).
*
**4. CORRESPONDING
*
    DATA: mt_spfli   TYPE STANDARD TABLE OF /dmo/connection,
          ms_spfli   TYPE /dmo/connection,
          ms_spfli_2 TYPE /dmo/connection.

*    SELECT FROM /dmo/connection
*    FIELDS *
*    WHERE carrier_id EQ 'LH'
*    INTO TABLE @mt_spfli.
*
*    ms_spfli = CORRESPONDING #( mt_spfli[ 1 ] ).
*
*    MOVE-CORRESPONDING ms_spfli TO ms_spfli_2.
*
*    out->write( data = ms_spfli_2  name =  'ms_spfli_2' ).
*
** 5. READ TABLE con índice
*
*    READ TABLE mt_spfli INTO ms_spfli INDEX 1 TRANSPORTING airport_from_id.
*
*    out->write( data = ms_spfli  name =  'ms_spfli' ).
*
**6. READ TABLE con clave
*
*    READ TABLE mt_spfli INTO ms_spfli WITH KEY airport_to_id = 'FRA'.
*
*    out->write( data = ms_spfli  name =  'ms_spfli' ).
*
**7. Chequeo de registros
*
*    SELECT FROM /dmo/connection
*    FIELDS *
*    WHERE connection_id GT 0400
*    INTO TABLE @mt_spfli.
*
*    "READ TABLE mt_spfli WITH KEY connection_id = '0407' TRANSPORTING NO FIELDS.
*
*    IF line_exists( mt_spfli[ connection_id = '0407' ]  ).
*      out->write( 'SI EXISTE EL VUELO 0407' ).
*    ELSE.
*      out->write( 'NO EXISTE EL VUELO 0407' ).
*    ENDIF.
*
** 8. Índice de un registro
*
*    "READ TABLE mt_spfli WITH KEY connection_id = '0407' TRANSPORTING NO FIELDS.
*    "data(lv_index) = sy_tabix.
*    "out->write( lv_index ).
*    DATA(lv_index) = line_index( mt_spfli[ connection_id = '0407' ]  ).
*
*    out->write( data = lv_index name = 'INDICE' ).
*
**9. Sentencia LOOP
*
    SELECT FROM /dmo/connection
    FIELDS *
    WHERE distance_unit EQ 'KM'
    INTO TABLE @mt_spfli.
*
*    LOOP AT mt_spfli INTO ms_spfli.
*      out->write( data = ms_spfli name = 'LOOP' ).
*    ENDLOOP.


* Tablas Internas Parte II

*1. FOR

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    DATA: lt_flights      TYPE TABLE OF ty_flights,
          lt_flights_info TYPE TABLE OF ty_flights.

    lt_flights = VALUE #( FOR i = 1  UNTIL i > 15
                        ( iduser     = | { 1234 + i } user |
                          aircode    = 'SQ'
                          flightnum  = 0000 + i
                          key        = 'US'
                          seat       = 0 + i
                          flightdate = cl_abap_context_info=>get_system_date( ) + i ) ).

    lt_flights_info = VALUE #( FOR i = 1  UNTIL i > 15
                    ( iduser     = | { 1234 + i } user |
                      aircode    = 'CL'
                      flightnum  = 0000 + i * 10
                      key        = 'COP'
                      seat       = 0 + i
                      flightdate = cl_abap_context_info=>get_system_date( ) + i ) ).

    out->write( data = lt_flights name = 'lt_flights' ).
    out->write( |\n| ).
    out->write( data = lt_flights_info name = 'lt_flights_info' ).

* 2.FOR Anidado

    DATA: mt_flights_type TYPE STANDARD TABLE OF /dmo/flight,
          lt_final        TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY aircode.

    SELECT FROM /dmo/flight
    FIELDS *
    INTO TABLE @mt_flights_type.

    SELECT FROM /dmo/connection
    FIELDS carrier_id, connection_id, airport_from_id
    INTO TABLE @DATA(mt_airline).

    out->write( |\n| ).
    out->write( data = mt_flights_type name = 'mt_flights_type' ).
    out->write( |\n| ).
    out->write( data = mt_airline name = 'mt_airline' ).

    lt_final = VALUE #( FOR ms_flights_type IN mt_flights_type WHERE ( carrier_id EQ 'SQ' )
                        FOR ms_airline IN mt_airline WHERE ( connection_id = ms_flights_type-connection_id )
                        ( iduser     = ms_flights_type-client
                          aircode    = ms_flights_type-carrier_id
                          flightnum  = ms_airline-connection_id
                          key        = ms_airline-airport_from_id
                          seat       = ms_flights_type-seats_occupied
                          flightdate = ms_flights_type-flight_date ) ).

    out->write( |\n| ).
    out->write( data = lt_final name = 'lt_final' ).

*3. Añadir múltiples líneas (SELECT)

    TYPES: BEGIN OF ty_airlines,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_airlines.

    DATA mt_airlines TYPE TABLE OF ty_airlines.

    SELECT carrier_id, connection_id, airport_from_id
    FROM @mt_airline AS mt
    WHERE airport_from_id EQ 'FRA'
    INTO TABLE @mt_airlines.

    out->write( |\n| ).
    out->write( data = mt_airlines name = 'mt_airlines' ).

* 4. Ordenar registros

    SORT mt_airlines BY connection_id DESCENDING.

    out->write( |\n| ).
    out->write( data = mt_airlines name = 'mt_airlines' ).

*5. Modificar registros

    out->write( |\n| ).
    out->write( data = mt_spfli name = 'mt_spfli' ).

    LOOP AT mt_spfli INTO ms_spfli.

      IF ms_spfli-departure_time GT '12:00:00'.

        ms_spfli-departure_time = cl_abap_context_info=>get_system_time( ).

        MODIFY mt_spfli FROM ms_spfli TRANSPORTING departure_time.

      ENDIF.

    ENDLOOP.

    out->write( |\n| ).
    out->write( data = mt_spfli name = 'mt_spfli' ).

*6. Eliminar registros

    LOOP AT mt_spfli INTO ms_spfli.

      IF ms_spfli-airport_to_id EQ 'FRA'.

        DELETE TABLE mt_spfli FROM ms_spfli.

      ENDIF.

    ENDLOOP.

    out->write( |\n| ).
    out->write( data = mt_spfli name = 'mt_spfli' ).

*7. CLEAR / FREE

    FREE mt_airlines.

    out->write( |\n| ).
    out->write( data = mt_airlines name = 'mt_spfli' ).

*8. Instrucción COLLECT

    TYPES: BEGIN OF ty_seats,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             seats         TYPE /dmo/plane_seats_occupied,
             bookings      TYPE /dmo/flight_price,
           END OF ty_seats.

    DATA: lt_seats   TYPE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrier_id connection_id,
          lt_seats_2 TYPE STANDARD TABLE OF ty_seats.

    SELECT carrier_id, connection_id
    FROM /dmo/flight
    WHERE seats_max EQ '140'
    INTO TABLE @lt_seats.

    out->write( |\n| ).
    out->write( data = lt_seats name = 'lt_seats' ).

    SELECT FROM /dmo/flight
    FIELDS carrier_id, connection_id, seats_occupied, price
    INTO TABLE @lt_seats_2.

    out->write( |\n| ).
    out->write( data = lt_seats_2 name = 'lt_seats_2' ).

    LOOP AT lt_seats_2 INTO DATA(ls_seats_2).

      COLLECT ls_seats_2 INTO lt_seats.

    ENDLOOP.

    out->write( |\n| ).
    out->write( data = lt_seats name = 'lt_seats' ).

*9. Instrucción LET

    CLEAR mt_flights_type.

    SELECT FROM /dmo/flight
    FIELDS *
    INTO TABLE @mt_flights_type.

    SELECT FROM /dmo/carrier
    FIELDS *
    INTO TABLE @DATA(mt_scarr).

    LOOP AT mt_flights_type INTO DATA(ms_flights_type_let).

      DATA(lv_flights_type) = CONV string( LET lv_scarr_carried = mt_scarr[ carrier_id = ms_flights_type_let-carrier_id ]-carrier_id
                                               lv_flights_price = mt_flights_type[ carrier_id = ms_flights_type_let-carrier_id
                                                                                   price = ms_flights_type_let-price ]-price
                                               IN | carried_id : { lv_scarr_carried } / price: { lv_flights_price } | ).

      out->write( |\n| ).
      out->write( lv_flights_type  ).

    ENDLOOP.

*10. Instrucción BASE

    DATA lt_flights_base TYPE STANDARD TABLE OF /dmo/flight.

    lt_flights_base = VALUE #( BASE mt_flights_type
                                   ( carrier_id = 'AA'
                                     connection_id = '0123'
                                     flight_date = cl_abap_context_info=>get_system_date(  )
                                     price = '2000'
                                     currency_code = 'EUR'
                                     plane_type_id = '767-200'
                                     seats_max = 260
                                     seats_occupied = 120 ) ).

    out->write( |\n| ).
    out->write( data = lt_flights_base name = 'lt_flights_base' ).

* 11. Agrupación de registros / *12. Agrupar por clave

    CLEAR mt_spfli.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @mt_spfli.

    DATA gt_members LIKE mt_spfli.

    LOOP AT mt_spfli ASSIGNING FIELD-SYMBOL(<lfs_spfli>)

*   GROUP BY <lfs_spfli>-airport_from_id.
   GROUP BY ( airport_from_id =  <lfs_spfli>-airport_from_id
             carreir = <lfs_spfli>-carrier_id ) INTO DATA(gs_key). "utilizo carrier_id para que se pueda visualizar la agrupacion

      CLEAR gt_members.

      LOOP AT GROUP gs_key INTO DATA(gs_members).

        gt_members = VALUE #( BASE gt_members ( gs_members ) ).

      ENDLOOP.

      out->write( |\n| ).
      out->write( data = gt_members name = 'gt_members' ).
      out->write( data = gs_key name = 'gs_key' ).

    ENDLOOP.

*13. FOR GROUPS

    out->write( |\n| ).

    TYPES lty_spfli TYPE STANDARD TABLE OF /dmo/connection-airport_from_id WITH EMPTY KEY.

    out->write( VALUE lty_spfli( FOR GROUPS gv_groups OF gs_groups IN mt_spfli
                                 GROUP BY gs_groups-airport_from_id
                                 DESCENDING
                                 WITHOUT MEMBERS (  gv_groups  ) ) ).

*14. Tablas de rangos



    TYPES lty_range TYPE RANGE OF /dmo/flight-seats_occupied.

    DATA(lt_range) = VALUE lty_range( (  sign   = 'I'
                                        option = 'BT'
                                        low    = '200'
                                        high   = '400' ) ).

    SELECT *
    FROM /dmo/flight
    WHERE seats_occupied IN @lt_range
    INTO TABLE @mt_flights_type.

    out->write( |\n| ).
    out->write( data = lt_range name = 'lt_range' ).
    out->write( data = mt_flights_type name = 'mt_flights_type' ).
    out->write( |\n| ).
*15. Enumeraciones

    TYPES : BEGIN OF ENUM mty_currency STRUCTURE mts_currency,
              c_initial ,
              c_dollar  ,
              c_euros   ,
              c_colpeso ,
              c_mexpeso ,
            END OF ENUM mty_currency STRUCTURE mts_currency.

    DATA lv_currency TYPE mty_currency.

    lv_currency = mts_currency-c_dollar.
    out->write( lv_currency ).

    lv_currency = mts_currency-c_euros.
    out->write( lv_currency ).

    lv_currency = mts_currency-c_mexpeso.
    out->write( lv_currency ).

    CASE lv_currency.

      WHEN mts_currency-c_initial.
        out->write( 'Initial' ).

      WHEN mts_currency-c_dollar.
        out->write( 'USD' ).

      WHEN mts_currency-c_euros.
        out->write( 'EUR' ).

      WHEN mts_currency-c_colpeso.
        out->write( 'COP' ).

      WHEN mts_currency-c_mexpeso.
        out->write( 'MEX' ).

      WHEN OTHERS.
        out->write( 'the value doesn´t exist' ).

    ENDCASE.




  ENDMETHOD.

ENDCLASS.

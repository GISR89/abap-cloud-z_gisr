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

*1. Añadir registros

    DATA: mt_employees TYPE STANDARD TABLE OF zemp_logali,
          ms_employees TYPE zemp_logali.

    mt_employees = VALUE #(  ( id   = 0001
                             email  = 'pepito.perez@gmail.com'
                             ape1   = 'Perez'
                             ape2   = 'Lopez'
                             name   = 'Pepito'
                             fechan = '19891213'
                             fechaa = '20241218' ) ).

    APPEND VALUE #( id    = 0002
                   email  = 'Roberto.Rios@gmail.com'
                   ape1   = 'Rios'
                   ape2   = 'Gomez'
                   name   = 'Roberto'
                   fechan = '19821020'
                   fechaa = '20241215' ) TO mt_employees.

    out->write( data = mt_employees name =  'mt_employees' ).

*2. Insertar registros

    INSERT VALUE #( id     = 0003
                    email  = 'diego.ramos@gmail.com'
                    ape1   = 'Ramos'
                    ape2   = 'Lopez'
                    name   = 'Diego'
                    fechan = '19910320'
                    fechaa = '20240801' ) INTO TABLE mt_employees.

    out->write( data = mt_employees name =  'mt_employees' ).

*3. Añadir registros con APPEND

    DATA mt_employees_2 TYPE STANDARD TABLE OF zemp_logali.

    ms_employees-id     = 0004.
    ms_employees-email  = 'diego.trujillo@gmail.com'.
    ms_employees-ape1   = 'Trujillo'.
    ms_employees-ape2   = 'Lopez'.
    ms_employees-name   = 'Diego'.
    ms_employees-fechan = '19900210'.
    ms_employees-fechaa = '20240915'.

    APPEND ms_employees TO mt_employees_2.

    APPEND VALUE #( id    = 0005
                   email  = 'Luis.Martinez@gmail.com'
                   ape1   = 'Martinez'
                   ape2   = 'Godoy'
                   name   = 'Luis'
                   fechan = '19891020'
                   fechaa = '20241025' ) TO mt_employees_2.

    APPEND LINES OF mt_employees FROM 2 TO 3 TO mt_employees_2.

    out->write( data = mt_employees_2  name =  'mt_employees_2' ).

*4. CORRESPONDING

    DATA: mt_spfli   TYPE STANDARD TABLE OF /dmo/connection,
          ms_spfli   TYPE /dmo/connection,
          ms_spfli_2 TYPE /dmo/connection.

    SELECT FROM /dmo/connection
    FIELDS *
    WHERE carrier_id EQ 'LH'
    INTO TABLE @mt_spfli.

    ms_spfli = CORRESPONDING #( mt_spfli[ 1 ] ).

    MOVE-CORRESPONDING ms_spfli TO ms_spfli_2.

    out->write( data = ms_spfli_2  name =  'ms_spfli_2' ).

* 5. READ TABLE con índice

    READ TABLE mt_spfli INTO ms_spfli INDEX 1 TRANSPORTING airport_from_id.

    out->write( data = ms_spfli  name =  'ms_spfli' ).

*6. READ TABLE con clave

    READ TABLE mt_spfli INTO ms_spfli WITH KEY airport_to_id = 'FRA'.

    out->write( data = ms_spfli  name =  'ms_spfli' ).

*7. Chequeo de registros

    SELECT FROM /dmo/connection
    FIELDS *
    WHERE connection_id GT 0400
    INTO TABLE @mt_spfli.

    "READ TABLE mt_spfli WITH KEY connection_id = '0407' TRANSPORTING NO FIELDS.

    IF line_exists( mt_spfli[ connection_id = '0407' ]  ).
      out->write( 'SI EXISTE EL VUELO 0407' ).
    ELSE.
      out->write( 'NO EXISTE EL VUELO 0407' ).
    ENDIF.

* 8. Índice de un registro

    "READ TABLE mt_spfli WITH KEY connection_id = '0407' TRANSPORTING NO FIELDS.
    "data(lv_index) = sy_tabix.
    "out->write( lv_index ).
    DATA(lv_index) = line_index( mt_spfli[ connection_id = '0407' ]  ).

    out->write( data = lv_index name = 'INDICE' ).

*9. Sentencia LOOP

    SELECT FROM /dmo/connection
    FIELDS *
    WHERE distance_unit EQ 'KM'
    INTO TABLE @mt_spfli.

    LOOP AT mt_spfli INTO ms_spfli.
      out->write( data = ms_spfli name = 'LOOP' ).
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

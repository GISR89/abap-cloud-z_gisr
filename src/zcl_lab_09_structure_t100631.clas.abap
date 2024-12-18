CLASS zcl_lab_09_structure_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_09_structure_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


*1. Declaración estructuras /

    TYPES: BEGIN OF ty_flights,
             iduser     TYPE c LENGTH 40,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights,

           BEGIN OF ty_airlines,
             carrid    TYPE /dmo/carrier_id,
             connid    TYPE /dmo/connection_id,
             countryfr TYPE land1,
             cityfrom  TYPE /dmo/city,
             airpfrom  TYPE /dmo/airport_id,
             countryto TYPE land1,
           END OF   ty_airlines.

*2. Estructuras anidadas (NESTED

    DATA :BEGIN OF ty_nested,

            flight  TYPE ty_flights,
            airline TYPE ty_airlines,

          END OF ty_nested.

*3. Estructuras complejas (DEEP)


    DATA: BEGIN OF ty_deep,
            carrid  TYPE /dmo/carrier_id,
            connid  TYPE /dmo/connection_id,
            flights TYPE ty_flights,
          END OF ty_deep.

*4. Añadir datos

    ty_nested = VALUE #( flight = VALUE #( iduser = 12345 aircode = 'AA' flightnum = 0322 key =  'ABC' seat = 123 flightdate = '20250725' )
                        airline = VALUE #(  carrid = 'LH' connid = 0018 countryfr =  'DEF' cityfrom = 'Madrid' airpfrom = 'MAD' countryto = 'ESP' ) ).

    ty_deep = VALUE #( carrid  = 'SQ'
                       connid  = '0015'
                       flights = VALUE #(  iduser     = '12345'
                                           aircode    = 'AA'
                                           flightnum  = '0322'
                                           key        = 'ABC'
                                           seat       = '123'
                                           flightdate = '20250725' ) ).

*5. Estructura INCLUDE

    DATA ty_include_flights TYPE ty_flights.

    TYPES BEGIN OF flights_types.

    INCLUDE TYPE ty_airlines.
    INCLUDE STRUCTURE ty_include_flights.

    TYPES END OF flights_types.

* 6. Eliminar datos

    CLEAR ty_nested-airline.

    CLEAR ty_deep-carrid.



  ENDMETHOD.

ENDCLASS.

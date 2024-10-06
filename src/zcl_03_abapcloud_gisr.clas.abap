CLASS zcl_03_abapcloud_gisr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abapcloud_gisr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

data: lvr_int type REF TO i,
      lvr_string TYPE REF TO string.

data lvr_ddic_tab type REF TO /dmo/airport.

data lvr_int2 like lvr_int.

**********************************************************************
types: ltyr_int type REF TO i.
data lvr_int3 type ltyr_int.


data lt_itab type table of REF TO /dmo/airport.

**********************************************************************
data lof_ref type REF TO ZCL_02_ABAPCLOUD_GISR.





  ENDMETHOD.

ENDCLASS.

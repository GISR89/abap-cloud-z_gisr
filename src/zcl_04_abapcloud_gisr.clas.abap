CLASS zcl_04_abapcloud_gisr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abapcloud_gisr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  data: lv_num1 type i value 10,
        lv_num2 type i,
        lv_num3 type i.

        CONSTANTS: lc_num4 type i value 10,
                   lc_num5 type i value 20,
                   lc_string type string value 'ABAP'.

      "lc_num4 = 5. dara error por que ya fue declarado como constante

  lv_num2 = lc_num4.

  lv_num3 = lc_num5 + 5.

  DATA(lv_invoice) = '01234XC'.
  DATA(lv_tax) = 1234.

  out->write( |Value 1 = { lv_num1 } Value 2 = { lv_num2 } Value 3 = { lv_num3 }|   ).

  out->write( 'ABAP Class - Logali'  ).
  out->write( 'Student 1'  ).

  ENDMETHOD.

ENDCLASS.

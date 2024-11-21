CLASS zcl_lab_02_arithmetic_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_t100631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*1. Suma / Sentencia ADD
    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.

    lv_total_rate = lv_base_rate + lv_corp_area_rate  + lv_medical_service_rate.

    out->write( | SUMA: { lv_total_rate } | ).

    ADD 5 TO lv_total_rate.

    out->write( | SUMA ADD: { lv_total_rate } | ).


*2. Resta / Sentencia SUBTRACT
    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10.

    CLEAR lv_total_rate.

    lv_total_rate  = lv_maintenance_rate - lv_margin_rate.

    out->write( | RESTA: { lv_total_rate } | ).

    SUBTRACT 4 FROM lv_total_rate.

    out->write( | RESTA SUBTRACT: { lv_total_rate } | ).


* 3. Multiplicación / Sentencia MULTIPLY

    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.

    lv_multi_rate = lv_package_weight * lv_cost_per_kg.

    out->write( | MULTIPLICACION: { lv_multi_rate } | ).

    MULTIPLY lv_multi_rate BY 2.

    out->write( | MULTIPLICACION multiply: { lv_multi_rate } | ).


* 4. División / Sentencia DIVIDE

    DATA: lv_total_wieght TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    lv_applied_rate = lv_total_wieght / lv_num_packages.

    out->write( | DIVISION: { lv_applied_rate } | ).

    DIVIDE lv_applied_rate BY 3.

    out->write( | DIVIDE: { lv_applied_rate } | ).


*5. División sin resto / Sentencia DIV

    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.

    lv_result =  lv_total_cost DIV lv_discount_threshold.

    out->write( | SENTENCIA DIV: { lv_result } | ).


*6. Resto (residuo) de división / Sentencia MOD

    DATA lv_remainder TYPE p LENGTH 4 DECIMALS 2.
    CLEAR lv_total_cost.
    lv_total_cost = 19.

    lv_remainder = lv_total_cost MOD lv_discount_threshold.

    out->write( | SENTENCIA mod: { lv_remainder } | ).


*7. Exponenciación

    DATA: lv_weight TYPE i VALUE 5,
          lv_expo   TYPE i.

    lv_expo = lv_weight ** 2.

    out->write( | EXPONENCIACION: { lv_EXPO } | ).


*8. Raíz cuadrada

    DATA lv_square_root TYPE i.

    lv_square_root = sqrt( lv_expo ).

    out->write( | RAIZ CUADRADA: { lv_square_root } | ).



  ENDMETHOD.

ENDCLASS.

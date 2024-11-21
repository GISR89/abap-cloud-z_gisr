CLASS zcl_02_abapcloud_gisr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_abapcloud_gisr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF lty_employee,
             id   TYPE i,
             name TYPE string,
             age  TYPE i,
           END OF lty_employee.

    DATA ls_employee TYPE lty_employee.

    ls_employee = VALUE #( id = 12345
                           name = 'Laura'
                           age = 25 ).

    "out->write( |ID: { ls_employee-id } NAME: { ls_employee-name } AGE: { ls_employee-age }| ).

    TYPES: BEGIN OF ENUM lty_invoice_status,
             pending_payment,
             paid,
           END OF ENUM lty_invoice_status.

    DATA lv_status TYPE  lty_invoice_status.

    lv_status = paid.

    out->write( lv_status ).

  ENDMETHOD.

ENDCLASS.

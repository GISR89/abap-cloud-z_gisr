CLASS zcl_lab_01_var_t100631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
*5. CONSTANTES:
  CONSTANTS : mc_purchase_date TYPE d VALUE '20240919',
                mc_purchase_time TYPE t VALUE '213200',
                mc_price         TYPE f VALUE '10.5',
                mc_tax           TYPE i VALUE 16,
                mc_increase      TYPE decfloat16 VALUE '20.5',
                mc_discounts     TYPE decfloat34 VALUE '10.5',
                mc_type          TYPE c LENGTH 10 VALUE 'PC',
                mc_shipping      TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36',
                mc_ID_CODE       TYPE n LENGTH 4 VALUE 1110,
                mc_QR_CODE       TYPE x LENGTH 5 VALUE 'F5CF',
                mc_product       TYPE string VALUE 'Laptop',
                mc_bar_code      TYPE xstring VALUE '12121121211'.

*1. TIPOS DE DATOS ELEMENTALES:
    DATA : mv_purchase_date TYPE d,
           mv_purchase_time TYPE t,
           mv_price         TYPE f,
           mv_tax           TYPE i,
           mv_increase      TYPE decfloat16,
           mv_discounts     TYPE decfloat34,
           mv_type          TYPE c LENGTH 10,
           mv_shipping      TYPE p LENGTH 8 DECIMALS 2,
           mv_ID_CODE       TYPE n LENGTH 4,
           mv_QR_CODE       TYPE x LENGTH 5,
           mv_product       TYPE string,
           mv_bar_code      TYPE xstring.

*2. TIPOS DE DATOS COMPLEJOS:
    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    DATA ls_customer TYPE mty_customer.

ENDCLASS.



CLASS zcl_lab_01_var_t100631 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    mv_purchase_date = mc_purchase_date.
    mv_purchase_time  = mc_purchase_time.
    mv_price =  mc_price.
    mv_tax = mc_tax.
    mv_increase = mc_increase.
    mv_discounts = mc_discounts.
    mv_type = mc_type.
    mv_shipping = mc_shipping.
    mv_ID_CODE =  mc_ID_CODE.
    mv_QR_CODE =  mc_QR_CODE.
    mv_product =  mc_product.
    mv_bar_code = mc_bar_code.


    ls_customer = VALUE #( id = 12345
                           customer = 'Pepito Perez'
                           age = 25 ).
* 6. DECLARACIONES EN LINEA
    DATA(lv_product) = me->mv_product.
    DATA(lv_bar_code) = me->mv_bar_code.


* 3. TIPOS DE DATOS REFERENCIAS:
*  DATA ms_employees TYPE TABLE OF REF TO snwd_employees.

    out->write( |Purchase date: { mv_purchase_date+6(2) }/{ mv_purchase_date+4(2) }/{ mv_purchase_date(4) }| ).
    out->write( |Purchase Time: { mv_purchase_time(2) }:{ mv_purchase_time+2(2) }:{ mv_purchase_time+4(2) } | ).
    out->write( |Price: { mv_price }| ).
    out->write( |Tax: { mv_tax }| ).
    out->write( |Increase: { mv_increase }| ).
    out->write( |Discounts: { mv_discounts }| ).
    out->write( |Type: { mv_type }| ).
    out->write( |Shipping: { mv_shipping }| ).
    out->write( |ID code: { mv_id_code }| ).
    out->write( |QR code: { mv_qr_code }| ).
    out->write( |Product: { mv_product }| ).
    out->write( |Bar code: { mv_bar_code }| ).
    out->write( |ID: { ls_customer-id } NAME: { ls_customer-customer } AGE: { ls_customer-age }| ).

  ENDMETHOD.

ENDCLASS.

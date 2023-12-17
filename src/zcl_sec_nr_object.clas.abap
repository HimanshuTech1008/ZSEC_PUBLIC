CLASS zcl_sec_nr_object DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_object   TYPE cl_numberrange_objects=>nr_attributes-object VALUE 'ZSEC_NR_64',
          lv_devclass TYPE cl_numberrange_objects=>nr_attributes-devclass VALUE 'ZSEC_BTP_PRACTICE',
          lv_corrnr   TYPE cl_numberrange_objects=>nr_attributes-corrnr VALUE 'TRLK904224'.
    METHODS: create_nr_object.
    METHODS: create_intervals.
    METHODS: get_nr_object.
ENDCLASS.



CLASS zcl_sec_nr_object IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*    me->create_nr_object( ).
*    me->create_intervals( ).
    me->get_nr_object( ).
  ENDMETHOD.

  METHOD create_nr_object.

    cl_numberrange_objects=>create(
      EXPORTING
        attributes = VALUE #(
                                object      = lv_object
                                domlen      = 'CHAR8'
                                percentage  = 5
                                buffer      = abap_true
                                noivbuffer  = 10
                                devclass    = lv_devclass
*                               corrnr      = lv_corrnr
                            )
      obj_text   = VALUE #(
                            object      = lv_object
                            langu       = 'E'
                            txt         = 'Create object'
                            txtshort    = 'Test create'
                           )
      IMPORTING
          errors     = DATA(lt_errors)
          returncode = DATA(lv_ret_code)
    ).

    IF line_exists( lt_errors[ 1 ] ).

    ENDIF.
  ENDMETHOD.

  METHOD create_intervals.

    cl_numberrange_intervals=>create(
      EXPORTING
        interval  = VALUE #(
                               ( subobject    = ''
                                 nrrangenr    = '01'
                                 fromnumber   = '1000000'
                                 tonumber     = '9999999'
                                 procind      = 'I'
                               )
                           )
        object    = lv_object
        subobject = ''
*              option    =
      IMPORTING
        error     = DATA(lt_error)
        error_inf = DATA(lt_error_inf)
        error_iv  = DATA(lv_error_iv)
        warning   = DATA(lv_warning)
    ).
*          CATCH cx_nr_object_not_found.
*          CATCH cx_number_ranges.

    IF lt_error IS NOT INITIAL.

    ENDIF.
  ENDMETHOD.

  METHOD get_nr_object.
    DATA: lv_nr_number TYPE cl_numberrange_runtime=>nr_number.
    cl_numberrange_runtime=>number_get(
      EXPORTING
*            ignore_buffer     =
        nr_range_nr       = '01'
        object            = lv_object
        quantity          = 00000000000000000001
*            subobject         =
*            toyear            =
      IMPORTING
        number            = lv_nr_number
*            returncode        =
*            returned_quantity =
    ).
*        CATCH cx_nr_object_not_found.
*        CATCH cx_number_ranges.

    IF lv_nr_number IS NOT INITIAL.

    ENDIF.


  ENDMETHOD.
ENDCLASS.





















CLASS zcl_sec_utility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: fill_data_master.
    METHODS: flush.
ENDCLASS.



CLASS zcl_sec_utility IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->flush( ).
    me->fill_data_master( ).

  ENDMETHOD.

  METHOD fill_data_master.
    DATA: lt_bp      TYPE TABLE OF zsec_bp_master,
          lt_product TYPE TABLE OF zsec_product_fct,
          lv_counter TYPE int4 VALUE 0.

    DO 5 TIMES.
      lv_counter = lv_counter + 1.
      APPEND VALUE #(
        bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
        bp_role         = 'Role' && | | && lv_counter
        company_name    = 'SAP LABS'
        street          = 'Street' && | | && lv_counter
        country         = 'India'
        region          = 'Madhya Pradesh'
      ) TO lt_bp.

      APPEND VALUE #(
        product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
        name = 'Product' && | | && lv_counter
        category = 'Category' && | | && lv_counter
        price = '10.55' * lv_counter
        currency = 'IN'
        discount = 60
      ) TO lt_product.
    ENDDO.

    INSERT zsec_bp_master FROM TABLE @lt_bp.
    INSERT zsec_product_fct FROM TABLE @lt_product.
  ENDMETHOD.

  METHOD flush.
    DELETE FROM: zsec_bp_master, zsec_product_fct.
  ENDMETHOD.
ENDCLASS.

CLASS lsc_zevent_r_bookingtp_2023 DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zevent_r_bookingtp_2023 IMPLEMENTATION.

  METHOD save_modified.
    IF delete-booking IS NOT INITIAL.
      RAISE ENTITY EVENT zevent_r_bookingtp_2023~BookingCancelled
    FROM VALUE #( FOR <s_travel> IN delete-booking  ( TravelID = <s_travel>-TravelID  %param = VALUE #( reasoncode ='02'  description = 'cancelled by customer' ) ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Booking
        RESULT result.
ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
ENDCLASS.

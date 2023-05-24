CLASS zcl_booking_gen_data_2023 DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .

PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.

CLASS zcl_booking_gen_data_2023 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
    DATA:
    group_id   TYPE string VALUE '2023'.
*    attachment TYPE /dmo/attachment,
*    file_name  TYPE /dmo/filename,
*    mime_type  TYPE /dmo/mime_type.

*   clear data
    DELETE FROM zbooking_2023.

    "insert travel demo data
    INSERT zbooking_2023  FROM (
        SELECT
        FROM /dmo/travel AS travel
        FIELDS
            travel~travel_id        AS travel_id,
            travel~agency_id        AS agency_id,
            travel~customer_id      AS customer_id,
            travel~begin_date       AS begin_date,
            travel~end_date         AS end_date,
            travel~booking_fee      AS booking_fee,
            travel~total_price      AS total_price,
            travel~currency_code    AS currency_code,
            travel~description      AS description,
            CASE travel~status    "[N(New) | P(Planned) | B(Booked) | X(Cancelled)]
            WHEN 'N' THEN 'O'
            WHEN 'P' THEN 'O'
            WHEN 'B' THEN 'A'
            ELSE 'X'
            END                     AS overall_status,
*            @attachment             AS attachment,
*            @mime_type              AS mime_type,
*            @file_name              AS file_name,
            travel~createdby        AS created_by,
            travel~createdat        AS created_at,
            travel~lastchangedby    AS last_changed_by,
            travel~lastchangedat    AS last_changed_at,
            travel~lastchangedat    AS local_last_changed_at
            ORDER BY travel_id UP TO 10 ROWS
    ).
    COMMIT WORK.
    out->write( |Demo data generated for table zbooking_{ group_id }. | ).
ENDMETHOD.
ENDCLASS.

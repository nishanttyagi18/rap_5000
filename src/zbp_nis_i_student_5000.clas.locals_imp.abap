CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Student RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Student RESULT result.

    METHODS setAdmitted FOR MODIFY
      IMPORTING keys FOR ACTION Student~setAdmitted RESULT result.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR Student~validateAge.

    METHODS changeDuration FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Student~changeDuration.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
    READ ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).

    if requested_authorizations-%action-setAdmitted = if_abap_behv=>mk-on.
      loop at lt_result INTO DATA(ls_result).
         failed-student = VALUE #( ( %tky = ls_result-%tky ) ).
         reported-student = VALUE #( ( %tky = ls_result-%tky %msg = new_message_with_text(
                                                                    severity = if_abap_behv_message=>severity-error
                                                                    text     = 'No authorization to udpate'
                                                                  ) ) ).
      endloop.
    endif.
  ENDMETHOD.

  METHOD get_global_authorizations.
    if requested_authorizations-%update = if_abap_behv=>mk-on.
      result-%update = if_abap_behv=>auth-unauthorized.
    endif.
  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED failed.

    result = VALUE #( FOR ls_result IN lt_result
                      LET lv_status = COND #( WHEN ls_result-Status = abap_true
                                              THEN if_abap_behv=>fc-o-disabled
                                              ELSE if_abap_behv=>fc-o-enabled )
                      IN ( %tky = ls_result-%tky %action-setAdmitted = lv_status ) ).

  ENDMETHOD.

  METHOD setAdmitted.
    MODIFY ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true )  )
    FAILED failed
    REPORTED reported.

    "Get updated response to be shown on screen.
    READ ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).

    result = VALUE #( FOR ls_result IN lt_result ( %tky = ls_result-%tky %param = ls_result ) ).

    reported-student = VALUE #( FOR ls_stud IN lt_result ( %tky = ls_stud-%tky %msg = new_message_with_text(
                                                               severity = if_abap_behv_message=>severity-success
                                                               text     = 'Record updated successfully'
                                                             ) ) ).


  ENDMETHOD.

  METHOD validateAge.
    READ ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Age )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).

    LOOP AT lt_result INTO DATA(ls_result).
      IF ls_result-Age < 21.
        failed-student = VALUE #( ( %key = ls_result-%key ) ).
        reported-student = VALUE #( ( %key = ls_result-%key %msg = new_message_with_text(
                                                                     severity = if_abap_behv_message=>severity-error
                                                                     text     = 'Age cannot be less than 21'
                                                                   ) %element-age = if_abap_behv=>mk-on ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD changeDuration.
    READ ENTITIES OF znis_i_student_5000 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Course )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result).

    LOOP AT lt_result INTO DATA(ls_result).
      IF ls_result-Course = 'Computer'.
        MODIFY ENTITIES OF znis_i_student_5000 IN LOCAL MODE
        ENTITY Student
        UPDATE FIELDS ( CourseDuration )
        WITH VALUE #( ( %tky = ls_result-%tky Courseduration = '5' ) ).

        reported-student = VALUE #( ( %tky = ls_result-%tky %msg = new_message_with_text(
                                                                     severity = if_abap_behv_message=>severity-success
                                                                     text     = 'Course Duration updated'
                                                                   ) %element-age = if_abap_behv=>mk-on ) ).
      ELSEIF ls_result-Course = 'Electronics'.
        MODIFY ENTITIES OF znis_i_student_5000 IN LOCAL MODE
          ENTITY Student
          UPDATE FIELDS ( CourseDuration )
          WITH VALUE #( ( %tky = ls_result-%tky Courseduration = '3' ) ).

          reported-student = VALUE #( ( %tky = ls_result-%tky %msg = new_message_with_text(
                                                                     severity = if_abap_behv_message=>severity-success
                                                                     text     = 'Course Duration updated'
                                                                   ) %element-age = if_abap_behv=>mk-on ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

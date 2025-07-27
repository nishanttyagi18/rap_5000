CLASS znis_cl_gender_5000_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_amdp_marker_hdb.

    CLASS-METHODS get_data FOR TABLE FUNCTION znis_i_gender_5000_tf.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS znis_cl_gender_5000_amdp IMPLEMENTATION.
  METHOD get_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.
    RETURN select 'M' as gender, 'Male' as genderdesc
    FROM dummy
    UNION ALL
    SELECT 'F' AS gender, 'Female' as genderdesc FROM dummy;
  ENDMETHOD.
ENDCLASS.

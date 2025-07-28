CLASS znis_cl_gender_5000_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_amdp_marker_hdb.

    CLASS-METHODS get_data FOR TABLE FUNCTION znis_i_gender_5000_tf.
    CLASS-METHODS get_domain_data FOR TABLE FUNCTION znis_i_domain_5000_tf.
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
  METHOD get_domain_data BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT OPTIONS READ-ONLY.

    IF :p_domain = 'COURSE' THEN
        RETURN select 'C' as value, 'Computers' as description
        FROM dummy
        UNION ALL
        SELECT 'E' AS value, 'Electronics' as description FROM dummy;
    ELSEIF :p_domain = 'SEMESTER' THEN
        RETURN select 'I' as value, 'Semester One' as description FROM dummy
        UNION ALL SELECT 'II' AS value, 'Semester Two' as description FROM dummy
        UNION ALL SELECT 'III' AS value, 'Semester Three' as description FROM dummy
        UNION ALL SELECT 'IV' AS value, 'Semester Four' as description FROM dummy
        UNION ALL SELECT 'V' AS value, 'Semester Five' as description FROM dummy
        UNION ALL SELECT 'VI' AS value, 'Semester Six' as description FROM dummy;
    ELSEIF :p_domain = 'RESULT' THEN
        RETURN select 'P' as value, 'Pass' as description FROM dummy
        UNION ALL SELECT 'F' AS value, 'Fail' as description FROM dummy
        UNION ALL SELECT 'C' AS value, 'Current' as description FROM dummy;
    END if;
  ENDMETHOD.

ENDCLASS.

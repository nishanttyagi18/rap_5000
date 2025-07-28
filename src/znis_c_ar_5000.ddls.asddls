@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Academic result consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZNIS_C_AR_5000 as projection on ZNIS_I_AR_5000
{
    @EndUserText.label: 'Academic Result'
    key Id,
    @EndUserText.label: 'Course'
    key Course,
    @EndUserText.label: 'Semester'
    key Semester,
    @EndUserText.label: 'Result'
    Semresult,
    @EndUserText.label: 'Course Description'
    CourseDescription,
    @EndUserText.label: 'Semester Description'
    SemesterDescription,
    @EndUserText.label: 'Result Description'
    ResultDescription,
    /* Associations */
    _course,
    _semester,
    _semres,
    _student: redirected to parent ZNIS_C_STUDENT_5000
}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Academic result interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZNIS_I_AR_5000 as select from znis_rap_ar_5000
    association to parent ZNIS_I_STUDENT_5000 as _student on $projection.Id = _student.Id
    association [1..1] to ZNIS_I_COURSE_5000 as _course on $projection.Course = _course.Value
    association [1..1] to ZNIS_I_SEMESTER_5000 as _semester on $projection.Semester = _semester.Value
    association [1..1] to ZNIS_I_SEMRES_5000 as _semres on $projection.Semresult = _semres.Value
{
    key id as Id,
    key course as Course,
    key semester as Semester,
    semresult as Semresult,
    _course.Description as CourseDescription,
    _semester.Description as SemesterDescription,
    _semres.Description as ResultDescription,
    _student,
    _course,
    _semester,
    _semres
}

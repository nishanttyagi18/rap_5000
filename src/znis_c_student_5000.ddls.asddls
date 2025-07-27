@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption student view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZNIS_C_STUDENT_5000 as projection on ZNIS_I_STUDENT_5000
{
    @EndUserText.label: 'Student ID'
    key Id,
    @EndUserText.label: 'First Name'
    Firstname,
    @EndUserText.label: 'Last Name'
    Lastname,
    @EndUserText.label: 'Age'
    Age,
    @EndUserText.label: 'Course'
    Course,
    @EndUserText.label: 'Course Duration'
    Courseduration,
    @EndUserText.label: 'Status'
    Status,
    @EndUserText.label: 'Gender'
    Gender,
    @EndUserText.label: 'Date of Birth'
    Dob
}

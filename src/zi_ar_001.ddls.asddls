@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Academic Result'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_AR_001
  as select from zsk_rap_ar_001
  association to parent ZI_STUDENT_001 as _student  on $projection.Id = _student.Id
  association to ZI_COURSE_001         as _course   on $projection.Course = _course.Value
  association to ZI_SEM_001            as _semester on $projection.Semester = _semester.Value
  association to ZI_SEMRES_001         as _semres   on $projection.Semresult = _semres.Value

{
   key id as Id,
    key course as Course,
    key semester as Semester,
    _course.Description as course_desc,
    _semester.Description as semester_desc,
    semresult as Semresult,
    _semres.Description as semres_desc,
    _student
}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Semester'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZNIS_I_SEMESTER_5000 as select from ZNIS_I_DOMAIN_5000_TF( p_domain : 'SEMESTER' )
{   
    @EndUserText.label: 'Semester'
    value as Value,
    @Semantics.text: true
    @EndUserText.label: 'Semester Description'
    description as Description
}

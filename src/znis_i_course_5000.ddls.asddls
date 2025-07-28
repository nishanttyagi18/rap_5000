@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Course'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZNIS_I_COURSE_5000 as select from ZNIS_I_DOMAIN_5000_TF( p_domain : 'COURSE' )
{   
    @EndUserText.label: 'Course'
    key value as Value,
    @Semantics.text: true
    @EndUserText.label: 'Course Description'
    description as Description
}

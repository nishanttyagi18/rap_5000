@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Semester Result'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZNIS_I_SEMRES_5000 as select from ZNIS_I_DOMAIN_5000_TF( p_domain : 'RESULT' )
{
    @EndUserText.label: 'Result'
    value as Value,
    @Semantics.text: true
    @EndUserText.label: 'Result Description'
    description as Description
}

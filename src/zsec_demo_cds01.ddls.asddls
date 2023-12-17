@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSEC_DEMO_CDS01'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSEC_DEMO_CDS01 as select from zvbak as hdr
{
    key vbeln as Vbeln,
    erdat as Erdat,
    ernam as Ernam,
    vbtyp as Vbtyp,
    trvog as Trvog,
    auart as Auart,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}

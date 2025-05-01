@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection Processor'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Zbooksupp_SRI_C_PROCESSOR
  as projection on zbooking_supp_sri_i
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent Zbooking_SRI_C_PROCESSOR,
      _Travel: redirected to ztravel_sri_c_processor
}

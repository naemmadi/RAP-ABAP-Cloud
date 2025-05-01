@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliement Travel App'
@Metadata.ignorePropagatedAnnotations: true
define view entity zbooking_supp_sri_i
  as select from /dmo/booksuppl_m
  association[1..1] to ztravel_sri_i_root as _Travel on $projection.TravelId = _Travel.TravelId
  association to parent zbooking_sri_i as _Booking on  $projection.TravelId  = _Booking.TravelId
                                                   and $projection.BookingId = _Booking.BookingId
  association[1..1] to /DMO/I_Supplement as _Product on $projection.SupplementId = _Product.SupplementID
  association[1..*] to /DMO/I_SupplementText as _Supptext on $projection.SupplementId = _Supptext.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      /*Expose associations*/
      _Travel,
      _Booking,
      _Product,
      _Supptext
}

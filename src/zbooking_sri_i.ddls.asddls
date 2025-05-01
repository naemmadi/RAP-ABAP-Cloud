@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View for Travel App'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zbooking_sri_i
  as select from /dmo/booking_m
  association        to parent ztravel_sri_i_root as _Travel        on  $projection.TravelId = _Travel.TravelId
  composition [0..*] of zbooking_supp_sri_i       as _Booksupp
  association [1..1] to /DMO/I_Customer           as _Customer      on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier            as _Carrier       on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection         as _Connection    on  $projection.CarrierId    = _Connection.AirlineID
                                                                    and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH  as _Bookingstatus on  $projection.BookingStatus = _Bookingstatus.BookingStatus
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      /*Expose associations*/
      _Travel,
      _Booksupp,
      _Customer,
      _Carrier,
      _Connection,
      _Bookingstatus

}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection Processor'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Zbooking_SRI_C_PROCESSOR
  as projection on zbooking_sri_i
{
  key TravelId,
  key BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Customer',
                entity.element: 'CustomerID' }]
      CustomerId,
      @Consumption.valueHelpDefinition: [{ 
                entity.name: '/dmo/I_Carrier',
                entity.element: 'AirlineID' }]
      CarrierId,
      @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Connection',
                entity.element: 'ConnectionID' }]
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
        @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Booking_Status_VH',
                entity.element: 'BookingStatus' }]
      _Bookingstatus,
         /* Associations */
      _Booksupp: redirected to composition child Zbooksupp_SRI_C_PROCESSOR,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ztravel_sri_c_processor
}

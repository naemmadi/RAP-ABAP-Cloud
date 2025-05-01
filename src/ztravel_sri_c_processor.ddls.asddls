@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection Processor'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ztravel_sri_c_processor
  as projection on ztravel_sri_i_root
{
  @ObjectModel.text.element: [ 'Description' ]
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
        @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Agency',
                entity.element: 'AgencyID' }]
      AgencyId,
      @Semantics.text: true
      AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
        @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Customer',
                entity.element: 'CustomerID' }]
      CustomerId,
      @Semantics.text: true
      CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      @Semantics.text: true
      Description,
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{ 
                        entity.name: '/DMO/I_Overall_Status_VH',
                        entity.element: 'OverallStatus' }]
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      @Semantics.text: true
      StatusText,
      Criticality,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Zbooking_SRI_C_PROCESSOR,
      _Currency,
      _Customer,
      _Overallstatus
}

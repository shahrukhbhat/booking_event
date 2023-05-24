@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZEVENT_R_BOOKINGTP_2023'
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity ZEVENT_C_BOOKINGTP_2023
  provider contract transactional_query
  as projection on ZEVENT_R_BOOKINGTP_2023
{
  key TravelID,
  AgencyID,
  CustomerID,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  OverallStatus,
  LastChangedAt
  
}

@EndUserText.label: 'Gender Table function'
@ClientHandling.type: #CLIENT_INDEPENDENT
define table function ZNIS_I_GENDER_5000_TF
returns {
  gender : abap.char(1);
  genderdesc : abap.char(20);
}
implemented by method ZNIS_CL_GENDER_5000_AMDP=>get_data;
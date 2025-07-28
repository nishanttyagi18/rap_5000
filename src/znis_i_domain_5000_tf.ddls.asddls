@EndUserText.label: 'Domain TF'
@ClientHandling.type: #CLIENT_INDEPENDENT
define table function ZNIS_I_DOMAIN_5000_TF
with parameters p_domain : abap.char(20)
returns {
  value : abap.char(4);
  description: abap.char(20);
}
implemented by method ZNIS_CL_GENDER_5000_AMDP=>get_domain_data;
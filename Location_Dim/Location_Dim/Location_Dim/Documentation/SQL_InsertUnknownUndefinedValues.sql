Use sho_dw;

truncate table dim.region;

truncate table dim.district;

truncate table dim.location;

Insert Into dim.region (region_name) Values ('Unknown');

Insert Into dim.region (region_name) Values ('Undefined');

Insert Into dim.district (district_name) Values ('Unknown');

Insert Into dim.district (district_name) Values ('Undefined');

Insert Into dim.location (location_name,region_sk_id,district_sk_id,ordc_loc_sk_id,sho_location_format_sk_id) Values ('Unknown',-1,-1,-1,-1);

Insert Into dim.location (location_name,region_sk_id,district_sk_id,ordc_loc_sk_id,sho_location_format_sk_id) Values ('Undefined',0,0,0,0);
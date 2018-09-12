USE sho_dw;

UPDATE dim.location SET [region_sk_id] = dim.region.[region_sk_id] FROM dim.region INNER JOIN dim.location ON dim.region.region_nbr = dim.location.region;

UPDATE dim.location SET [district_sk_id] = dim.district.[district_sk_id] FROM dim.district INNER JOIN dim.location ON dim.district.district_nbr = dim.location.district;

UPDATE dim.location SET [ordc_loc_sk_id] = ORDC.location_sk_id, [ordc_nbr] = ORDC.ordc_pos_nbr FROM (SELECT dim.location.location_sk_id, dbo.location_outlet_ordc_network.store_pos_nbr, dbo.location_outlet_ordc_network.ordc_pos_nbr FROM dim.location INNER JOIN dbo.location_outlet_ordc_network ON dim.location.pos_nbr = dbo.location_outlet_ordc_network.store_pos_nbr) ORDC 
	INNER JOIN dim.location ON ORDC.store_pos_nbr = dim.location.pos_nbr;

UPDATE dim.location SET [sho_location_format_sk_id] = dim.sho_location_formats.sho_location_format_sk_id FROM dim.sho_location_formats INNER JOIN dim.location ON dim.sho_location_formats.location_format_cd = dim.location.location_format;

UPDATE dim.region SET [sho_location_format_sk_id] = dim.location.sho_location_format_sk_id FROM dim.location INNER JOIN dim.region ON dim.location.region = dim.region.region_nbr;
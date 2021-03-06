use [sho_dw]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [IX_sho_sales_composite] ON [fact].[sho_sales]
(
	[location_sk_id] ASC,
	[trs_dt_sk_id] ASC,
	[prod_cat_div_sk_id] ASC,
	[trs_dt] ASC,
	[div_nbr] ASC,
	[cat_nbr] ASC,
	[pos_source_system] ASC
)
INCLUDE ( 	[net_sales],
	[net_units],
	[kenmore_sales],
	[kenmore_units],
	[total_md_amt],
	[craftsman_sales],
	[craftsman_units],
	[diehard_sales],
	[diehard_units],
	[avg_ticket_sales],
	[avg_ticket_units],
	[pa_sales],
	[pa_units],
	[lease_sales],
	[lease_units],
	[pam_sales],
	[pam_units]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [stat_sho_sales_composite] ON [fact].[sho_sales]([trs_dt_sk_id], [prod_cat_div_sk_id], [trs_dt], [div_nbr], [cat_nbr], [pos_source_system])
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [IX_location_composite] ON [dim].[location]
(
	[sho_location_format_sk_id] ASC,
	[location_sk_id] ASC,
	[location_name] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go


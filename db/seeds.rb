# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

broker_zszq = Broker.create(id: 1, code: 'zszq', name: '招商证券') 
broker_gjzq = Broker.create(id: 2, code: 'gjzq', name: '国金证券') 
broker_pazq = Broker.create(id: 3, code: 'pazq', name: '平安证券') 
broker_dgzq = Broker.create(id: 4, code: 'pazq', name: '东莞证券') 

stakeholder_byml = Stakeholder.create(id: 1, code: 'byml', name: 'lzy')
stakeholder_cexo = Stakeholder.create(id: 2, code: 'cexo', name: 'xxj')
stakeholder_maggie = Stakeholder.create(id: 3, code: 'maggie', name: 'lzj')
stakeholder_mum = Stakeholder.create(id: 4, code: 'mum', name: 'qfr')

account_info_byml_zszq = AccountInfo.create(id: 1, code: 'byml_zszq', broker: broker_zszq, stakeholder: stakeholder_byml)
account_info_byml_gjzq = AccountInfo.create(id: 2, code: 'byml_gjzq', broker: broker_gjzq, stakeholder: stakeholder_byml)
account_info_byml_pazq = AccountInfo.create(id: 3, code: 'byml_pazq', broker: broker_pazq, stakeholder: stakeholder_byml)
account_info_cexo_gjzq = AccountInfo.create(id: 4, code: 'cexo_gjzq', broker: broker_gjzq, stakeholder: stakeholder_cexo)
account_info_maggie_pazq = AccountInfo.create(id: 5, code: 'maggie_pazq', broker: broker_pazq, stakeholder: stakeholder_maggie)
account_info_mum_dgzq =  AccountInfo.create(id: 6, code: 'mum_dgzq', broker: broker_dgzq, stakeholder: stakeholder_mum)


market_sh = Market.create(id: 1, code: 'sh', name: '上交所')
market_sz = Market.create(id: 2, code: 'sz', name: '深交所')
market_hk = Market.create(id: 3, code: 'hk', name: '港交所')

BusinessType.create([
		{id: 1, name: '银证转入', alias_names: '["银行转存"]'},
		{id: 2, name: '银证转出', alias_names: '["银行转取"]'},
		{id: 3, name: '证券买入'},
		{id: 4, name: '证券卖出'},
		{id: 5, name: '股息入账'},
		{id: 6, name: '红股入账'},
		{id: 7, name: '配股入账'},
		{id: 8, name: '红利差异税扣税'},
		{id: 9, name: '权证入帐'},
		{id: 10, name: '配股缴款'}
		{id: 11, name: '批量利息归本'}
		{id: 12, name: '批量利税代扣'}

		
	])

RightsIssue.create([
		{trade_code: '080898', category: '1', name: '鞍钢A1配', ref_security_code: '000898'},
		{trade_code: '700036', category: '1', name: '招行配股', ref_security_code: '600036'},
		{trade_code: '760939', category: '1', name: '建行配股', ref_security_code: '601939'},
		{trade_code: '760398', category: '1', name: '工行配股', ref_security_code: '601398'},

		{trade_code: '764398', category: '2',  name: '工行配债', ref_security_code: '601398'},
		{trade_code: '704028', category: '2',  name: '石化配债', ref_security_code: '600028'},
		{trade_code: '764318', category: '2',  name: '平安配债', ref_security_code: '601318'}
	])

#证券持仓

#资金流水
#证券账户 业务类型 成交日期 成交价格 成交数量 发生金额 资金余额 备注
#references: account_info, references: security_info, references: bysiness_type, date: trade_date, decimal: amout, decimal: quantity
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

stakeholder_byml = Stakeholder.create(id: 1, code: 'byml', name: 'lzy')
stakeholder_cexo = Stakeholder.create(id: 2, code: 'cexo', name: 'xxj')
stakeholder_maggie = Stakeholder.create(id: 3, code: 'maggie', name: 'lzj')

account_info_byml_zszq =  AccountInfo.create(code: 'byml_zszq', broker: broker_zszq, stakeholder: stakeholder_byml)
account_info_byml_gjzq =  AccountInfo.create(code: 'byml_gjzq', broker: broker_gjzq, stakeholder: stakeholder_byml)
account_info_byml_pazq =  AccountInfo.create(code: 'byml_pazq', broker: broker_pazq, stakeholder: stakeholder_byml)
account_info_cexo_gjzq =  AccountInfo.create(code: 'cexo_gjzq', broker: broker_gjzq, stakeholder: stakeholder_cexo)
account_info_maggie_pazq =  AccountInfo.create(code: 'maggie_pazq', broker: broker_pazq, stakeholder: stakeholder_maggie)

market_sz = Market.create(code: 'sz', name: '深交所')
market_sh = Market.create(code: 'sh', name: '上交所')
market_hk = Market.create(code: 'hk', name: '港交所')

SecurityInfo.create([
		{code: 'sh600004', trade_code: '600004', name: '白云机场', market: market_sh},
		{code: 'sh600028', trade_code: '600028', name: '中国石化', market: market_sh},
		{code: 'sh601006', trade_code: '601006', name: '大秦铁路', market: market_sh},
		{code: 'sh601318', trade_code: '601318', name: '中国平安', market: market_sh},
		{code: 'sh600036', trade_code: '600036', name: '招商银行', market: market_sh},

		{code: 'sz000002', trade_code: '000002', name: '万科A', 	 market: market_sz},
		{code: 'sz000895', trade_code: '000895', name: '双汇发展', market: market_sz}
	])

#证券持仓

#资金流水
#reference: account_info, reference: security_info, reference: trade_type, date: trade_date, decimal: amout, decimal: quantity
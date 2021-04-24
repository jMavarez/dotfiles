#!/usr/bin/env python

import requests

URL = 'https://www.dolarsi.com/api/api.php?type=valoresprincipales'
json = requests.get(URL).json()
dolar_blue_index = 1

data_casa = json[dolar_blue_index]['casa']
data_buy_rate = data_casa['compra'][:-1].replace(',','.')
data_sell_rate = data_casa['venta'][:-1].replace(',','.')
#data_variation_rate = data_casa['variacion'][:-1].replace(',','.')

buy_rate = str(int(float(data_buy_rate)))
sell_rate = str(int(float(data_sell_rate)))
#variation_rate = ''

#if len(data_variation_rate) > 0:
#    variation_rate = f' ({data_variation_rate})'

#print(f'{buy_rate}/{sell_rate}{variation_rate}')
print(f'{buy_rate}/{sell_rate}')


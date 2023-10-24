# fuel_pump
A sui project realized to first latam sui bootcamp

# how to publish
run the following commands

1- `sui move build` \
2- `sui client publish --gas-budget <SPECIFY-GAS>`

# how to call functions

Save enviroment variables

1- `export fuel_pump=<OBJECT-ID>` \
2- `export fuel_pump_id=<PACKAGE-ID>`

can run following comands

* `sui client call --function join_station --module Fuel_pump --package $fuel_pump_id --args $fuel_pump --gas-budget 20000000`

* `sui client call --function leave_station --module Fuel_pump --package $fuel_pump_id --args $fuel_pump --gas-budget 20000000`

* `sui client call --function pay_pump --module Fuel_pump --package $fuel_pump_id --args $fuel_pump <COIN-ID> 3000000 --gas-budget 20000000`

* `sui client call --function update_price --module Fuel_pump --package $fuel_pump_id --args $fuel_pump <NEW-PRICE> --gas-budget 20000000`

* `sui client call --function update_horary --module Fuel_pump --package $fuel_pump_id --args $fuel_pump <NEW-HORARY> --gas-budget 20000000`

# how to update

1- update **const VERSION** value in the .move file

2- update **published-at** value in the Move.toml file, must be the current package id

3- run `sui move build`

4- run `sui client upgrade --gas-budget 20000000 --upgrade-capability <UPGRADE-CAP>`

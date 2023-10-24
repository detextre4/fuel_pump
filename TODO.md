export fuel_pump=
export fuel_pump_id=


sui client call --function join_station --module Fuel_pump --package $fuel_pump_id --args $fuel_pump --gas-budget 20000000


sui client call --function leave_station --module Fuel_pump --package $fuel_pump_id --args $fuel_pump --gas-budget 20000000


sui client call --function pay_pump --module Fuel_pump --package $fuel_pump_id --args $fuel_pump <coin> 3000000 --gas-budget 20000000


sui client call --function update_price --module Fuel_pump --package $fuel_pump_id --args $fuel_pump 4000000 --gas-budget 20000000



sui client upgrade --gas-budget 20000000 --upgrade-capability <upgrade-cap>

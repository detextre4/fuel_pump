module fuel_pump::Fuel_pump {
  use std::string::{Self, String, utf8};
  use sui::object::{Self, UID};
  use sui::object_table::{Self, ObjectTable};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  struct FuelStation has key, store {
    id: object::UID,
    capability: u8,
    users: object_table::ObjectTable,
    slots: u8,
    horary: string::String,
    active: bool
  }

  struct User has key, store {
    id: object::UID,
  }

	fun init (ctx: tx_context::TxContext, capability: u8, horary: string::String) {
    let fuelStation = &mut FuelStation {
      id: object::new(ctx),
      capability,
      users: object_table::ObjectTable.new(ctx),
      slots: 0,
      horary,
      active: true,
    };

		transfer::transfer(fuelStation, tx_context::sender(ctx))
	}


	public entry fun join_station(ctx: TxContext, fuelStation: &mut FuelStation) {
    let user = User { id: object::new(ctx) };
    let newFuelStation = fuelStation;

    if (fuelStation.slots.contains(user)) {
      newFuelStation.slots.add(user)
      fuelStation.slots = newFuelStation.slots
    }
	}
}
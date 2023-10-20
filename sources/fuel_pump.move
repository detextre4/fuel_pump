module fuel_pump::Fuel_pump {
  use std::string::{Self, String, utf8};
  use sui::object::{Self, UID};
  use sui::array::{Self, Array};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};


  struct FuelStation has key, store {
    id: object::UID,
    capability: u8,
    slots: array::Array<object::UID>,
    horary: string::String,
    active: bool
  }


	fun init (ctx: &TxContext, capability: &u8, horary: &string::String) {
    let fuelStation: FuelStation = {
      id: object::new(ctx),
      capability,
      slots: 0,
      horary,
      active: true,
    }

		transfer::transfer(fuelStation, tx_context::sender(ctx))
	}
}
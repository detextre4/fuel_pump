module fuel_pump::Fuel_pump {
  use std::string::{Self, String, utf8};
  use sui::object::{Self, UID, new};
  use sui::vec_set::{Self, VecSet, insert};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  // station object to allow users
  struct FuelStation has key, store {
    id: UID,
    capability: u8,
    users: VecSet<User>,
    slots: u8,
    horary: String,
    active: bool
  }

  // user indentifier
  struct User has key, store {
    id: UID,
  }

  // create station object 
	fun init (capability: u8, horary: String, ctx: &mut tx_context::TxContext) {
    let fuelStation = &mut FuelStation {
      id: object::new(ctx),
      capability,
      users: vec_set::VecSet::empty(),
      slots: 0,
      horary,
      active: true,
    };

		transfer::transfer(fuelStation, tx_context::sender(ctx))
	}


  // join station
	public entry fun join_station(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    let user = User { id: object::new(ctx) };

    fuelStation.users.insert(user);
	}

  // // leave station
	// public entry fun leave_station(ctx: TxContext, fuelStation: &mut FuelStation) {
	// }

  // // pay pump
	// public entry fun pay_pump(ctx: TxContext, fuelStation: &mut FuelStation) {
	// }
}
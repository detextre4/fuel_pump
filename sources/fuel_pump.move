module fuel_pump::Fuel_pump {
  use std::string::{Self, String};
  use sui::object::{Self, UID};
  use sui::vec_set::{Self, VecSet};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  // station object to allow users
  struct FuelStation has key, store {
    id: UID,
    capability: u8,
    // current users
    users: VecSet<address>,
    // total users
    slots: u8,
    horary: String,
    active: bool
  }

  // create station object 
	fun init (ctx: &mut TxContext) {
    let fuelStation = FuelStation {
      id: object::new(ctx),
      capability: 20,
      users: vec_set::empty<address>(),
      slots: 0,
      horary: string::utf8(b"8am - 8pm"),
      active: true,
    };

		transfer::transfer(fuelStation, tx_context::sender(ctx))
	}


  // join station
	public entry fun join_station(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    let users = &mut fuelStation.users;
    vec_set::insert(users, tx_context::sender(ctx))
	}

  // leave station
	public entry fun leave_station(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    let users = &mut fuelStation.users;
    vec_set::remove(users, &mut tx_context::sender(ctx))
	}

  // pay pump
	public entry fun pay_pump(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    // TODO logic here

    leave_station(fuelStation, ctx)
	}
}

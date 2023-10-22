module fuel_pump::Fuel_pump {
  use std::string::{Self, String};
  use sui::object::{Self, UID};
  use sui::vec_set::{Self, VecSet};
  use sui::transfer;
  use sui::coin::{Self, Coin};
  use sui::sui::SUI;
  use sui::tx_context::{Self, TxContext};
  use sui::pay::{Self};

  // station object to allow users
  struct FuelStation has key, store {
    id: UID,
    capability: u64,
    // current users
    users: VecSet<address>,
    // total users
    slots: u64,
    horary: String,
    active: bool,
    price: u64,
  }

  const CAP: u64 = 20;

  // create station object 
	fun init (ctx: &mut TxContext) {
    let fuelStation = FuelStation {
      id: object::new(ctx),
      capability: CAP,
      users: vec_set::empty<address>(),
      slots: 0,
      horary: string::utf8(b"8am - 8pm"),
      active: true,
      price: 3000000,
    };

		transfer::transfer(fuelStation, tx_context::sender(ctx))
	}


  // join station
	public entry fun join_station(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    let users = &mut fuelStation.users;
    assert!(vec_set::size(users) >= fuelStation.capability, 0);

    vec_set::insert(users, tx_context::sender(ctx));
    // update slots
    fuelStation.slots = vec_set::size(users);
	}

  // leave station
	public entry fun leave_station(fuelStation: &mut FuelStation, ctx: &mut TxContext) {
    let users = &mut fuelStation.users;

    vec_set::remove(users, &mut tx_context::sender(ctx));
    // update slots
    fuelStation.slots = vec_set::size(users);
	}

  // pay pump
	public entry fun pay_pump(fuelStation: &mut FuelStation, sui: Coin<SUI>, ctx: &mut TxContext) {
    assert!(coin::value(&mut sui) >= fuelStation.price, 0);

    pay::keep(sui, ctx);
    leave_station(fuelStation, ctx);
	}

  // update price
	public entry fun update_price(fuelStation: &mut FuelStation, sui: &mut Coin<SUI>, _: &TxContext) {
    fuelStation.price = coin::value(sui)
	}

  // checkout user
	public entry fun checkout_user(fuelStation: &mut FuelStation, ctx: &mut TxContext): bool {
    let users = &mut fuelStation.users;

    vec_set::contains(users, &tx_context::sender(ctx))
	}
}

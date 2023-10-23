module fuel_pump::Fuel_pump {
  use std::string::{Self, String};
  use sui::object::{Self, UID, ID};
  use sui::vec_set::{Self, VecSet};
  use sui::transfer;
  use sui::coin::{Self, Coin};
  use sui::sui::SUI;
  use sui::tx_context::{Self, TxContext};
  use sui::pay::{Self};

  /* Track the current version of the module */
  const VERSION: u64 = 1;

  // station object to allow users
  struct FuelStation has key, store {
    id: UID,
    /* Track the current version of the shared object */
    version: u64,
    /* Associate the `Counter` with its `AdminCap` */
    admin: ID,

    capability: u64,
    // current users
    users: VecSet<address>,
    // total users
    slots: u64,
    horary: String,
    active: bool,
    price: u64,
  }

  struct AdminCap has key {
    id: UID,
  }

  const CAP: u64 = 20;

  /// Not the right admin for this counter
  const ENotAdmin: u64 = 0;
  /// Calling functions from the wrong package version
  const EWrongVersion: u64 = 1;
  /// Migration is not an upgrade
  const ENotUpgrade: u64 = 1;


  // create station object 
	fun init (ctx: &mut TxContext) {
    let admin = AdminCap {
      id: object::new(ctx),
    };

    let fs = FuelStation {
      id: object::new(ctx),
      version: VERSION,
      admin: object::id(&admin),
      capability: CAP,
      users: vec_set::empty<address>(),
      slots: 0,
      horary: string::utf8(b"8am - 8pm"),
      active: true,
      price: 3000000,
    };

    transfer::share_object(fs);
		transfer::transfer(admin, tx_context::sender(ctx))
	}

  // Introduce a migrate function
  entry fun migrate(fs: &mut FuelStation, a: &AdminCap) {
    assert!(fs.admin == object::id(a), ENotAdmin);
    assert!(fs.version < VERSION, ENotUpgrade);
    fs.version = VERSION;
  }


  // join station
	public entry fun join_station(fs: &mut FuelStation, ctx: &mut TxContext) {
    /* Guard the entry of all functions that access the shared object with a version check. */
    assert!(fs.version == VERSION, EWrongVersion);

    let users = &mut fs.users;
    assert!(vec_set::size(users) <= fs.capability, 0);

    vec_set::insert(users, tx_context::sender(ctx));
    // update slots
    fs.slots = vec_set::size(users);
	}

  // leave station
	public entry fun leave_station(fs: &mut FuelStation, ctx: &mut TxContext) {
    assert!(fs.version == VERSION, EWrongVersion);

    let users = &mut fs.users;

    vec_set::remove(users, &mut tx_context::sender(ctx));
    // update slots
    fs.slots = vec_set::size(users);
	}

  // pay pump
	public entry fun pay_pump(fs: &mut FuelStation, sui: Coin<SUI>, ctx: &mut TxContext) {
    assert!(fs.version == VERSION, EWrongVersion);
    assert!(coin::value(&mut sui) >= fs.price, 0);

    pay::keep(sui, ctx);
    leave_station(fs, ctx);
	}

  // update price
	public entry fun update_price(_: &AdminCap, fs: &mut FuelStation, sui: &mut Coin<SUI>, _: &TxContext) {
    assert!(fs.version == VERSION, EWrongVersion);

    fs.price = coin::value(sui)
	}

  // update horary
	public entry fun update_horary(_: &AdminCap, fs: &mut FuelStation, horary: String, _: &TxContext) {
    assert!(fs.version == VERSION, EWrongVersion);

    fs.horary = horary
	}

  // checkout user
	public entry fun checkout_user(fs: &mut FuelStation, ctx: &mut TxContext): bool {
    assert!(fs.version == VERSION, EWrongVersion);

    let users = &mut fs.users;

    vec_set::contains(users, &tx_context::sender(ctx))
	}
}

/// Creamos nuestro modulo el cual contendra nuestro Move Package
module hello_world::hello_world {

  /// Definimos los modulos los cuales nos permiten importar 
  /// elementos de la blockcahin de Sui
  use std::string;
  use sui::object::{Self, UID};
  use sui::transfer;
  use sui::tx_context::{Self, TxContext};

  /// Definimos un objeto HelloWorld con sus diferentes abilities
  /// Custom type con abilities key y store son considerados assets y pueden 
  /// ser transferidos entre cuentas y guardado en el global storage
  struct HelloWorldObject has key, store {
    /// Define el identificador unico del objeto en el global storage
    /// es requerido al utilizar el ability key
    id: UID,
    /// dato string en el objeto
    text: string::String
  }

  public entry fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
      id: object::new(ctx),
      text: string::utf8(b"Hello World!")
    };

    transfer::public_transfer(object, tx_context::sender(ctx));
  }
}
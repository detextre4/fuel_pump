----- Transaction Digest ----
CujRhybXdsHoz1xsDJteshPiYEXr7xEpLpQUccVXMWXo
----- Transaction Data ----
Transaction Signature: [Signature(Ed25519SuiSignature(Ed25519SuiSignature([0, 26, 102, 225, 206, 188, 232, 72, 185, 22, 220, 242, 43, 172, 227, 53, 88, 85, 132, 10, 60, 216, 245, 27, 241, 152, 32, 34, 159, 67, 22, 179, 225, 139, 217, 29, 32, 241, 181, 38, 37, 171, 144, 189, 236, 132, 94, 131, 18, 202, 146, 241, 232, 61, 164, 112, 0, 10, 119, 179, 214, 214, 60, 177, 6, 246, 204, 18, 241, 243, 155, 12, 240, 126, 154, 82, 74, 94, 193, 20, 182, 5, 165, 19, 101, 65, 5, 177, 54, 230, 118, 129, 200, 85, 3, 131, 118])))]
Transaction Kind : Programmable
Inputs: [Object(ImmOrOwnedObject { object_id: 0xe756814b5d6896084e620146ce0cc62f45c9f903b7bdb29047e3ae5b83973241, version: SequenceNumber(25), digest: o#D4e2F1UruMMj3mavy1N7H7rAAJ84TuXLBsbmctzP2HBy }), Pure(SuiPureValue { value_type: Some(U8), value: 0 }), Pure(SuiPureValue { value_type: Some(Vector(U8)), value: [136,251,121,152,64,211,109,189,87,249,188,6,196,134,122,110,189,236,185,97,140,184,119,32,240,170,164,255,87,76,186,99] })]
Commands: [
  MoveCall(0x0000000000000000000000000000000000000000000000000000000000000002::package::authorize_upgrade(Input(0),Input(1),Input(2))),
  Upgrade(<modules>, Result(0),0x0000000000000000000000000000000000000000000000000000000000000001,0x0000000000000000000000000000000000000000000000000000000000000002, 0x238c93ed517af35f0ab19f6c239aac9660ae2dd53137af0ce78e6f839d24c802),
  MoveCall(0x0000000000000000000000000000000000000000000000000000000000000002::package::commit_upgrade(Input(0),Result(1))),
]

Sender: 0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1
Gas Payment: Object ID: 0xbcecfded54b288586d8289c25263beedc44f061f7ba2d2c91271d0a02880e089, version: 0x19, digest: CibFdW5rapXJ2gjCoJKsrmgBX88Nw1RMZbWHLsxj74Y2 
Gas Owner: 0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1
Gas Price: 1000
Gas Budget: 20000000

----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x419f9d44f4f671b7b21a54d586b18ca6f0e31751044c8fe89a3323d0ccc00c49 , Owner: Immutable
Mutated Objects:
  - ID: 0xbcecfded54b288586d8289c25263beedc44f061f7ba2d2c91271d0a02880e089 , Owner: Account Address ( 0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1 )
  - ID: 0xe756814b5d6896084e620146ce0cc62f45c9f903b7bdb29047e3ae5b83973241 , Owner: Account Address ( 0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1 )

----- Events ----
Array []
----- Object changes ----
Array [
    Object {
        "type": String("mutated"),
        "sender": String("0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1"),
        "owner": Object {
            "AddressOwner": String("0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1"),
        },
        "objectType": String("0x2::coin::Coin<0x2::sui::SUI>"),
        "objectId": String("0xbcecfded54b288586d8289c25263beedc44f061f7ba2d2c91271d0a02880e089"),
        "version": String("26"),
        "previousVersion": String("25"),
        "digest": String("BvVCDafs9QqX1DT1rp8PJLQmX7V1azjEB25KVLMvrcpF"),
    },
    Object {
        "type": String("mutated"),
        "sender": String("0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1"),
        "owner": Object {
            "AddressOwner": String("0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1"),
        },
        "objectType": String("0x2::package::UpgradeCap"),
        "objectId": String("0xe756814b5d6896084e620146ce0cc62f45c9f903b7bdb29047e3ae5b83973241"),
        "version": String("26"),
        "previousVersion": String("25"),
        "digest": String("8n1ZPLiUaLbLpVpyhER2jYLGjymAeRppiJQC5qN82mp1"),
    },
    Object {
        "type": String("published"),
        "packageId": String("0x419f9d44f4f671b7b21a54d586b18ca6f0e31751044c8fe89a3323d0ccc00c49"),
        "version": String("5"),
        "digest": String("8sFJCdmRR7zJQ8sU7Cd1d3VeQY46XFqM1sDRge1Z6YSX"),
        "modules": Array [
            String("Fuel_pump"),
        ],
    },
]
----- Balance changes ----
Array [
    Object {
        "owner": Object {
            "AddressOwner": String("0x245c9b29340abe6cc8b54bc58afcfc2646d609f13f96312320c98b5d47aa9cc1"),
        },
        "coinType": String("0x2::sui::SUI"),
        "amount": String("-15527020"),
    },
]
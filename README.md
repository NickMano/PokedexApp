# PokedexApp

The PokedexApp is a swift project for view a list of pokemons.

<img src="https://i.imgur.com/0uhOMA4.png" />

## Requirements

* Xcode 14.1 is recommended.
* iOS >13.x is necessary.


## Installation

Clone the reposotiry and open `Pokedex.xcodeproj` 👏

## Arquitecture

* This project uses MVI for presentation layer and Clean architecture for domain and data layer.

## Dependecies

This project use Swift Package Manager 

* [SwiftNetworking](https://github.com/NickMano/SwiftNetworking) - to simplify the Networking layer
* [PokedexDomain](https://github.com/NickMano/PokedexDomain) - The domain layer of the app with the use cases, entities and Repository protocols
* SwiftUtils - helpful extensions
* SwiftLint - to keep the good practices
* SnapshotTesting - to make snapshot testing

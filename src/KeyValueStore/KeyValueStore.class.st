Class {
	#name : #KeyValueStore,
	#superclass : #Object,
	#instVars : [
		'store'
	],
	#category : #KeyValueStore
}

{
	#category : #baseOperations,
	#'squeak_changestamp' : 'TH 10/19/2024 15:32'
}
KeyValueStore >> get: key [
	"get IP of key"
	^ (store at: key)
]

{
	#category : #baseOperations,
	#'squeak_changestamp' : 'TH 10/19/2024 15:29'
}
KeyValueStore >> getAll [
	"get all keys already used"
	^ store keys
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TH 10/19/2024 15:17'
}
KeyValueStore >> initialize [
	"Initializes empty key value store"
	super initialize.
	store := Dictionary new .
]

{
	#category : #baseOperations,
	#'squeak_changestamp' : 'TH 10/19/2024 15:12'
}
KeyValueStore >> put: key value: ip [
	"Add a key value pair to the store"
	store at: key put: ip .
]

{
	#category : #baseOperations,
	#'squeak_changestamp' : 'TH 10/19/2024 15:24'
}
KeyValueStore >> remove: key [
	"remove a key"
	store removeKey: key
]

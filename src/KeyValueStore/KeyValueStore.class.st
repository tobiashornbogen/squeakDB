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
	#'squeak_changestamp' : 'TH 10/19/2024 17:02'
}
KeyValueStore >> containsKey: key [
    "check if key is already in use"
    ^ store includesKey: key
]

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

{
	#category : #baseOperations,
	#'squeak_changestamp' : 'TH 10/19/2024 16:40'
}
KeyValueStore >> testKeyValueStore [
    | store |
    store := KeyValueStore new.
    
    "Test putting and getting"
    store put: 1 value: '192.168.0.1'.
    self assert: (store get: 1) equals: '192.168.0.1'.
    
    "Test getAllKeys"
    store put: 2 value: '192.168.0.2'.
    self assert: (store getAll asSortedCollection) equals: #(1 2) asSortedCollection.
    
    "Test remove"
    store remove: 1.
    self assert: (store getAll) equals: #(2) asOrderedCollection.
    
    "Test getting non-existent key"
    self should: [store get: 3] raise: Error.  "You might need to adjust this based on how you've implemented error handling"
]

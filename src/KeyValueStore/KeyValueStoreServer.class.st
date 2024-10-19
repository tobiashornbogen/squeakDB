Class {
	#name : #KeyValueStoreServer,
	#superclass : #Object,
	#instVars : [
		'store',
		'server',
		'port'
	],
	#category : #KeyValueStore
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TH 10/19/2024 17:12'
}
KeyValueStoreServer class >> new [
    ^self basicNew initialize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TH 10/19/2024 17:12'
}
KeyValueStoreServer class >> startOn: aPort [
    ^self new
        port: aPort;
        start
]

{
	#category : #handler,
	#'squeak_changestamp' : 'TH 10/19/2024 17:16'
}
KeyValueStoreServer >> handleGet: req [
    | key value |
    key := req fields at: 'key' ifAbsent: [^req send400Response].
    value := store get: key asNumber.
    ^req send200Response: value asString
]

{
	#category : #handler,
	#'squeak_changestamp' : 'TH 10/19/2024 17:18'
}
KeyValueStoreServer >> handleGetAllKeys: req [
    | keys |
    keys := store getAll.
    ^req send200Response: keys asString
]

{
	#category : #handler,
	#'squeak_changestamp' : 'TH 10/19/2024 17:17'
}
KeyValueStoreServer >> handlePut: req [
    | key value |
    key := req fields at: 'key' ifAbsent: [^req send400Response].
    value := req fields at: 'value' ifAbsent: [^req send400Response].
    store put: key asNumber value: value.
    ^req send200Response: 'OK'
]

{
	#category : #handler,
	#'squeak_changestamp' : 'TH 10/19/2024 17:17'
}
KeyValueStoreServer >> handleRemove: req [
    | key |
    key := req fields at: 'key' ifAbsent: [^req send400Response].
    store remove: key asNumber.
    ^req send200Response: 'OK'
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'TH 10/19/2024 17:13'
}
KeyValueStoreServer >> initialize [
    store := KeyValueStore new.
    server := WebServer new.
    port := 8080
]

{
	#category : #server,
	#'squeak_changestamp' : 'TH 10/19/2024 17:14'
}
KeyValueStoreServer >> port: aNumber [
    port := aNumber
]

{
	#category : #server,
	#'squeak_changestamp' : 'TH 10/19/2024 17:25'
}
KeyValueStoreServer >> setupRoutes [
    server addService: '/get' action: [:req | self handleGet: req].
    server addService: '/put' action: [:req | self handlePut: req].
    server addService: '/remove' action: [:req | self handleRemove: req].
    server addService: '/getAllKeys' action: [:req | self handleGetAllKeys: req].
    server addService: '/test' action: [:req | req send200Response: 'Server is working'].
]

{
	#category : #server,
	#'squeak_changestamp' : 'TH 10/19/2024 17:15'
}
KeyValueStoreServer >> start [
    server listenOn: port.
    self setupRoutes.
    ^self
]

{
	#category : #server,
	#'squeak_changestamp' : 'TH 10/19/2024 17:15'
}
KeyValueStoreServer >> stop [
    server stop
]

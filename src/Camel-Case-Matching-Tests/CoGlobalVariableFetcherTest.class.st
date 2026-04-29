Class {
	#name : 'CoGlobalVariableFetcherTest',
	#superclass : 'TestCase',
	#instVars : [
		'fetcher',
		'expectedElements'
	],
	#category : 'Camel-Case-Matching-Tests',
	#package : 'Camel-Case-Matching-Tests'
}

{ #category : 'running' }
CoGlobalVariableFetcherTest >> setUp [

	super setUp.
	fetcher := CoGlobalVariableFetcher new.
	fetcher systemNavigation: self systemNavigation.

	expectedElements := {
		CoGlobalEntry contents: 'A' node: nil.
		CoGlobalEntry contents: 'B' node: nil.
		CoGlobalEntry contents: 'C' node: nil. }
]

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsContents [
	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') contents) equals: 'OrderedCollection'
]

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsFetcherName [

	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') fetcherName ) equals: 'CoGlobalVariableFetcher'
]

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsNode [ 


	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') node) equals: nil
]

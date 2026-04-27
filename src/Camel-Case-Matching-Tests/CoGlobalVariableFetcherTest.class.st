Class {
	#name : 'CoGlobalVariableFetcherTest',
	#superclass : 'TestCase',
	#category : 'Camel-Case-Matching-Tests',
	#package : 'Camel-Case-Matching-Tests'
}

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsContents [
	|fetcher|
	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') contents) equals: 'OrderedCollection'
]

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsFetcherName [
	|fetcher|
	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') fetcherName ) equals: 'CoGlobalVariableFetcher'
]

{ #category : 'testing' }
CoGlobalVariableFetcherTest >> testNewEntryForSetsNode [ 
	|fetcher|
	fetcher := CoGlobalVariableFetcher new.
	self assert: ((fetcher newEntryFor: 'OrderedCollection') node) equals: nil
]

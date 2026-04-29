Class {
	#name : 'CoGlobalEntryTest',
	#superclass : 'TestCase',
	#category : 'Camel-Case-Matching-Tests',
	#package : 'Camel-Case-Matching-Tests'
}

{ #category : 'testing' }
CoGlobalEntryTest >> testCamelCasePartsOf [
	self assert: (CoGlobalEntry new camelCasePartsOf: 'CoGlobalVariableFetcher')
		equals: #('Co' 'Global' 'Variable' 'Fetcher')
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenEmptyToken [
	
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenEmptyTokenWithParts [
	self assert:(CoGlobalEntry new matchToken: '' againstParts: #('foo' 'bar') partIndex: 1) equals:	true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenExactMatch [
	self assert:(CoGlobalEntry new matchToken: 'FooBarBaz' againstParts: #('Foo' 'Bar' 'Baz') partIndex: 1) equals: true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenNoMatch [
	self assert:(CoGlobalEntry new matchToken: 'FooBarBaz' againstParts: #('Co' 'A' 'S' 'T' 'Fetcher') partIndex: 1) equals: false
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenTokenConsumesBeforePartsEnd [
	self assert:(CoGlobalEntry new matchToken: 'CoAST' againstParts: #('Co' 'A' 'S' 'T' 'Fetcher') partIndex: 1) equals: true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchTokenAgainstPartsPartIndexWhenTokenTooLong [
	self assert:(CoGlobalEntry new matchToken: 'FooBarBaz' againstParts: #('Foo' 'Bar') partIndex: 1) equals: false
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchesCamelCaseCompletionTokenCaseSensitiveWhenEmptyToken [
	self assert: (CoGlobalEntry new matchesCamelCaseCompletionToken: '' caseSensitive: true) equals: true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchesCamelCaseCompletionTokenCaseSensitiveWhenExactPrefixMatch [
	| entry |
	entry := CoGlobalEntry new.
	entry contents: 'CoGlobalVariableFetcher'.

	self assert: (
		entry matchesCamelCaseCompletionToken: 'CoGlo'
		caseSensitive: true
	) equals: true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchesCamelCaseCompletionTokenCaseSensitiveWhenExactPrefixMatchCaseInsensitive [
	| entry |
	entry := CoGlobalEntry new.
	entry contents: 'CoGlobalVariableFetcher'.

	self assert: (
		entry matchesCamelCaseCompletionToken: 'CoGlo'
		caseSensitive: false
	) equals: true
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchesCamelCaseCompletionTokenCaseSensitiveWhenMatchFailsDueToWrongOrder [
	| entry |
	entry := CoGlobalEntry new.
	entry contents: 'CoGlobalVariableFetcher'.

	self assert: (
		entry matchesCamelCaseCompletionToken: 'CoFetVar'
		caseSensitive: false
	) equals: false
]

{ #category : 'testing' }
CoGlobalEntryTest >> testMatchesCamelCaseCompletionTokenCaseSensitiveWhenNoPartsReturnsFalse [
	| entry |
	entry := CoGlobalEntry new.
	entry contents: ''.

	self assert: (
		entry matchesCamelCaseCompletionToken: 'CoFetVar'
		caseSensitive: false
	) equals: false
]

{ #category : 'testing' }
CoGlobalEntryTest >> testcamelCasePartsOfWhenAcronymInMiddle [
	self assert: (CoGlobalEntry new camelCasePartsOf: 'CoHeuristicASTResultSetBuilder') equals: #('Co' 'Heuristic' 'A' 'S' 'T' 'Result' 'Set' 'Builder')
]

{ #category : 'testing' }
CoGlobalEntryTest >> testcamelCasePartsOfWhenAllUppercase [
	self assert: (CoGlobalEntry new camelCasePartsOf: 'AST') equals: #('A' 'S' 'T')
]

{ #category : 'testing' }
CoGlobalEntryTest >> testcamelCasePartsOfWhenCamelCase [
	self assert: (CoGlobalEntry new camelCasePartsOf: 'CoVariableFetcher') equals: #('Co' 'Variable' 'Fetcher')
]

{ #category : 'testing' }
CoGlobalEntryTest >> testcamelCasePartsOfWhenEmptyString [
	self assert: (CoGlobalEntry new camelCasePartsOf: '') equals: #()
]

{ #category : 'testing' }
CoGlobalEntryTest >> testcamelCasePartsOfWhenLowerCaseWord [
	self assert: (CoGlobalEntry new camelCasePartsOf: 'foo') equals: #('foo')
]

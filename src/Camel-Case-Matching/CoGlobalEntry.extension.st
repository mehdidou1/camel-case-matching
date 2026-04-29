Extension { #name : 'CoGlobalEntry' }

{ #category : '*Camel-Case-Matching' }
CoGlobalEntry >> camelCasePartsOf: aString [
	"Splits a camelCase or PascalCase string into its component parts.
 	Returns an array of substrings, breaking before each uppercase letter
 	(except the first character)."

	| parts current |
	parts := OrderedCollection new.
	current := WriteStream on: String new.

	aString doWithIndex: [ :ch :index |
		(index > 1 and: [
			ch isUppercase and: [ current contents notEmpty ] ])
			ifTrue: [
				parts add: current contents.
				current := WriteStream on: String new ].
		current nextPut: ch ].

	current contents ifNotEmpty: [ parts add: current contents ].
	^ parts asArray
]

{ #category : '*Camel-Case-Matching' }
CoGlobalEntry >> matchToken: token againstParts: parts [
"Entry point for token matching against a collection of parts.
 Starts the recursive matching process from the first part (index 1).
 See matchToken:againstParts:partIndex:
"

	^ self
		matchToken: token
		againstParts: parts
		partIndex: 1
]

{ #category : '*Camel-Case-Matching' }
CoGlobalEntry >> matchToken: token againstParts: parts partIndex: startIndex [

"Returns true if the given token can be matched by concatenating
 prefixes of successive parts, starting at startIndex.

 The match proceeds in order through the parts collection, taking
 one prefix per part and consuming the token progressively.
 Uses backtracking to try all possible prefix lengths.

 Returns true if the entire token is consumed, false otherwise."

	token ifEmpty: [ ^ true ].
	startIndex > parts size ifTrue: [ ^ false ].

	startIndex to: parts size do: [ :i |
		| part maxPrefix |
		part := parts at: i.
		maxPrefix := token size min: part size.

		1 to: maxPrefix do: [ :prefixSize |
			| piece |
			piece := part first: prefixSize.
			(token beginsWith: piece) ifTrue: [
				(self
					matchToken: (token allButFirst: prefixSize)
					againstParts: parts
					partIndex: i + 1) ifTrue: [ ^ true ] ] ] ].

	^ false
]

{ #category : '*Camel-Case-Matching' }
CoGlobalEntry >> matchesCamelCaseCompletionToken: aString caseSensitive: aBoolean [

"Checks whether aString matches the receiver's contents

 The contents are split into camelCase parts, and the input string
 is compared as a prefix across these parts in order.

 Returns true if the token can be matched, false otherwise."

	| token parts normalizedParts normalizedToken |
	aString ifEmpty: [ ^ true ].

	normalizedToken := aBoolean
		ifTrue: [ aString asString ]
		ifFalse: [ aString asString asLowercase ].

	parts := self camelCasePartsOf: self contents.
	parts isEmpty ifTrue: [ ^ false ].

	normalizedParts := aBoolean
		ifTrue: [ parts ]
		ifFalse: [ parts collect: [ :each | each asLowercase ] ].

	token := normalizedToken.
	^ self matchToken: token againstParts: normalizedParts
]

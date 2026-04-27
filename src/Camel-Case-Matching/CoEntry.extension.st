Extension { #name : 'CoEntry' }

{ #category : '*Camel-Case-Matching' }
CoEntry >> beginsWith: aString [
	"Returns true if the receiver begins with the given string using case-sensitive prefix matching."
	^ self matchesPrefixToken: aString caseSensitive: true
]

{ #category : '*Camel-Case-Matching' }
CoEntry >> matchesCamelCaseCompletionToken: aString caseSensitive: aBoolean [

	^ false
]

{ #category : '*Camel-Case-Matching' }
CoEntry >> matchesPrefixToken: aString caseSensitive: aBoolean [
	"Returns true if the receiver's contents begins with aString,
 	using either case-sensitive or case-insensitive comparison."

	^ self contents beginsWith: aString caseSensitive: aBoolean
]

Extension { #name : 'CoEntry' }

{ #category : '*Camel-Case-Matching' }
CoEntry >> beginsWith: aString [

	^ self matchesPrefixToken: aString caseSensitive: true
]

{ #category : '*Camel-Case-Matching' }
CoEntry >> matchesCamelCaseCompletionToken: aString caseSensitive: aBoolean [

	^ false
]

{ #category : '*Camel-Case-Matching' }
CoEntry >> matchesPrefixToken: aString caseSensitive: aBoolean [

	^ self contents beginsWith: aString caseSensitive: aBoolean
]

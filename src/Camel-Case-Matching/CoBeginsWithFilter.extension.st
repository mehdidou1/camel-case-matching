Extension { #name : 'CoBeginsWithFilter' }

{ #category : '*Camel-Case-Matching' }
CoBeginsWithFilter >> candidate: aCandidate matchesCamelCaseCaseSensitive: aBoolean [

	^ (aCandidate respondsTo: #matchesCamelCaseCompletionToken:caseSensitive:)
		and: [ aCandidate
			matchesCamelCaseCompletionToken: completionString
			caseSensitive: aBoolean ]
]

{ #category : '*Camel-Case-Matching' }
CoBeginsWithFilter >> candidate: aCandidate matchesPrefixCaseSensitive: aBoolean [

	^ (aCandidate respondsTo: #matchesPrefixToken:caseSensitive:)
		ifTrue: [ aCandidate matchesPrefixToken: completionString caseSensitive: aBoolean ]
		ifFalse: [ aCandidate asString beginsWith: completionString caseSensitive: aBoolean ]
]

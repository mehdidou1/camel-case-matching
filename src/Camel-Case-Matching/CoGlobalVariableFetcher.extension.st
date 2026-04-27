Extension { #name : 'CoGlobalVariableFetcher' }

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> entriesDo: aBlock [

	NECPreferences camelCaseGlobalMatching
		ifTrue: [ ^ self entriesDoWithFullEnvironmentScan: aBlock ].

	self systemNavigation
		allGlobalNamesStartingWith: filter completionString
		do: [ :e | aBlock value: (self newEntryFor: e) ]
		caseSensitive: NECPreferences caseSensitive
]

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> entriesDoWithFullEnvironmentScan: aBlock [

	self systemNavigation
		allGlobalNamesStartingWith: ''
		do: [ :e | aBlock value: (self newEntryFor: e) ]
		caseSensitive: true
]

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> newEntryFor: aGlobalName [

	^ (CoGlobalEntry contents: aGlobalName node: astNode)
		  fetcherName: self class name;
		  yourself
]

Extension { #name : 'CoGlobalVariableFetcher' }

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> entriesDo: aBlock [
"Iterates over full environment entries and filtered global names,
converting each into a CoGlobalEntry and passing it to the block."

   self entriesDoWithFullEnvironmentScan: aBlock .

	self systemNavigation
		allGlobalNamesStartingWith: filter completionString
		do: [ :e | aBlock value: (self newEntryFor: e) ]
		caseSensitive: NECPreferences caseSensitive
]

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> entriesDoWithFullEnvironmentScan: aBlock [
"Iterates over all global system names and yields a CoGlobalEntry for each one to the given block.

Performs a full environment scan (no filtering) and wraps each global name into an entry before passing it to the block."

	self systemNavigation
		allGlobalNamesStartingWith: ''
		do: [ :e | aBlock value: (self newEntryFor: e) ]
		caseSensitive: true
]

{ #category : '*Camel-Case-Matching' }
CoGlobalVariableFetcher >> newEntryFor: aGlobalName [

"Creates a CoGlobalEntry for a global name, setting its AST node and fetcher name."

	^ (CoGlobalEntry contents: aGlobalName node: astNode)
		  fetcherName: self class name;
		  yourself
]

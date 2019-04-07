Extension { #name : #FamixStType }

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> abstractMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isAbstract
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> abstractMethodsGroup [
	<navigation: 'Abstract methods'>
	
	^ FAMIXMethodGroup 	withAll: (self abstractMethods)
							withDescription: 'Abstract methods in ', self name
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> accessorMethods [
	
	^ self methods select: #isPureAccessor
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> accessorMethodsGroup [
	<navigation: 'Accessor methods'>
	
	^ FAMIXMethodGroup 	withAll: (self accessorMethods)
							withDescription: 'Pure accessors in ', self name
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> constantMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isConstant
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> constructors [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isConstructor
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> externalFanin [

	^ self clientClassesOutOfMyPackage size
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> externalFanout [

	^ self providerClassesOutOfMyPackage size
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> fanRatio [

	^ self fanIn / (self fanIn + self fanOut)
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> fanTotal [

	^ self fanIn + self fanOut
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> fanType [

	^ self externalFanin >= self internalFanin
			ifTrue: [
				self externalFanout >= self internalFanout
					ifTrue: [#eFieFo]
					ifFalse: [#eFiiFo]]
			ifFalse: [
				self externalFanout >= self internalFanout
					ifTrue: [#iFieFo]
					ifFalse: [#iFiiFo]]
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> faninBalance [

	| fanin |
	fanin := self fanIn.
	^ fanin = 0 	ifTrue: [0]
					ifFalse: [(self externalFanin - self internalFanin) / self fanIn]
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> fanoutBalance [

	^ (self externalFanout - self internalFanout) / self fanOut
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> getterMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isGetter
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> implementationMethods [
	^ self methods select: #isInternalImplementation
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> initializers [

	^ self methods select: #isInitializer
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> interfaceMethods [
	^ self methods select: [:each | each isInternalImplementation not & each isInitializer not & each isPureAccessor not]
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> internalFanin [

	^ self clientClassesIntoMyPackage size
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> internalFanout [

	^ self providerClassesIntoMyPackage size
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> internalInvocations [

	^ self outgoingInvocationsGroup select: [:each | 
				each candidates anySatisfy: [:c|
					c belongsTo == self ]].

]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> internalLayerInvocations [

	^ self outgoingInvocationsGroup select: [:each | 
			each sender isInternalImplementation and: [ "internal sender"
				each candidates anySatisfy: [:cand|
					cand belongsTo == self and: [ "class candidate"
						each sender ~= cand and: [ "no recursive call"
							cand isInternalImplementation ]]]]] "internal candidate"

]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> overridingMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isOverriding
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> setterMethods [
	"Used for the class blueprint
	Alexandre.Bergel 3/28/2009 12:10"
	^ self methods select: #isSetter
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	| view |
	view := RTView new.
	view @ RTZoomableView @ RTDraggableView.
	self viewBlueprintOn: view.
	self addBlueprintLegendOn: view. 
	^ view inspect
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> viewBlueprintOn: view [
	^ FAMIXClassBlueprint new view: self on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> viewHierarchyOn: view [
	| hierarchy |
	hierarchy :=		(self withDeepCollect: [:each | each directSubclasses]), 
						(self deepCollect: [:each | each directSuperclasses reject: [:c | c isInterface]]).
	hierarchy asMooseGroup 
		viewSimpleSystemComplexityWithSelection: { self } 
		height: [ :c | c numberOfMethods ] 
		width: [ :c | c numberOfAttributes ] 
		color: [ :c | c numberOfLinesOfCode ] 
		on: view.

]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'> 
	
	| view |
	view := RTUMLClassBuilder new.
	self viewUMLOn: view.
	^ view openWithToolbarEntitled: 'UML class diagram'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStType >> viewUMLOn: view [

	view
		addObjects: {self};
		classname: #name;
		instanceVariables: #attributes;
		methodsNames: #methods;
		methodselector: #name;
		superclass: nil
]

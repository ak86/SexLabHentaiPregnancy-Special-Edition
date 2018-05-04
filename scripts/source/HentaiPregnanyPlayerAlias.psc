Scriptname HentaiPregnanyPlayerAlias extends ReferenceAlias  

Event OnInit()
	Maintenance()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Maintenance()
EndEvent

Event OnPlayerLoadGame()
	Maintenance()
EndEvent

;----------------------------------------------------------------------------
;update breast size on game load/location change
;----------------------------------------------------------------------------

Function Maintenance()
	(self.GetOwningQuest() as HentaiPregnancy).UpdateSize()
EndFunction
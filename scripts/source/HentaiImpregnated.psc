Scriptname HentaiImpregnated extends activemagiceffect  

;this spell script is used for non unique npcs cuminflation/pregnancy imitation
;unique npcs use true cuminflation/pregnancy in aliases
;its is likely its removed on game load/cell change if actor not saved by some other mods alias
;not sure why since even 20 aliases should be enough, but w/e

HentaiPregnancy Property HentaiP Auto

Float CurrentBreastSize = 1.0
Float CurrentBellySize = 0.0

Int CurrentDay = 1

Actor Property ActorRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)										;preg start
	ActorRef = akTarget

	CurrentBreastSize = NetImmerse.GetNodeScale(ActorRef, "NPC L Breast", false)
	CurrentBellySize = NetImmerse.GetNodeScale(ActorRef, "NPC Belly", false)

	RegisterForSingleUpdate(10)
	RegisterForSingleUpdateGameTime(24)
EndEvent

Event OnUpdate()																		;update body every 10 sec
	if CurrentBellySize < HentaiP.config.MaxScaleBelly
		CurrentBellySize += 0.1
		if HentaiP.config.BellyScaling 
			HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
		endif
	EndIf
	if CurrentBreastSize < HentaiP.config.MaxScaleBreasts
		CurrentBreastSize += 0.05
		if HentaiP.config.BreastScaling 
			HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", CurrentBreastSize)
			HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", CurrentBreastSize)
		EndIf
	EndIf
	RegisterForSingleUpdate(10)
EndEvent

Event OnUpdateGameTime()																;daily preg update
	if CurrentDay <= HentaiP.config.PregnancyDuration
		CurrentDay += 1
		RegisterForSingleUpdateGameTime(24)
	Else
		UnregisterForUpdate()
		HentaiP.endPregnancy(ActorRef, -1, true, 24)
		Debug.Notification(ActorRef.GetActorBase().GetName() + HentaiP.Strings.ShowHentaiImpregnatedStrings(0))
		ResetBody()
		Dispel()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)									;preg end
	if CurrentDay <= HentaiP.config.PregnancyDuration
		Debug.Notification(ActorRef.GetActorBase().GetName() + HentaiP.Strings.ShowHentaiImpregnatedStrings(0))
		HentaiP.endPregnancy(ActorRef, -1, true, 24)
	else
		ResetBody()
		UnregisterForUpdate()
	EndIf
EndEvent

function ResetBody()																	;quickly deflate
	While CurrentBellySize > 1 || CurrentBreastSize > 1
		if CurrentBellySize > 1
			CurrentBellySize -= 0.1
			if HentaiP.config.BellyScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC Belly", CurrentBellySize)
			endif
		EndIf
		if CurrentBreastSize > 1
			CurrentBreastSize -= 0.05
			if HentaiP.config.BreastScaling 
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC L Breast", CurrentBreastSize)
				HentaiP.BodyMod.SetNodeScale(ActorRef, "NPC R Breast", CurrentBreastSize)
			EndIf
		EndIf
		Utility.Wait(0.1)
	EndWhile
	HentaiP.ResetBody(ActorRef)
endFunction

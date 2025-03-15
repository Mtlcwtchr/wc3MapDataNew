function Trig_FatigueSystem_Actions takes nothing returns nothing
	local Component top = LoadIntegerBJ(udg_FATIGUE_ID, 0, udg_ht_components)
    local Component current = top
    loop 
        exitwhen current < 0
            set udg_fatigueHandle = current
	        call TriggerExecute(gg_trg_FatigueSystemEach)
            set current = current.next
    endloop
endfunction

//===========================================================================
function InitTrig_FatigueSystem takes nothing returns nothing
    set gg_trg_FatigueSystem = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_FatigueSystem, 0.10 )
    call TriggerAddAction( gg_trg_FatigueSystem, function Trig_FatigueSystem_Actions )
endfunction


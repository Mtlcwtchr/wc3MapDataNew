function Trig_PeriodicDamageSystem_Actions takes nothing returns nothing
	local Component top = LoadIntegerBJ(udg_PERIODICDAMAGE_ID, 0, udg_ht_components)
    local Component current = top
    loop 
        exitwhen current < 0
            set udg_periodicDamageHandle = current
	        call TriggerExecute(gg_trg_PeriodicDamageSystemEach)
            set current = current.next
    endloop
endfunction

//===========================================================================
function InitTrig_PeriodicDamageSystem takes nothing returns nothing
    set gg_trg_PeriodicDamageSystem = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_PeriodicDamageSystem, 0.10 )
    call TriggerAddAction( gg_trg_PeriodicDamageSystem, function Trig_PeriodicDamageSystem_Actions )
endfunction

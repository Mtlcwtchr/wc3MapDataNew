function Trig_PhaseShiftSystem_Actions takes nothing returns nothing
    local Component top = LoadIntegerBJ(udg_PORTALSHIFT_ID, 0, udg_ht_components)
    local Component current = top
    loop 
        exitwhen current < 0
            set udg_phaseShiftHandle = current
	    call TriggerExecute(gg_trg_PhaseShiftSystemEach)
            set current = current.next
    endloop
endfunction

//===========================================================================
function InitTrig_PhaseShiftSystem takes nothing returns nothing
    set gg_trg_PhaseShiftSystem = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_PhaseShiftSystem, 0.10 )
    call TriggerAddAction( gg_trg_PhaseShiftSystem, function Trig_PhaseShiftSystem_Actions )
endfunction

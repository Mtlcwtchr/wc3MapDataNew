function Trig_PortalSystem_Actions takes nothing returns nothing
	local Component top = LoadIntegerBJ(udg_PORTAL_ID, 0, udg_ht_components)
    local Component current = top
    loop 
        exitwhen current < 0
            set udg_portalHandle = current
	        call TriggerExecute(gg_trg_PortalSystemEach)
            set current = current.next
    endloop
endfunction

//===========================================================================
function InitTrig_PortalSystem takes nothing returns nothing
    set gg_trg_PortalSystem = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_PortalSystem, 0.10 )
    call TriggerAddAction( gg_trg_PortalSystem, function Trig_PortalSystem_Actions )
endfunction

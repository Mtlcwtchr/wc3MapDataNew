function Trig_PortalCompose_Actions takes nothing returns nothing
    local Portal pd = Component(udg_portalHandle).data
    set pd.duration = udg_portalDuration
    set pd.timeElapsed = udg_portalTimeElapsed
    set pd.portaUnit = udg_portalUnit
    set pd.portalPosition = udg_portalPosition
endfunction

//===========================================================================
function InitTrig_PortalCompose takes nothing returns nothing
    set gg_trg_PortalCompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PortalCompose, function Trig_PortalCompose_Actions )
endfunction


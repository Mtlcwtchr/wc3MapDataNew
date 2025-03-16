function Trig_PortalDecompose_Actions takes nothing returns nothing
    local Portal pd = Component(udg_portalHandle).data
    set udg_portalDuration = pd.duration
    set udg_portalTimeElapsed = pd.timeElapsed
    set udg_portalUnit = pd.portaUnit
    set udg_portalPosition = pd.portalPosition
endfunction

//===========================================================================
function InitTrig_PortalDecompose takes nothing returns nothing
    set gg_trg_PortalDecompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PortalDecompose, function Trig_PortalDecompose_Actions )
endfunction


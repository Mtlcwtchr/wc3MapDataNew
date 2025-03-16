function Trig_PortalCreate_Actions takes nothing returns nothing
    local Portal pd = Portal.create(udg_portalPosition, udg_portalDuration)
    local Component pdComponent = Component.create(udg_PORTAL_ID, pd)
    call Component.Register(pdComponent)
endfunction

//===========================================================================
function InitTrig_PortalCreate takes nothing returns nothing
    set gg_trg_PortalCreate = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PortalCreate, function Trig_PortalCreate_Actions )
endfunction

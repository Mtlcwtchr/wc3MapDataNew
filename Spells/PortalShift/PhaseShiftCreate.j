function Trig_PhaseShiftCreate_Actions takes nothing returns nothing
    local Phase pd = PhaseShift.create(udg_portalShiftUnit, udg_portalShiftEffectName, udg_portalShiftVelocity, udg_portalHandle)
    local Component pdComponent = Component.create(udg_PORTALSHIFT_ID, pd)
    set udg_portalShiftHandle = pdComponent
    call Component.Register(pdComponent)
endfunction

//===========================================================================
function InitTrig_PhaseShiftCreate takes nothing returns nothing
    set gg_trg_PhaseShiftCreate = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PhaseShiftCreate, function Trig_PhaseShiftCreate_Actions )
endfunction


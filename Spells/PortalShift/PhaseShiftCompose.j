function Trig_PhaseShiftCompose_Actions takes nothing returns nothing
    local PhaseShift pd = Component(udg_phaseShiftHandle).data
    set pd.shifter = udg_phaseShiftUnit
    set pd.currX = udg_phaseShiftX
    set pd.currY = udg_phaseShiftY
    set pd.dX = udg_phaseShiftdX
    set pd.dY = udg_phaseShiftdY
    set pd.visualEffect = udg_phaseShiftEffect
    set pd.effectName = udg_phaseShiftEffectName
endfunction

//===========================================================================
function InitTrig_PhaseShiftCompose takes nothing returns nothing
    set gg_trg_PhaseShiftCompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PhaseShiftCompose, function Trig_PhaseShiftCompose_Actions )
endfunction


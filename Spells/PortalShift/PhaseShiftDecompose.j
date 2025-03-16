function Trig_PhaseDecompose_Actions takes nothing returns nothing
    local PhaseShift pd = Component(udg_phaseShiftHandle).data
    set udg_phaseShiftUnit = pd.shifter
    set udg_phaseShiftX = pd.currX
    set udg_phaseShiftY = pd.currY
    set udg_phaseShiftdX = pd.dX
    set udg_phaseShiftdY = pd.dY
    set udg_phaseShiftEffect = pd.visualEffect
    set udg_phaseShiftEffectName = pd.effectName
endfunction

//===========================================================================
function InitTrig_PhaseDecompose takes nothing returns nothing
    set gg_trg_PhaseDecompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PhaseDecompose, function Trig_PhaseDecompose_Actions )
endfunction


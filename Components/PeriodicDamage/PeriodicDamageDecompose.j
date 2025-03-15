function Trig_PeriodicDamageDecompose_Actions takes nothing returns nothing
    local PeriodicDamage pd = Component(udg_periodicDamageHandle).data
    set udg_periodicDamageDamage = pd.damagePerTick
    set udg_periodicDamageDuration = pd.duration
    set udg_periodicDamageTimeElapsed = pd.timeElapsed
    set udg_periodicDamageTickElapsed = pd.tickElapsed
    set udg_periodicDamageTick = pd.tickTime
    set udg_periodicDamageEffect = pd.visualEffect
    set udg_periodicDamageEffectName = pd.effectName
    set udg_periodicDamageAffectedUnit = pd.affectedUnit
endfunction

//===========================================================================
function InitTrig_PeriodicDamageDecompose takes nothing returns nothing
    set gg_trg_PeriodicDamageDecompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PeriodicDamageDecompose, function Trig_PeriodicDamageDecompose_Actions )
endfunction


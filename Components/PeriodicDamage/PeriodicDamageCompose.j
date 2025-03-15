function Trig_PeriodicDamageCompose_Actions takes nothing returns nothing
    local PeriodicDamage pd = Component(udg_periodicDamageHandle).data
    set pd.damagePerTick = udg_periodicDamageDamage 
    set pd.duration = udg_periodicDamageDuration
    set pd.timeElapsed = udg_periodicDamageTimeElapsed
    set pd.tickElapsed = udg_periodicDamageTickElapsed
    set pd.tickTime = udg_periodicDamageTick
    set pd.visualEffect = udg_periodicDamageEffect
    set pd.effectName = udg_periodicDamageEffectName
    set pd.affectedUnit = udg_periodicDamageAffectedUnit
endfunction

//===========================================================================
function InitTrig_PeriodicDamageCompose takes nothing returns nothing
    set gg_trg_PeriodicDamageCompose = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PeriodicDamageCompose, function Trig_PeriodicDamageCompose_Actions )
endfunction


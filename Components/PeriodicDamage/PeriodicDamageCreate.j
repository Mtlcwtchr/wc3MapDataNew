function Trig_PeriodicDamageCreate_Actions takes nothing returns nothing
    local PeriodicDamage pd = PeriodicDamage.create(udg_periodicDamageAffectedUnit, udg_periodicDamageEffectName, udg_periodicDamageDuration, udg_periodicDamageDamage)
    local Component pdComponent = Component.create(udg_PERIODICDAMAGE_ID, pd)
    call Component.Register(pdComponent)
endfunction

//===========================================================================
function InitTrig_PeriodicDamageCreate takes nothing returns nothing
    set gg_trg_PeriodicDamageCreate = CreateTrigger(  )
    call TriggerAddAction( gg_trg_PeriodicDamageCreate, function Trig_PeriodicDamageCreate_Actions )
endfunction

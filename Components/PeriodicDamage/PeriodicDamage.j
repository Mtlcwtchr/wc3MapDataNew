struct PeriodicDamage extends ComponentData 
    string effectName
    effect visualEffect
    real duration
    real damagePerTick

    unit affectedUnit

    real timeElapsed

    real tickTime = 1.0
    real tickElapsed

    static method create takes unit affectedUnit, string effectName, real duration, real damagePerTick returns PeriodicDamage
        local PeriodicDamage this = PeriodicDamage.allocate()
        set this.affectedUnit = affectedUnit
        set this.effectName = effectName
        set this.duration = duration
        set this.damagePerTick = damagePerTick
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        if visualEffect != null then
            call DestroyEffect(visualEffect)
            set visualEffect = null
        endif
        set effectName = null
    endmethod

endstruct
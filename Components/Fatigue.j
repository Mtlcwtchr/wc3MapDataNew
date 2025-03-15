struct Fatigue extends ComponentData 
    string effectName
    effect visualEffect
    real duration
    real damagePerTick

    unit affectedUnit

    real timeElapsed

    real tickTime = 1.0
    real tickElapsed

    static method create takes unit affectedUnit, string effectName, real duration, real damagePerTick returns Fatigue
        local Fatigue this = Fatigue.allocate()
        set this.affectedUnit = affectedUnit
        set this.effectName = effectName
        set this.duration = duration
        set this.damagePerTick = damagePerTick
        set this.timeElapsed = 0
        set this.tickElapsed = 0
        set this.visualEffect = null
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        call DestroyEffect(visualEffect)
        set effectName = null
    endmethod

endstruct

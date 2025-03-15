
struct Attack extends StateData
    unit target

    static method create takes unit target returns Attack
        local Attack this = Attack.allocate()
        set this.target = target
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        set target = null
     endmethod

    method Reset takes nothing returns nothing
    endmethod
endstruct
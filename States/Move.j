
struct Move extends StateData
    location targetLoc

    static method create takes location loc returns Move
        local Move this = Move.allocate()
        set this.targetLoc = loc
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        call RemoveLocation(targetLoc)
        set targetLoc = null
     endmethod

    method Reset takes nothing returns nothing
    endmethod
endstruct
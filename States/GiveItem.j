
struct GiveItem extends StateData
    itemtype target
    unit whichUnitTo

    static method create takes itemtype target, unit whichUnitTo returns GiveItem
        local GiveItem this = GiveItem.allocate()
        set this.target = target
        set this.whichUnitTo = whichUnitTo
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        set target = null
        set whichUnitTo = null
     endmethod

    method Reset takes nothing returns nothing
    endmethod
endstruct

struct CreateItem extends StateData
    itemtype target

    static method create takes itemtype target returns CreateItem
        local CreateItem this = CreateItem.allocate()
        set this.target = target
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        set target = null
     endmethod

    method Reset takes nothing returns nothing
    endmethod
endstruct
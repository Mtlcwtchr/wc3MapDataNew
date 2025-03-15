library STATEAPI initializer STATEAPI_INIT

    private function STATEAPI_INIT takes nothing returns nothing
        call InitHashtableBJ(  )
        set udg_ht_statemachine = GetLastCreatedHashtableBJ()
    endfunction

    globals
        integer nullptr = -1
    endglobals

    struct StateData 
        stub method Reset takes nothing returns nothing
        endmethod

        stub method IsCompleted takes nothing returns boolean
            return true
        endmethod
    endstruct

    struct State 

        integer id
        StateData data
        group unitsGroup

        State next

        static method create takes integer id, StateData data, group unitsGroup returns State 
            local State this = State.allocate()
            set this.id = id
            set this.data = data
            set this.unitsGroup = unitsGroup
            return this
        endmethod

        static method Register takes unit whichUnit, State top returns nothing 
            local integer id = GetHandleId(whichUnit)
            call SaveIntegerBJ(top, id, 0, udg_ht_statemachine)
            call top.Enter(whichUnit)
        endmethod

        static method Unregister takes unit whichUnit returns nothing 
            local integer id = GetHandleId(whichUnit)
            local integer topData = LoadIntegerBJ(id, 0, udg_ht_statemachine)
            local State top = topData
            call top.destroy()
            call SaveIntegerBJ(nullptr, id, 0, udg_ht_statemachine)
        endmethod

        static method GetCurrent takes unit whichUnit returns State 
            local integer id = GetHandleId(whichUnit)
            local integer stateData = LoadIntegerBJ(id, 1, udg_ht_statemachine)
            return stateData
        endmethod

        method onDestroy takes nothing returns nothing
            call data.destroy()
            call next.destroy()
        endmethod

        method Enter takes unit whichUnit returns nothing 
            local integer id = GetHandleId(whichUnit)
            call GroupAddUnit(unitsGroup, whichUnit)
            call SaveIntegerBJ(this, id, 1, udg_ht_statemachine)
            call data.Reset()
        endmethod

        method Complete takes unit whichUnit returns nothing
            local integer id = GetHandleId(whichUnit)
            call GroupRemoveUnit(unitsGroup, whichUnit)
            if next < 0 then 
                call SaveIntegerBJ(nullptr, id, 1, udg_ht_statemachine)
                call Unregister(whichUnit)
                return
            endif
            call next.Enter(whichUnit)
        endmethod


    endstruct

endlibrary
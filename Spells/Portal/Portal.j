struct Portal extends ComponentData
    real duration
    location position

    unit portalUnit

    real timeElapsed

    Portal bound

    static method create takes location position, real duration returns Portal
        local Portal this = Portal.allocate()
        set this.position = position
        set this.duration = duration
        set this.timeElapsed = 0
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        call RemoveLocation(position)
    endmethod
endstruct
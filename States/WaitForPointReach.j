    struct WaitForPointReach extends StateData
        location targetLoc
        real currX
        real currY

        static method create takes location loc returns WaitForPointReach
            local WaitForPointReach this = WaitForPointReach.allocate()
            set this.targetLoc = loc
            return this
        endmethod

        method onDestroy takes nothing returns nothing
            call RemoveLocation(targetLoc)
            set targetLoc = null
        endmethod

        method Reset takes nothing returns nothing
        endmethod

        method IsCompleted takes nothing returns boolean 
            local real dX = (GetLocationX(targetLoc) - currX)
            local real dY = (GetLocationY(targetLoc) - currY)
            return dX * dX + dY * dY <= 2500
        endmethod
    endstruct
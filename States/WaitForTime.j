    struct WaitForTime extends StateData
        real timeout
        real timeElapsed

        static method create takes real timeout returns WaitForTime
            local WaitForTime this = WaitForTime.allocate()
            set this.timeout = timeout
            set this.timeElapsed = 0
            return this
        endmethod

        method Reset takes nothing returns nothing
            set timeElapsed = 0
        endmethod

        method IsCompleted takes nothing returns boolean 
            return timeElapsed >= timeout
        endmethod

    endstruct
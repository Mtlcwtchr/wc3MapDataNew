
struct Animate extends StateData
    string animation

    static method create takes string animation returns Animate
       local Animate this = Animate.allocate()
        set this.animation = animation
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        set animation = null
    endmethod
endstruct
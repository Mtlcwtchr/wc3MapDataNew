struct PhaseShift extends ComponentData
    unit shifter

    string effectName
    effect visualEffect

    real dX
    real dY

    real currX
    real currY

    real destX
    real destY

    real velocity

    static method create takes unit shifter, string effectName, real velocity, real fromX, real fromY, real toX, real toY returns PhaseShift
        local PhaseShift this = PhaseShift.allocate()
        set this.shifter = shifter
        set this.effectName = effectName
        set this.velocity = velocity
        set this.currX = fromX
        set this.currY = fromY
        set this.destX = toX
        set this.destY = toY
        set this.visualEffect = null
        call this.CalculateDir()
        return this
    endmethod

    method onDestroy takes nothing returns nothing
        call DestroyEffect(visualEffect)
        set effectName = null
    endmethod

    method IsCompleted takes nothing returns boolean 
        local real dX = (destX - currX)
        local real dY = (destY - currY)
        return dX * dX + dY * dY <= 2500
    endmethod

    method CalculateDir takes nothing returns nothing 
        local real mag
        set dX = destX - currX
        set dY = destY - currY
        set mag = SquareRoot(dX * dX + dY * dY)
        set dX = dX * velocity / mag
        set dY = dY * velocity / mag
    endmethod
    

endstruct
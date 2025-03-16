library COMPONENTSAPI initializer COMPONENTSAPI_INIT

    private function COMPONENTSAPI_INIT takes nothing returns nothing
        call InitHashtableBJ(  )
        set udg_ht_components = GetLastCreatedHashtableBJ()
    endfunction

    globals
        integer nullptr = -1
    endglobals

    struct ComponentData

    endstruct

    struct Component
        integer id
        ComponentData data

        Component next
        Component prev

        static method create takes integer id, ComponentData data returns Component 
            local Component this = Component.allocate()
            set this.id = id
            set this.data = data
            set this.next = -1
            set this.prev = -1
            return this
        endmethod

        method onDestroy takes nothing returns nothing 
            call data.destroy()
        endmethod

        public static method Register takes Component component returns nothing
            local integer topHandle = LoadIntegerBJ(component.id, 0, udg_ht_components)
            local integer bottomHandle = LoadIntegerBJ(component.id, 1, udg_ht_components)
            local Component top = topHandle
            local Component bottom = bottomHandle
            if top < 0 then 
                set top = component
                set bottom = component
                call SaveIntegerBJ(top, component.id, 0, udg_ht_components)
                call SaveIntegerBJ(bottom, component.id, 1, udg_ht_components)
            else 
                set bottom.next = component
                set component.prev = bottom
                set bottom = component
                call SaveIntegerBJ(bottom, component.id, 1, udg_ht_components)
            endif
        endmethod

        public static method Unregister takes Component component returns nothing
            local Component prev = component.prev
            local Component next = component.next
            if prev < 0 then 
                if next < 0 then
                    call SaveIntegerBJ(-1, component.id, 0, udg_ht_components)
                    call SaveIntegerBJ(-1, component.id, 1, udg_ht_components)
                else 
                    set next.prev = -1
                    call SaveIntegerBJ(next, component.id, 0, udg_ht_components)
                endif
            else 
                if next < 0 then 
                    set prev.next = -1
                    call SaveIntegerBJ(prev, component.id, 1, udg_ht_components)
                else 
                    set prev.next = next
                    set next.prev = prev
                endif
            endif
        endmethod

    endstruct

endlibrary
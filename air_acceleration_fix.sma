#include <amxmodx>
#include <engine>

public plugin_init() {
    register_plugin("Air Acceleration Fix", "1.0", "SeuNome");
    
    // Hook para quando o jogador se movimenta
    register_event("CurWeapon", "event_air_acceleration", "b", "1=1");
}

public event_air_acceleration(id) {
    if (is_user_alive(id)) {
        set_user_air_acceleration(id, 1000.0); // Aumenta a aceleração no ar
    }
}

// Função que modifica a aceleração no ar
stock set_user_air_acceleration(id, Float:accel) {
    message_begin(MSG_ONE, get_user_msgid("CurWeapon"), {0, 0, 0}, id);
    write_coord(accel); // Define a nova aceleração
    message_end();
}

syms delta_s_desno delta_s_levo b teta0 delta_s

jacobian([(delta_s_desno+delta_s_levo)/2 * cos( teta0 + ( delta_s_desno - delta_s_levo )/( 2 * b ) );
                   ((delta_s_desno+delta_s_levo)/2) * sin( teta0 + (delta_s_desno - delta_s_levo)/( 2 * b ) );
                   (delta_s_desno - delta_s_levo)/b], [delta_s_desno, delta_s_levo])
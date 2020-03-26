Ns=27;

stator_radius_outer = 0.050;
slot_radius_outer = 0.045;
stator_radius_inner = 0.030;

wire_diameter = 0.000644;
fill_factor = 0.60;


wire_area = (pi*(wire_diameter^2));
slot_area = ((pi*(slot_radius_outer^2))-(pi*(stator_radius_inner^2)))/(2*Ns);
N_cond = (slot_area*fill_factor)/wire_area;
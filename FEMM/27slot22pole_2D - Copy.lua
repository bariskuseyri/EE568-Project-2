newdocument(0)			-- 0: magnetic problem
						-- 1: electrostatic problem
						-- 2: heat flow problem
						-- 3: current flow problem


-- Machine Parameters


Ns = 27			-- Number of slots
pp = 11			-- Number of pole-pairs
p = pp*2		-- Number of poles

I_rms = 5*10^-6 -- current density [A/mm2]
I_peak = 50		-- Peak excitation current

pi = 3.1415926535897932384626433		-- defining pi constant


stator_radius_outer = 0.050
slot_radius_outer = 0.045
stator_radius_inner = 0.030

wire_diameter = 0.000644
fill_factor = 0.60


wire_area = (pi*(wire_diameter^2))
slot_area = ((pi*(slot_radius_outer^2))-(pi*(stator_radius_inner^2)))/(2*Ns)
N_cond = (slot_area*fill_factor)/wire_area


-- Materials

mi_getmaterial('Air')
mi_getmaterial('22 AWG')
mi_getmaterial('N40')
mi_getmaterial('M-15 Steel')



-- Circuit Definitions
mi_addcircprop('A', I, 1)
mi_addcircprop('B', I, 1)
mi_addcircprop('C', I, 1)



-- stator outer boundary
mi_addnode(stator_radius_outer,0)
mi_addnode((-1)*stator_radius_outer,0)
mi_addarc(stator_radius_outer,0,(-1)*stator_radius_outer,0,180,1)
mi_addarc((-1)*stator_radius_outer,0,stator_radius_outer,0,180,1)



for n = 0, (2*Ns) do

	mi_addnode(slot_radius_outer*cos(n*(2*pi)/(2*Ns)),slot_radius_outer*sin(n*(2*pi)/(2*Ns)))
	mi_addnode(stator_radius_inner*cos(n*(2*pi)/(2*Ns)),stator_radius_inner*sin(n*(2*pi)/(2*Ns)))
	
end

for n = 0, (2*Ns) do

	mi_addnode(slot_radius_outer*cos(n*(2*pi)/(Ns)+((2*pi)/(2*2*Ns))),slot_radius_outer*sin(n*(2*pi)/(Ns)+((2*pi)/(2*2*Ns))))
	mi_addnode(stator_radius_inner*cos(n*(2*pi)/(Ns)+((2*pi)/(2*2*Ns))),stator_radius_inner*sin(n*(2*pi)/(Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 0, (2*Ns) do

	mi_addarc(slot_radius_outer*cos((2*n)*(2*pi)/(2*Ns)),slot_radius_outer*sin((2*n)*(2*pi)/(2*Ns)),slot_radius_outer*cos((2*n+1)*(2*pi)/(2*Ns)),slot_radius_outer*sin((2*n+1)*(2*pi)/(2*Ns)),(2*pi)/(2*Ns),1)
	mi_addarc(stator_radius_inner*cos(n*(2*pi)/(2*Ns)),stator_radius_inner*sin(n*(2*pi)/(2*Ns)),stator_radius_inner*cos((n+1)*(2*pi)/(2*Ns)),stator_radius_inner*sin((n+1)*(2*pi)/(2*Ns)),(2*pi)/(2*Ns),1)

end


for n = 0, (2*Ns) do

	mi_addsegment(slot_radius_outer*cos(n*(2*pi)/(2*Ns)),slot_radius_outer*sin(n*(2*pi)/(2*Ns)),stator_radius_inner*cos(n*(2*pi)/(2*Ns)),stator_radius_inner*sin(n*(2*pi)/(2*Ns)))

end

for n = 0, Ns do

	mi_addblocklabel(((slot_radius_outer+stator_radius_inner)/2)*cos((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))

end



A_pos={1, 6, 11, 18, 23}
A_neg={7, 12, 17, 22}

B_pos={2, 9, 14, 19, 24}
B_neg={3, 8, 13, 25}

C_pos={5, 10, 15, 20, 27}
C_neg={4, 16, 21, 26}


for n = 1, 5 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((A_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((A_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'A', 0, 0, N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((A_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((A_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 1, 4 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((A_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((A_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'A', 0, 0, (-1)*N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((A_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((A_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 1, 5 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((B_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((B_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'B', 0, 0, N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((B_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((B_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 1, 4 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((B_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((B_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'B', 0, 0, (-1)*N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((B_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((B_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 1, 5 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((C_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((C_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'C', 0, 0, N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((C_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((C_pos[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

for n = 1, 4 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((C_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((C_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'C', 0, 0, (-1)*N_cond)
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((C_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((C_neg[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

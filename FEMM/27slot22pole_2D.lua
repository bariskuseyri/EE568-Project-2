source_file = "../source/draft3.fem"


newdocument(0)			-- 0: magnetic problem
						-- 1: electrostatic problem
						-- 2: heat flow problem
						-- 3: current flow problem


pi = 3.1415926535897932384626433




stator_radius_outer = 0.050
slot_radius_outer = 0.045
stator_radius_inner = 0.030


-- stator outer boundary
mi_addnode(stator_radius_outer,0)
mi_addnode((-1)*stator_radius_outer,0)
mi_addarc(stator_radius_outer,0,(-1)*stator_radius_outer,0,180,1)
mi_addarc((-1)*stator_radius_outer,0,stator_radius_outer,0,180,1)

for n = 0,54,1 do

	mi_addnode(slot_radius_outer*cos(n*(2*pi)/54),slot_radius_outer*sin(n*(2*pi)/54))
	mi_addnode(stator_radius_inner*cos(n*(2*pi)/54),stator_radius_inner*sin(n*(2*pi)/54))
	
end


for n = 0,54,1 do
	mi_addarc(slot_radius_outer*cos(n*(2*pi)/54),slot_radius_outer*sin(n*(2*pi)/54),slot_radius_outer*cos((n+1)*(2*pi)/54),slot_radius_outer*sin((n+1)*(2*pi)/54),(2*pi)/54,1)
	mi_addarc(stator_radius_inner*cos(n*(2*pi)/54),stator_radius_inner*sin(n*(2*pi)/54),stator_radius_inner*cos((n+1)*(2*pi)/54),stator_radius_inner*sin((n+1)*(2*pi)/54),(2*pi)/54,1)
end




outfile = "../out/torques.txt"
fid=openfile(outfile,"w")
write(fid, "\nTorque and Flux Linkages of Each Phase Windage vs. Torque Angle\n\n")
write(fid, "\nAngle[deg]\tTorque[Nm]\t\tFlux A[Wb]\t\tFlux B[Wb]\t\tFlux C[Wb]\n")
closefile(fid)

rotor_group = 1				-- rotor element to be rotated
x_rotor = 0					-- x axis center of rotor
y_rotor = 0					-- y axis center of rotor

pole_pair = 11



open(source_file)			-- open orignal femm source
mi_saveas("../out/temp/temp.fem")	-- save temporay

for n = 0,30,15 do		-- do repeat

	open("../out/temp/temp.fem")	-- open temporary femm source
	

	mi_modifycircprop("A+",1,100*(cos(((3.14159265359/180)*n))))						-- current in circuit A+
	mi_modifycircprop("A-",1,-100*(cos(((3.14159265359/180)*n))))						-- current in circuit A-   
	mi_modifycircprop("B+",1,100*(cos(((3.14159265359/180)*n)+(3.14159265359*2)/3)))	-- current in circuit B+
	mi_modifycircprop("B-",1,-100*(cos(((3.14159265359/180)*n)+(3.14159265359*2)/3)))	-- current in circuit B-
	mi_modifycircprop("C+",1,100*(cos(((3.14159265359/180)*n)+(3.14159265359*4)/3)))		-- current in circuit C+   
	mi_modifycircprop("C-",1,-100*(cos(((3.14159265359/180)*n)+(3.14159265359*4)/3)))	-- current in circuit C-

	mi_seteditmode('group')
	mi_selectgroup(rotor_group)
	mi_moverotate(x_rotor, y_rotor, n/pole_pair)

    mi_analyse()			-- do analyse
    
    mi_loadsolution()		-- load analysis
    
    mo_seteditmode("area")
	mo_groupselectblock(rotor_group)
	Te = mo_blockintegral(22)

	v1, v2, phi_a = mo_getcircuitproperties("A+")
	v1, v2, phi_b = mo_getcircuitproperties("A-")
	v1, v2, phi_c = mo_getcircuitproperties("B+")
	v1, v2, phi_c = mo_getcircuitproperties("B-")
	v1, v2, phi_c = mo_getcircuitproperties("C+")
	v1, v2, phi_c = mo_getcircuitproperties("C-")

	fid=openfile(outfile,"a")
	write(fid, n, ",\t\t", Te, ",\t", phi_a, ",\t", phi_b, ",\t", phi_c,",\t", v1, ",\t", v1, ",\t", v1, "\n")
	closefile(fid)

	mo_close()			-- close analyse

end	-- do repeat

remove("../out/temp/temp.fem") -- delete temporary files
remove("../out/temp/temp.ans")

messagebox("!!! Your images are ready in folder out/images !!!")




for n = 1, (Ns/3) do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((B[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((B[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'B', 0, 0, N_cond)

end

for n = 1, (Ns/3) do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((C[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((C[n]*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	mi_setblockprop('22 AWG', 1, 0, 'C', 0, 0, N_cond)

end


for n = 0, 3 do

	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
	if n == 1  then
		mi_setblockprop('22 AWG', 1, 0, 'A', 0, 0, N_cond)
	elseif n == 2  then
		mi_setblockprop('22 AWG', 1, 0, 'B', 0, 0, N_cond)
	elseif n == 3 then
		mi_setblockprop('22 AWG', 1, 0, 'C', 0, 0, N_cond)
	else
		messagebox("!!! Your images are ready in folder out/images !!!")
	end
	
	mi_selectlabel(((slot_radius_outer+stator_radius_inner)/2)*cos((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))),((slot_radius_outer+stator_radius_inner)/2)*sin((n*(2*pi)/Ns)+((2*pi)/(2*2*Ns))))
	
end

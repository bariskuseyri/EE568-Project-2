' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 0) then 
  Set oDesign = oProject.GetDesign(oArgs(0))
else
  Set oDesign = oProject.GetActiveDesign()
end if
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2.5e+06)
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "14.268063670315271mm"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("M19_24G_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_24G_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", _
  0.15), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.36), Array(_
  "NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", _
  "X:=", 79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", _
  0.99), Array("NAME:Coordinate", "X:=", 318.3, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", _
  "X:=", 636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", _
  1.36), Array("NAME:Coordinate", "X:=", 1591.5, "Y:=", 1.44), Array(_
  "NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", _
  "X:=", 4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", _
  1.63), Array("NAME:Coordinate", "X:=", 7957.7, "Y:=", 1.67), Array(_
  "NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", _
  "X:=", 31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), _
  Array("NAME:Coordinate", "X:=", 190984, "Y:=", 2.1), Array(_
  "NAME:Coordinate", "X:=", 350138, "Y:=", 2.3), Array("NAME:Coordinate", _
  "X:=", 509292, "Y:=", 2.5), Array("NAME:Coordinate", "X:=", 2.10083e+06, _
  "Y:=", 4.5))), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", 164.2, _
  "core_loss_kc:=", 1.3, "core_loss_ke:=", 1.72, "conductivity:=", 1.96e+06, _
  "mass_density:=", 7650, Array("NAME:stacking_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Lamination"), "stacking_factor:=", "0.95", _
  Array("NAME:stacking_direction", "property_type:=", "ChoiceProperty", _
  "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("Arnold_Magnetics_N45_60C_3DSF1.000_N")) then
else
oDefinitionManager.AddMaterial Array(_
  "NAME:Arnold_Magnetics_N45_60C_3DSF1.000_N", "CoordinateSystemType:=", _
  "Cylindrical", Array("NAME:AttachedData"), Array("NAME:ModifierData"), _
  "permeability:=", "1", "conductivity:=", "555556", "mass_density:=", "7500", _
  Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-853002A_per_meter", "DirComp1:=", "1", "DirComp2:=", "0", _
  "DirComp3:=", "0"))
end if
if (oDefinitionManager.DoesMaterialExist("Arnold_Magnetics_N45_60C_3DSF1.000_S")) then
else
oDefinitionManager.AddMaterial Array(_
  "NAME:Arnold_Magnetics_N45_60C_3DSF1.000_S", "CoordinateSystemType:=", _
  "Cylindrical", Array("NAME:AttachedData"), Array("NAME:ModifierData"), _
  "permeability:=", "1", "conductivity:=", "555556", "mass_density:=", "7500", _
  Array("NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "-853002A_per_meter", "DirComp1:=", "-1", "DirComp2:=", "0", _
  "DirComp3:=", "0"))
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "24mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "128.5361273406305mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "128.5361273406305mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "100mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "60mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "27"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "12.5mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "4.6mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "6mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "128.5361273406305mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "M19_24G_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "60mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "27"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "12.5mm"), Array("NAME:Pair", "Name:=", "Bs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "4.6mm"), _
  Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "6mm"), Array("NAME:Pair", _
  "Name:=", "Rs", "Value:=", "3mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "128.5361273406305mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "StatorSlotInsu", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "StatorSlotInsu:CreateUserDefinedPart:1", "LenRegion", _
  "100mm + 2*endRegion"
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "78deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "26"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "1.9321673659196754ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "9.8946972288497003e-06H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "60mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "27"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "12.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "4.6mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "6mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "Layers", "Value:=", "2"), Array("NAME:Pair", "Name:=", "CoilPitch", _
  "Value:=", "1"), Array("NAME:Pair", "Name:=", "EndExt", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "SpanExt", "Value:=", "0.1mm"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "10deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "128.5361273406305mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "1"))), Array("NAME:Attributes", "Name:=", _
  "Coil", "Flags:=", "", "Color:=", "(250 167 14)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", _
  "13.333333333333334deg", "NumClones:=", "27"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
On Error Resume Next
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16" & _
  ",Coil_17,Coil_18,Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Coil_24" & _
  ",Coil_25,Coil_26"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Stator"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "24mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "22"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.89"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "128.5361273406305mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_24G_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/PMCore", "Version:=", "12.0", "NoOfParameters:=", 13, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "59mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "24mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "100mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "22"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Embrace", "Value:=", "0.89"), Array("NAME:Pair", "Name:=", _
  "ThickMag", "Value:=", "4mm"), Array("NAME:Pair", "Name:=", "WidthMag", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Offset", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Bridge", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "LenRegion", "Value:=", "128.5361273406305mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "2"))), Array("NAME:Attributes", "Name:=", "Mag", _
  "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_N", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag:CreateUserDefinedPart:1", _
  "LenRegion", "100mm + 2*endRegion"
On Error Goto 0
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", _
  "16.363636363636363deg", "NumClones:=", "22"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag_0"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_11"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_13"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_15"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_17"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_19"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag_21"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "Arnold_Magnetics_N45_60C_3DSF1.000_S"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion"), _
  Array("NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Shaft,Stator,Coil_0" & _
  ",Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7,Coil_8,Coil_9,Coil_10" & _
  ",Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16,Coil_17,Coil_18" & _
  ",Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Coil_24,Coil_25,Coil_26,Rotor" & _
  ",Mag_0,Mag_1,Mag_2,Mag_3,Mag_4,Mag_5,Mag_6,Mag_7,Mag_8,Mag_9,Mag_10" & _
  ",Mag_11,Mag_12,Mag_13,Mag_14,Mag_15,Mag_16,Mag_17,Mag_18,Mag_19,Mag_20" & _
  ",Mag_21", "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.05s", _
  "TimeStep:=", "5e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0005ms" 
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next

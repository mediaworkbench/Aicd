{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : {
			"major" : 8,
			"minor" : 5,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [
			34.0,
			85.0,
			1852.0,
			1049.0
		],
		"openrect" : [
			0.0,
			0.0,
			917.0,
			169.0
		],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial Bold",
		"gridonopen" : 1,
		"gridsize" : [
			8.0,
			8.0
		],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 500,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 917.0,
		"description" : "Generate acid bassline patterns.",
		"digest" : "",
		"tags" : "acid 303",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"color" : [
						0.541176,
						0.815686,
						0.913725,
						1.0
					],
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						538.0,
						56.0,
						57.0,
						20.0
					],
					"text" : "s ---preset"
				}
			},
			{
				"box" : {
					"annotation" : "Recalls preset number (MIDI mappable).",
					"annotation_name" : "Preset",
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						538.0,
						23.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						72.0,
						116.0,
						22.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Preset",
							"parameter_initial" : [
								1
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "presetNumbox",
							"parameter_mmax" : 28.0,
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "presetNumbox",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}
					},
					"varname" : "presetNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-102",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						472.5,
						751.0,
						43.0,
						20.0
					],
					"text" : "clipOut"
				}
			},
			{
				"box" : {
					"id" : "obj-106",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						626.75,
						751.0,
						31.0,
						20.0
					],
					"text" : "right"
				}
			},
			{
				"box" : {
					"id" : "obj-104",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						577.0,
						751.0,
						29.5,
						20.0
					],
					"text" : "left"
				}
			},
			{
				"box" : {
					"annotation" : "Rotates the pattern one step to the right.",
					"annotation_name" : "Rotate Right",
					"fontface" : 1,
					"id" : "obj-101",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						591.75,
						700.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						672.0,
						84.0,
						15.0,
						15.0
					],
					"rounded" : 15.0,
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Rotate Right",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "RotateRight",
							"parameter_mmax" : 1,
							"parameter_shortname" : "RotateRight",
							"parameter_type" : 2
						}
					},
					"text" : ">",
					"varname" : "RotateRight"
				}
			},
			{
				"box" : {
					"annotation" : "Rotates the pattern one step to the left.",
					"annotation_name" : "Rotate Left",
					"fontface" : 1,
					"id" : "obj-100",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						531.0,
						700.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						655.0,
						84.0,
						15.0,
						15.0
					],
					"rounded" : 15.0,
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Rotate Left",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "RotateLeft",
							"parameter_mmax" : 1,
							"parameter_shortname" : "RotateLeft",
							"parameter_type" : 2
						}
					},
					"text" : "<",
					"varname" : "RotateLeft"
				}
			},
			{
				"box" : {
					"annotation" : "Select display mode of pattern sequencer.",
					"annotation_name" : "Display Mode",
					"id" : "obj-98",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [
						"",
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						408.0,
						23.0,
						100.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						151.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Display Mode",
							"parameter_enum" : [
								"All",
								"Pitch",
								"Velocity",
								"Slide",
								"Gate"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "ModeMenu",
							"parameter_mmax" : 4,
							"parameter_shortname" : "ModeMenu",
							"parameter_type" : 2
						}
					},
					"varname" : "ModeMenu"
				}
			},
			{
				"box" : {
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						27.5,
						841.0,
						47.0,
						20.0
					],
					"text" : "midiout"
				}
			},
			{
				"box" : {
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"int"
					],
					"patching_rect" : [
						27.5,
						793.0,
						40.0,
						20.0
					],
					"text" : "midiin"
				}
			},
			{
				"box" : {
					"id" : "obj-86",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						353.75,
						394.0,
						65.0,
						20.0
					],
					"text" : "recallPreset"
				}
			},
			{
				"box" : {
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						181.5,
						692.5,
						29.5,
						20.0
					],
					"text" : "gate"
				}
			},
			{
				"box" : {
					"annotation" : "If disabled, the device generates no MIDI. The Out clip and manual clip generation will still work.",
					"annotation_name" : "Play",
					"automation" : "0",
					"automationon" : "1",
					"hint" : "Enable/disable MIDI output",
					"id" : "obj-96",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						125.0,
						657.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						22.5,
						116.0,
						15.0,
						15.0
					],
					"rounded" : 15.0,
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Play",
							"parameter_enum" : [
								"0",
								"1"
							],
							"parameter_initial" : [
								1
							],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "play",
							"parameter_mmax" : 1,
							"parameter_shortname" : "play",
							"parameter_type" : 2
						}
					},
					"text" : "",
					"texton" : "",
					"varname" : "play"
				}
			},
			{
				"box" : {
					"id" : "obj-95",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						976.75,
						675.5,
						59.199997,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						4.0,
						136.0,
						52.0,
						18.0
					],
					"text" : "Length",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Sets the pattern length.",
					"annotation_name" : "Length",
					"appearance" : 2,
					"hint" : "Set pattern length",
					"id" : "obj-94",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						225.0,
						31.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						4.0,
						151.0,
						52.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Length",
							"parameter_initial" : [
								16
							],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "lengthNumBox",
							"parameter_mmax" : 64.0,
							"parameter_mmin" : 1.0,
							"parameter_shortname" : "lengthNumBox",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}
					},
					"textjustification" : 0,
					"varname" : "lengthNumBox"
				}
			},
			{
				"box" : {
					"color" : [
						1.0,
						1.0,
						0.0,
						1.0
					],
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						995.25,
						394.0,
						35.0,
						20.0
					],
					"text" : "s ---js"
				}
			},
			{
				"box" : {
					"id" : "obj-92",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						938.0,
						285.0,
						40.0,
						20.0
					],
					"text" : "liveInit"
				}
			},
			{
				"box" : {
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [
						"bang",
						"int",
						"int"
					],
					"patching_rect" : [
						938.0,
						249.0,
						77.0,
						20.0
					],
					"text" : "live.thisdevice"
				}
			},
			{
				"box" : {
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [
						"",
						"",
						""
					],
					"patching_rect" : [
						1128.0,
						279.0,
						55.0,
						20.0
					],
					"text" : "clipSelect"
				}
			},
			{
				"box" : {
					"id" : "obj-84",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1022.0,
						250.0,
						37.0,
						20.0
					],
					"text" : "set $2"
				}
			},
			{
				"box" : {
					"id" : "obj-85",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1057.0,
						353.0,
						54.0,
						20.0
					],
					"text" : "setOut $2"
				}
			},
			{
				"box" : {
					"annotation" : "Sets output clip to selected clip.",
					"annotation_name" : "Out",
					"hint" : "Set output clip",
					"id" : "obj-87",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1022.0,
						287.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						68.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Out",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_invisible" : 2,
							"parameter_linknames" : 1,
							"parameter_longname" : "outputPath",
							"parameter_mmax" : 1,
							"parameter_shortname" : "outputPath",
							"parameter_type" : 2
						}
					},
					"text" : "Out",
					"texton" : "Out",
					"varname" : "outputPath"
				}
			},
			{
				"box" : {
					"id" : "obj-81",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1069.25,
						25.0,
						168.0,
						18.0
					],
					"text" : "https://github.com/mganss/Aicd"
				}
			},
			{
				"box" : {
					"annotation" : "Generates a new pattern. Same as the acid smiley face but MIDI mappable.",
					"annotation_name" : "Generate",
					"hint" : "Generate pattern",
					"id" : "obj-72",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						102.0,
						56.0,
						55.0,
						17.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						52.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Generate",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "generate",
							"parameter_mmax" : 1,
							"parameter_shortname" : "generate",
							"parameter_type" : 2
						}
					},
					"text" : "Generate",
					"varname" : "generate"
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						604.75,
						820.0,
						61.0,
						20.0
					],
					"text" : "s ---pattern"
				}
			},
			{
				"box" : {
					"id" : "obj-80",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						684.0,
						751.0,
						36.0,
						20.0
					],
					"text" : "dump"
				}
			},
			{
				"box" : {
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						401.75,
						700.0,
						100.0,
						20.0
					],
					"text" : "prepend dumpStep"
				}
			},
			{
				"box" : {
					"id" : "obj-79",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						531.0,
						751.0,
						29.5,
						20.0
					],
					"text" : "clip"
				}
			},
			{
				"box" : {
					"annotation" : "Creates a new clip with the current pattern.",
					"annotation_name" : "Clip",
					"hint" : "Create clip",
					"id" : "obj-68",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						653.0,
						699.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						36.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Clip",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "clip",
							"parameter_mmax" : 1,
							"parameter_shortname" : "clip",
							"parameter_type" : 2
						}
					},
					"text" : "Clip",
					"varname" : "clip"
				}
			},
			{
				"box" : {
					"color" : [
						1.0,
						1.0,
						0.0,
						1.0
					],
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						146.800003,
						170.0,
						33.0,
						20.0
					],
					"text" : "r ---js"
				}
			},
			{
				"box" : {
					"color" : [
						1.0,
						1.0,
						0.0,
						1.0
					],
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						361.25,
						820.0,
						35.0,
						20.0
					],
					"text" : "s ---js"
				}
			},
			{
				"box" : {
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						261.25,
						732.5,
						102.0,
						20.0
					],
					"text" : "prepend setFixGate"
				}
			},
			{
				"box" : {
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"bang",
						"bang"
					],
					"patching_rect" : [
						164.800003,
						110.0,
						51.0,
						20.0
					],
					"text" : "TogEdge"
				}
			},
			{
				"box" : {
					"color" : [
						0.113725,
						0.580392,
						0.737255,
						1.0
					],
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						848.5,
						268.0,
						46.0,
						20.0
					],
					"text" : "r ---loop"
				}
			},
			{
				"box" : {
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"int",
						"int"
					],
					"patching_rect" : [
						848.5,
						304.0,
						44.0,
						20.0
					],
					"text" : "unpack"
				}
			},
			{
				"box" : {
					"color" : [
						0.113725,
						0.580392,
						0.737255,
						1.0
					],
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						315.25,
						700.0,
						48.0,
						20.0
					],
					"text" : "s ---loop"
				}
			},
			{
				"box" : {
					"color" : [
						0.541176,
						0.815686,
						0.913725,
						1.0
					],
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						79.0,
						304.0,
						55.0,
						20.0
					],
					"text" : "r ---preset"
				}
			},
			{
				"box" : {
					"color" : [
						0.541176,
						0.815686,
						0.913725,
						1.0
					],
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1054.75,
						675.5,
						57.0,
						20.0
					],
					"text" : "s ---preset"
				}
			},
			{
				"box" : {
					"id" : "obj-74",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1290.25,
						606.0,
						98.0,
						20.0
					],
					"text" : "active1 $2 $3 $4 $5"
				}
			},
			{
				"box" : {
					"id" : "obj-71",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1179.25,
						606.0,
						100.0,
						20.0
					],
					"text" : "stored1 $2 $3 $4 $5"
				}
			},
			{
				"box" : {
					"id" : "obj-69",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1054.75,
						606.0,
						118.0,
						20.0
					],
					"text" : "emptycolor $2 $3 $4 $5"
				}
			},
			{
				"box" : {
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"bang"
					],
					"patching_rect" : [
						1290.25,
						563.0,
						58.0,
						20.0
					],
					"text" : "live.colors"
				}
			},
			{
				"box" : {
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"bang"
					],
					"patching_rect" : [
						1179.25,
						563.0,
						58.0,
						20.0
					],
					"text" : "live.colors"
				}
			},
			{
				"box" : {
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"bang"
					],
					"patching_rect" : [
						1054.75,
						563.0,
						58.0,
						20.0
					],
					"text" : "live.colors"
				}
			},
			{
				"box" : {
					"id" : "obj-63",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1290.25,
						520.0,
						55.0,
						20.0
					],
					"text" : "value_bar"
				}
			},
			{
				"box" : {
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1179.25,
						520.0,
						84.0,
						20.0
					],
					"text" : "control_text_bg"
				}
			},
			{
				"box" : {
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1054.75,
						520.0,
						60.0,
						20.0
					],
					"text" : "control_bg"
				}
			},
			{
				"box" : {
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"patching_rect" : [
						887.75,
						482.0,
						53.0,
						20.0
					],
					"text" : "loadbang"
				}
			},
			{
				"box" : {
					"id" : "obj-56",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						887.75,
						520.0,
						57.0,
						20.0
					],
					"text" : "control_fg"
				}
			},
			{
				"box" : {
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						887.75,
						606.0,
						106.0,
						20.0
					],
					"text" : "textcolor $2 $3 $4 $5"
				}
			},
			{
				"box" : {
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"bang"
					],
					"patching_rect" : [
						887.75,
						563.0,
						58.0,
						20.0
					],
					"text" : "live.colors"
				}
			},
			{
				"box" : {
					"id" : "obj-48",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						859.0,
						154.0,
						35.0,
						20.0
					],
					"text" : "fold 0"
				}
			},
			{
				"box" : {
					"id" : "obj-47",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"parameter_enable" : 0,
					"patching_rect" : [
						752.0,
						76.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box" : {
					"color" : [
						0.702269,
						0.811747,
						0.303388,
						1.0
					],
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						296.0,
						80.0,
						75.0,
						20.0
					],
					"text" : "s ---generated"
				}
			},
			{
				"box" : {
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"patching_rect" : [
						296.0,
						48.0,
						22.0,
						20.0
					],
					"text" : "t b"
				}
			},
			{
				"box" : {
					"id" : "obj-50",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"bang"
					],
					"parameter_enable" : 0,
					"patching_rect" : [
						733.5,
						415.5,
						50.0,
						20.0
					]
				}
			},
			{
				"box" : {
					"annotation" : "Generate a new pattern. Use the button on the right side for MIDI mapping.",
					"id" : "obj-39",
					"maxclass" : "pictctrl",
					"name" : "acid.png",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"int"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						164.800003,
						31.0,
						36.0,
						36.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						12.0,
						22.0,
						36.0,
						36.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_invisible" : 2,
							"parameter_longname" : "Generate",
							"parameter_mmax" : 1.0,
							"parameter_shortname" : "Generate",
							"parameter_type" : 0
						}
					},
					"varname" : "Generate"
				}
			},
			{
				"box" : {
					"id" : "obj-43",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						896.0,
						71.0,
						41.5,
						20.0
					],
					"text" : "0"
				}
			},
			{
				"box" : {
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [
						"bang",
						""
					],
					"patching_rect" : [
						943.0,
						115.0,
						45.0,
						20.0
					],
					"text" : "select 1"
				}
			},
			{
				"box" : {
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"patching_rect" : [
						111.0,
						394.0,
						22.0,
						20.0
					],
					"text" : "t b"
				}
			},
			{
				"box" : {
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						27.5,
						304.0,
						43.0,
						20.0
					],
					"text" : "clearall"
				}
			},
			{
				"box" : {
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						775.75,
						675.5,
						59.199997,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						57.0,
						4.0,
						52.0,
						18.0
					],
					"text" : "Presets",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [
						"",
						"",
						"",
						""
					],
					"patching_rect" : [
						27.5,
						484.0,
						52.0,
						20.0
					],
					"restore" : {
						"patternStep" : [
							1,
							6,
							5,
							1,
							12,
							0,
							6,
							24.0,
							66.0,
							0,
							1,
							24,
							127,
							4,
							0,
							1,
							36,
							127,
							4,
							0,
							1,
							39,
							127,
							4,
							1,
							0,
							43,
							127,
							4,
							0,
							1,
							39,
							99,
							4,
							0,
							1,
							51,
							127,
							4,
							1,
							1,
							24,
							36,
							39,
							43,
							51
						]
					},
					"text" : "autopattr",
					"varname" : "u135001325"
				}
			},
			{
				"box" : {
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						27.5,
						527.0,
						137.0,
						20.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_initial" : [
								{
									"pattrstorage" : {
										"name" : "presetStorage",
										"slots" : {}
									}
								}
							],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_longname" : "presetStorage",
							"parameter_shortname" : "presetStorage",
							"parameter_type" : 3
						}
					},
					"saved_object_attributes" : {
						"client_rect" : [
							445,
							536,
							1224,
							1091
						],
						"parameter_enable" : 1,
						"parameter_mappable" : 0,
						"paraminitmode" : 1,
						"storage_rect" : [
							583,
							69,
							1034,
							197
						]
					},
					"text" : "pattrstorage presetStorage",
					"varname" : "presetStorage"
				}
			},
			{
				"box" : {
					"active1" : [
						0.333333333333333,
						0.870588235294118,
						0.964705882352941,
						1.0
					],
					"annotation" : "Save presets. Shift+click to save, click to restore.",
					"bgcolor" : [
						1.0,
						1.0,
						1.0,
						0.0
					],
					"embed" : 0,
					"emptycolor" : [
						0.717647058823529,
						0.717647058823529,
						0.717647058823529,
						1.0
					],
					"id" : "obj-18",
					"maxclass" : "preset",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [
						"preset",
						"int",
						"preset",
						"int",
						""
					],
					"patching_rect" : [
						27.5,
						341.0,
						100.0,
						40.0
					],
					"pattrstorage" : "presetStorage",
					"presentation" : 1,
					"presentation_rect" : [
						57.0,
						22.0,
						52.0,
						88.0
					],
					"stored1" : [
						0.862745098039216,
						0.862745098039216,
						0.862745098039216,
						1.0
					],
					"style" : "default",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"varname" : "Presets"
				}
			},
			{
				"box" : {
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						353.75,
						279.0,
						50.0,
						20.0
					],
					"text" : "deferlow"
				}
			},
			{
				"box" : {
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						353.75,
						345.0,
						82.0,
						20.0
					],
					"text" : "setInitialized $1"
				}
			},
			{
				"box" : {
					"bubble" : 1,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						398.5,
						309.0,
						99.0,
						22.0
					],
					"text" : "Initialized state"
				}
			},
			{
				"box" : {
					"id" : "obj-7",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						353.75,
						312.5,
						44.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_enum" : [
								"0",
								"1"
							],
							"parameter_initial" : [
								0
							],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "initialized",
							"parameter_mmax" : 1,
							"parameter_shortname" : "initialized",
							"parameter_type" : 2,
							"parameter_unitstyle" : 9
						}
					},
					"varname" : "initialized"
				}
			},
			{
				"box" : {
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						631.0,
						366.0,
						202.0,
						20.0
					],
					"text" : "expr (abs($i1) / 120.0) % ($i3 - $i2 + 1) + 1"
				}
			},
			{
				"box" : {
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 9,
					"outlettype" : [
						"int",
						"int",
						"float",
						"float",
						"float",
						"",
						"int",
						"float",
						""
					],
					"patching_rect" : [
						620.5,
						320.799988,
						103.0,
						20.0
					],
					"text" : "transport"
				}
			},
			{
				"box" : {
					"annotation" : "Open gate for all steps.",
					"annotation_name" : "Fix gate",
					"automation" : "0",
					"automationon" : "1",
					"id" : "obj-51",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						232.0,
						692.5,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						101.0,
						52.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Fix gate",
							"parameter_enum" : [
								"0",
								"1"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Fix gate",
							"parameter_mmax" : 1,
							"parameter_shortname" : "Gate",
							"parameter_type" : 2
						}
					},
					"text" : "Fix Gate",
					"texton" : "Fix Gate",
					"varname" : "gateText"
				}
			},
			{
				"box" : {
					"id" : "obj-46",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						943.0,
						154.0,
						50.0,
						20.0
					],
					"text" : "zoom_fit"
				}
			},
			{
				"box" : {
					"annotation" : "Zoom to fit.",
					"annotation_name" : "Zoom",
					"automation" : "0",
					"automationon" : "1",
					"id" : "obj-44",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						943.0,
						25.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						20.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Zoom",
							"parameter_enum" : [
								"0",
								"1"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Zoom",
							"parameter_mmax" : 1,
							"parameter_shortname" : "Zoom",
							"parameter_type" : 2
						}
					},
					"text" : "Zoom",
					"texton" : "Zoom",
					"varname" : "zoomText"
				}
			},
			{
				"box" : {
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						776.0,
						154.0,
						67.0,
						20.0
					],
					"text" : "fold 0, fold 1"
				}
			},
			{
				"box" : {
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [
						"bang",
						""
					],
					"patching_rect" : [
						814.0,
						115.0,
						45.0,
						20.0
					],
					"text" : "select 1"
				}
			},
			{
				"box" : {
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						814.0,
						71.0,
						50.0,
						20.0
					],
					"text" : "1"
				}
			},
			{
				"box" : {
					"color" : [
						0.702269,
						0.811747,
						0.303388,
						1.0
					],
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						814.0,
						25.0,
						73.0,
						20.0
					],
					"text" : "r ---generated"
				}
			},
			{
				"box" : {
					"color" : [
						0.702269,
						0.811747,
						0.303388,
						1.0
					],
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						184.0,
						366.0,
						75.0,
						20.0
					],
					"text" : "s ---generated"
				}
			},
			{
				"box" : {
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						848.5,
						675.5,
						59.199997,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						4.0,
						4.0,
						52.0,
						18.0
					],
					"text" : "Generate",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						814.0,
						221.799988,
						61.0,
						20.0
					],
					"text" : "s ---pattern"
				}
			},
			{
				"box" : {
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						704.0,
						154.0,
						41.0,
						20.0
					],
					"text" : "fold $1"
				}
			},
			{
				"box" : {
					"annotation" : "Hide all rows that do not contain notes.",
					"annotation_name" : "Fold",
					"automation" : "0",
					"automationon" : "1",
					"id" : "obj-21",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						704.0,
						25.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						4.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Fold",
							"parameter_enum" : [
								"0",
								"1"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Fold",
							"parameter_mmax" : 1,
							"parameter_shortname" : "Fold",
							"parameter_type" : 2
						}
					},
					"text" : "Fold",
					"texton" : "Fold",
					"varname" : "foldText"
				}
			},
			{
				"box" : {
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						"int"
					],
					"patching_rect" : [
						408.0,
						56.0,
						29.5,
						20.0
					],
					"text" : "+"
				}
			},
			{
				"box" : {
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						"int"
					],
					"patching_rect" : [
						456.0,
						56.0,
						29.5,
						20.0
					],
					"text" : "> 2"
				}
			},
			{
				"box" : {
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						408.0,
						96.0,
						50.0,
						20.0
					],
					"text" : "mode $1"
				}
			},
			{
				"box" : {
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patcher" : {
						"fileversion" : 1,
						"appversion" : {
							"major" : 8,
							"minor" : 5,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						},
						"classnamespace" : "box",
						"rect" : [
							718.0,
							251.0,
							663.0,
							557.0
						],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [
							15.0,
							15.0
						],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [
							{
								"box" : {
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [
										"int"
									],
									"patching_rect" : [
										315.0,
										139.0,
										29.5,
										22.0
									],
									"text" : "||"
								}
							},
							{
								"box" : {
									"comment" : "1 if gate is fixed, 0 otherwise",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										357.0,
										30.0,
										25.0,
										25.0
									]
								}
							},
							{
								"box" : {
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 9,
									"outlettype" : [
										"int",
										"int",
										"int",
										"int",
										"int",
										"int",
										"int",
										"int",
										"int"
									],
									"patching_rect" : [
										75.0,
										354.0,
										103.0,
										22.0
									],
									"text" : "borax"
								}
							},
							{
								"box" : {
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										261.0,
										209.0,
										148.0,
										22.0
									],
									"text" : "if $i1 > 0 then 180 else 60"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										323.0,
										114.0,
										155.0,
										21.0
									],
									"text" : "Gate"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										272.0,
										114.0,
										49.0,
										36.0
									],
									"text" : "Slide\n"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-19",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										218.0,
										114.0,
										33.0,
										21.0
									],
									"text" : "Dur."
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-18",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										164.0,
										114.0,
										31.0,
										21.0
									],
									"text" : "Vel."
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-17",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										110.0,
										114.0,
										37.0,
										21.0
									],
									"text" : "Pitch"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 0,
									"patching_rect" : [
										106.5,
										406.0,
										53.0,
										23.0
									],
									"text" : "noteout"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"format" : 6,
									"id" : "obj-8",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [
										"",
										"bang"
									],
									"parameter_enable" : 0,
									"patching_rect" : [
										207.0,
										134.0,
										50.0,
										23.0
									]
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-7",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [
										"",
										"bang"
									],
									"parameter_enable" : 0,
									"patching_rect" : [
										153.0,
										134.0,
										50.0,
										23.0
									]
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-6",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [
										"",
										"bang"
									],
									"parameter_enable" : 0,
									"patching_rect" : [
										99.0,
										134.0,
										50.0,
										23.0
									]
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [
										56.0,
										114.0,
										35.0,
										21.0
									],
									"text" : "Step"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										261.0,
										246.0,
										54.0,
										23.0
									],
									"text" : "$1 ticks"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										75.0,
										255.0,
										42.5,
										23.0
									],
									"text" : "gate"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-34",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [
										"",
										"bang"
									],
									"parameter_enable" : 0,
									"patching_rect" : [
										45.0,
										134.0,
										50.0,
										23.0
									]
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [
										"float",
										"float"
									],
									"patching_rect" : [
										75.0,
										295.0,
										215.0,
										23.0
									],
									"text" : "makenote 100 120 @repeatmode 2"
								}
							},
							{
								"box" : {
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 6,
									"outlettype" : [
										"int",
										"int",
										"int",
										"float",
										"int",
										"int"
									],
									"patching_rect" : [
										45.0,
										94.0,
										289.0,
										23.0
									],
									"text" : "unpack 0 0 0 0. 0 0"
								}
							},
							{
								"box" : {
									"comment" : "Step values",
									"id" : "obj-46",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										45.0,
										30.0,
										25.0,
										25.0
									]
								}
							},
							{
								"box" : {
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										99.0,
										175.0,
										110.0,
										22.0
									],
									"text" : "prepend mapPitch"
								}
							},
							{
								"box" : {
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"outlettype" : [],
									"patching_rect" : [
										99.0,
										205.0,
										50.0,
										22.0
									],
									"text" : "s ---js"
								}
							},
							{
								"box" : {
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [
										""
									],
									"patching_rect" : [
										200.0,
										205.0,
										80.0,
										22.0
									],
									"text" : "r ---mapped"
								}
							}
						],
						"lines" : [
							{
								"patchline" : {
									"destination" : [
										"obj-2",
										1
									],
									"source" : [
										"obj-1",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-5",
										0
									],
									"source" : [
										"obj-15",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-35",
										0
									],
									"source" : [
										"obj-2",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-16",
										1
									],
									"source" : [
										"obj-22",
										4
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-16",
										0
									],
									"source" : [
										"obj-22",
										3
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-15",
										0
									],
									"source" : [
										"obj-27",
										4
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-2",
										0
									],
									"source" : [
										"obj-27",
										5
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-34",
										0
									],
									"source" : [
										"obj-27",
										0
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-6",
										0
									],
									"source" : [
										"obj-27",
										1
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-7",
										0
									],
									"source" : [
										"obj-27",
										2
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-8",
										0
									],
									"source" : [
										"obj-27",
										3
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-22",
										1
									],
									"midpoints" : [
										280.5,
										326.0,
										126.5,
										326.0
									],
									"source" : [
										"obj-33",
										1
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-22",
										0
									],
									"source" : [
										"obj-33",
										0
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-33",
										0
									],
									"source" : [
										"obj-35",
										0
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-27",
										0
									],
									"source" : [
										"obj-46",
										0
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-33",
										2
									],
									"source" : [
										"obj-5",
										0
									]
								}
							},
							{
								"patchline" : {
									"color" : [
										0.501961,
										0.501961,
										0.501961,
										0.901961
									],
									"destination" : [
										"obj-33",
										1
									],
									"source" : [
										"obj-7",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-47",
										0
									],
									"source" : [
										"obj-6",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-48",
										0
									],
									"source" : [
										"obj-47",
										0
									]
								}
							},
							{
								"patchline" : {
									"destination" : [
										"obj-35",
										1
									],
									"source" : [
										"obj-49",
										0
									]
								}
							}
						],
						"saved_attribute_attributes" : {
							"default_plcolor" : {
								"expression" : ""
							}
						}
					},
					"patching_rect" : [
						192.0,
						732.5,
						59.0,
						20.0
					],
					"saved_attribute_attributes" : {
						"default_plcolor" : {
							"expression" : ""
						}
					},
					"saved_object_attributes" : {
						"description" : "",
						"digest" : "",
						"editing_bgcolor" : [
							0.56078431372549,
							0.56078431372549,
							0.56078431372549,
							1.0
						],
						"globalpatchername" : "",
						"locked_bgcolor" : [
							0.56078431372549,
							0.56078431372549,
							0.56078431372549,
							1.0
						],
						"tags" : ""
					},
					"text" : "p playMIDI"
				}
			},
			{
				"box" : {
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						225.0,
						145.0,
						52.0,
						20.0
					],
					"text" : "loop 1 $1"
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						631.0,
						415.5,
						61.0,
						20.0
					],
					"text" : "s ---pattern"
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						257.0,
						185.0,
						61.0,
						20.0
					],
					"text" : "s ---pattern"
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						219.0,
						432.0,
						59.0,
						20.0
					],
					"text" : "r ---pattern"
				}
			},
			{
				"box" : {
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						290.0,
						145.0,
						49.0,
						20.0
					],
					"text" : "nstep $1"
				}
			},
			{
				"box" : {
					"annotation" : "Pattern sequencer. Shows the generated pattern. Values in the background are velocity, slide, and gate.",
					"annotation_name" : "Pattern",
					"bgcolor" : [
						1.0,
						1.0,
						1.0,
						0.203922
					],
					"bgcolor2" : [
						1.0,
						1.0,
						1.0,
						0.101961
					],
					"bgrulercolor" : [
						0.647059,
						0.647059,
						0.647059,
						0.0
					],
					"extra1_max" : 1,
					"extra2_max" : 1,
					"fontface" : 0,
					"fontname" : "Ableton Sans",
					"fontsize" : 9.5,
					"hbgcolor" : [
						1.0,
						0.301961,
						0.301961,
						0.2
					],
					"id" : "obj-90",
					"loopbordercolor" : [
						0.0,
						0.0,
						0.0,
						0.49
					],
					"maxclass" : "live.step",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [
						"",
						"",
						"",
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						192.0,
						503.5,
						512.0,
						169.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						115.0,
						0.0,
						520.0,
						170.0
					],
					"saved_attribute_attributes" : {
						"bgrulercolor" : {
							"expression" : ""
						},
						"valueof" : {
							"parameter_annotation_name" : "Pattern",
							"parameter_invisible" : 1,
							"parameter_longname" : "Pattern",
							"parameter_shortname" : "Pattern",
							"parameter_type" : 3
						}
					},
					"stepcolor" : [
						0.180392,
						0.631373,
						1.0,
						1.0
					],
					"stepcolor2" : [
						1.0,
						0.74902,
						0.231373,
						1.0
					],
					"varname" : "patternStep",
					"whitekeycolor" : [
						0.960784,
						0.960784,
						0.960784,
						1.0
					]
				}
			},
			{
				"box" : {
					"id" : "obj-83",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"parameter_enable" : 0,
					"patching_rect" : [
						558.0,
						320.799988,
						24.0,
						24.0
					]
				}
			},
			{
				"box" : {
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						"bang"
					],
					"patching_rect" : [
						558.0,
						273.799988,
						227.0,
						20.0
					],
					"text" : "metro @interval 16n @quantize 16n @active 1"
				}
			},
			{
				"box" : {
					"id" : "obj-77",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						336.0,
						235.799988,
						75.0,
						20.0
					],
					"text" : "setVelocity $1"
				}
			},
			{
				"box" : {
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						921.75,
						675.5,
						46.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						55.0,
						136.0,
						56.0,
						18.0
					],
					"text" : "Velocity",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Velocity of unaccented steps.",
					"annotation_name" : "Velocity",
					"appearance" : 2,
					"id" : "obj-57",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						336.0,
						23.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						57.0,
						151.0,
						52.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Velocity",
							"parameter_initial" : [
								99
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Default velocity",
							"parameter_shortname" : "Velocity",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0
						}
					},
					"textjustification" : 0,
					"varname" : "velocityNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						192.0,
						235.799988,
						105.0,
						20.0
					],
					"text" : "setPatternLength $1"
				}
			},
			{
				"box" : {
					"annotation" : "Higher values result in more random patterns.",
					"annotation_name" : "Temperature",
					"id" : "obj-28",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						48.0,
						25.0,
						41.0,
						48.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						10.0,
						66.0,
						41.0,
						48.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Temperature",
							"parameter_initial" : [
								1.0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Temperature",
							"parameter_mmax" : 5.0,
							"parameter_mmin" : 0.3,
							"parameter_shortname" : "Temp",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1
						}
					},
					"varname" : "temperatureDial"
				}
			},
			{
				"box" : {
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						48.0,
						235.799988,
						97.0,
						20.0
					],
					"text" : "setTemperature $1"
				}
			},
			{
				"box" : {
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [
						"",
						"",
						"",
						"",
						""
					],
					"patching_rect" : [
						146.800003,
						304.0,
						54.199997,
						20.0
					],
					"saved_object_attributes" : {
						"filename" : "acid.js",
						"parameter_enable" : 0
					},
					"text" : "js",
					"varname" : "js"
				}
			},
			{
				"box" : {
					"fontname" : "Ableton Sans Medium Regular",
					"fontsize" : 11.0,
					"hidden" : 1,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						0.0,
						170.0,
						133.0,
						20.0
					],
					"text" : "Device vertical limit"
				}
			},
			{
				"box" : {
					"annotation" : "Transposes the clip and the playback by semitones.",
					"annotation_name" : "Transpose",
					"appearance" : 2,
					"id" : "obj-107",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						560.0,
						23.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						134.0,
						56.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Transpose",
							"parameter_initial" : [
								0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Transpose",
							"parameter_shortname" : "Transpose",
							"parameter_type" : 1,
							"parameter_unitstyle" : 7,
							"parameter_mmin" : -24,
							"parameter_mmax" : 24
						}
					},
					"textjustification" : 0,
					"varname" : "transposeNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-108",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						560.0,
						5.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						643.0,
						118.0,
						56.0,
						18.0
					],
					"text" : "Transpose",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-109",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						560.0,
						235.8,
						87.0,
						20.0
					],
					"text" : "setTranspose $1"
				}
			},
			{
				"box" : {
					"annotation" : "Replaces some steps of the pattern with new ones. How many is set by Amount.",
					"annotation_name" : "Mutate",
					"hint" : "Mutate pattern",
					"id" : "obj-111",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1150.0,
						25.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						22.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Mutate",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "mutate",
							"parameter_mmax" : 1,
							"parameter_shortname" : "mutate",
							"parameter_type" : 2
						}
					},
					"text" : "Mutate",
					"varname" : "mutate"
				}
			},
			{
				"box" : {
					"id" : "obj-112",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1150.0,
						75.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						44.0,
						64.0,
						18.0
					],
					"text" : "Amount",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Percentage of steps that Mutate replaces.",
					"annotation_name" : "Mutate amount",
					"appearance" : 2,
					"id" : "obj-113",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1150.0,
						100.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						60.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Mutate amount",
							"parameter_initial" : [
								25
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Mutate amount",
							"parameter_shortname" : "Amount",
							"parameter_type" : 1,
							"parameter_unitstyle" : 5,
							"parameter_mmin" : 0,
							"parameter_mmax" : 100
						}
					},
					"textjustification" : 0,
					"varname" : "mutateAmountNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-114",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1150.0,
						50.0,
						44.0,
						20.0
					],
					"text" : "mutate"
				}
			},
			{
				"box" : {
					"id" : "obj-115",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1150.0,
						125.0,
						115.0,
						20.0
					],
					"text" : "setMutateAmount $1"
				}
			},
			{
				"box" : {
					"color" : [
						0.941176,
						0.690196,
						0.196078,
						1.0
					],
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						146.8,
						350.0,
						70.0,
						20.0
					],
					"text" : "s ---mapped"
				}
			},
			{
				"box" : {
					"annotation" : "Root note of the scale.",
					"annotation_name" : "Scale root",
					"id" : "obj-117",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [
						"",
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1300.0,
						25.0,
						100.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						96.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Scale root",
							"parameter_enum" : [
								"C",
								"C#",
								"D",
								"D#",
								"E",
								"F",
								"F#",
								"G",
								"G#",
								"A",
								"A#",
								"B"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Scale root",
							"parameter_mmax" : 11,
							"parameter_shortname" : "Root",
							"parameter_type" : 2
						}
					},
					"varname" : "rootMenu"
				}
			},
			{
				"box" : {
					"annotation" : "Moves the notes of the clip and the playback into the scale. Off leaves them as they are.",
					"annotation_name" : "Scale",
					"id" : "obj-118",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [
						"",
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1300.0,
						50.0,
						100.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						130.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Scale",
							"parameter_enum" : [
								"Off",
								"Major",
								"Minor",
								"Dorian",
								"Phrygian",
								"Lydian",
								"Mixolyd.",
								"Locrian",
								"Harm Min",
								"Min Pent",
								"Maj Pent",
								"Blues",
								"Phryg Dom"
							],
							"parameter_initial" : [
								0.0
							],
							"parameter_initial_enable" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "Scale",
							"parameter_mmax" : 12,
							"parameter_shortname" : "Scale",
							"parameter_type" : 2
						}
					},
					"varname" : "scaleMenu"
				}
			},
			{
				"box" : {
					"id" : "obj-119",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1300.0,
						180.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						80.0,
						64.0,
						18.0
					],
					"text" : "Root",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-120",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1300.0,
						214.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						705.0,
						114.0,
						64.0,
						18.0
					],
					"text" : "Scale",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-121",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1300.0,
						150.0,
						80.0,
						20.0
					],
					"text" : "setRoot $1"
				}
			},
			{
				"box" : {
					"id" : "obj-122",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1400.0,
						150.0,
						80.0,
						20.0
					],
					"text" : "setScale $1"
				}
			},
			{
				"box" : {
					"id" : "obj-123",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1500.0,
						104.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						4.0,
						64.0,
						18.0
					],
					"text" : "Seed",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "0 = a new random seed for every pattern. Any other number gives the same pattern every time.",
					"annotation_name" : "Seed",
					"appearance" : 2,
					"id" : "obj-124",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1500.0,
						125.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						20.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Seed",
							"parameter_initial" : [
								0
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Seed",
							"parameter_shortname" : "Seed",
							"parameter_type" : 1,
							"parameter_unitstyle" : 0,
							"parameter_mmin" : 0,
							"parameter_mmax" : 999999
						}
					},
					"textjustification" : 0,
					"varname" : "seedNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-125",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1500.0,
						150.0,
						120.0,
						20.0
					],
					"text" : "setSeed $1"
				}
			},
			{
				"box" : {
					"id" : "obj-128",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1500.0,
						156.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						56.0,
						64.0,
						18.0
					],
					"text" : "Last seed",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"id" : "obj-130",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1500.0,
						196.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						96.0,
						64.0,
						18.0
					],
					"text" : "History",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Brings back the pattern before the last Generate, Mutate or scale change.",
					"annotation_name" : "Undo",
					"hint" : "Brings back the pattern before the last Generate, Mutate or scale change.",
					"id" : "obj-131",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1600.0,
						200.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						112.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Undo",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "historyUndo",
							"parameter_mmax" : 1,
							"parameter_shortname" : "historyUndo",
							"parameter_type" : 2
						}
					},
					"text" : "Undo",
					"varname" : "historyUndo"
				}
			},
			{
				"box" : {
					"annotation" : "Undoes an Undo.",
					"annotation_name" : "Redo",
					"hint" : "Undoes an Undo.",
					"id" : "obj-132",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						""
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1650.0,
						200.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						128.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Redo",
							"parameter_enum" : [
								"val1",
								"val2"
							],
							"parameter_linknames" : 1,
							"parameter_longname" : "historyRedo",
							"parameter_mmax" : 1,
							"parameter_shortname" : "historyRedo",
							"parameter_type" : 2
						}
					},
					"text" : "Redo",
					"varname" : "historyRedo"
				}
			},
			{
				"box" : {
					"id" : "obj-133",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1600.0,
						225.0,
						120.0,
						20.0
					],
					"text" : "historyBack"
				}
			},
			{
				"box" : {
					"id" : "obj-134",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1650.0,
						250.0,
						120.0,
						20.0
					],
					"text" : "historyForward"
				}
			},
			{
				"box" : {
					"id" : "obj-129",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1500.0,
						250.0,
						64.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						777.0,
						72.0,
						64.0,
						18.0
					],
					"text" : "0",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1,
					"varname" : "lastSeedText"
				}
			},
			{
				"box" : {
					"id" : "obj-135",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1700.0,
						104.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						4.0,
						64.0,
						18.0
					],
					"text" : "Rests",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Percentage of the steps that are rests. 0 = no rests, 100 = all rests (silence).",
					"annotation_name" : "Rests",
					"appearance" : 2,
					"id" : "obj-136",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1700.0,
						134.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						20.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Rests",
							"parameter_initial" : [
								10
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Rests",
							"parameter_shortname" : "Rests",
							"parameter_type" : 1,
							"parameter_unitstyle" : 5,
							"parameter_mmin" : 0,
							"parameter_mmax" : 100
						}
					},
					"textjustification" : 0,
					"varname" : "restsNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-137",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1700.0,
						330.0,
						110.0,
						20.0
					],
					"text" : "setRests $1"
				}
			},
			{
				"box" : {
					"id" : "obj-138",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1700.0,
						156.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						56.0,
						64.0,
						18.0
					],
					"text" : "Slides",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Percentage of the notes that slide.",
					"annotation_name" : "Slides",
					"appearance" : 2,
					"id" : "obj-139",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1700.0,
						186.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						72.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Slides",
							"parameter_initial" : [
								33
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Slides",
							"parameter_shortname" : "Slides",
							"parameter_type" : 1,
							"parameter_unitstyle" : 5,
							"parameter_mmin" : 0,
							"parameter_mmax" : 100
						}
					},
					"textjustification" : 0,
					"varname" : "slidesNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-140",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1790.0,
						330.0,
						110.0,
						20.0
					],
					"text" : "setSlides $1"
				}
			},
			{
				"box" : {
					"id" : "obj-141",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [
						1700.0,
						208.0,
						56.0,
						18.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						108.0,
						64.0,
						18.0
					],
					"text" : "Accents",
					"textcolor" : [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"textjustification" : 1
				}
			},
			{
				"box" : {
					"annotation" : "Percentage of the notes that are accented.",
					"annotation_name" : "Accents",
					"appearance" : 2,
					"id" : "obj-142",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [
						"",
						"float"
					],
					"parameter_enable" : 1,
					"patching_rect" : [
						1700.0,
						238.0,
						44.0,
						15.0
					],
					"presentation" : 1,
					"presentation_rect" : [
						849.0,
						124.0,
						64.0,
						15.0
					],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_annotation_name" : "Accents",
							"parameter_initial" : [
								33
							],
							"parameter_initial_enable" : 1,
							"parameter_longname" : "Accents",
							"parameter_shortname" : "Accents",
							"parameter_type" : 1,
							"parameter_unitstyle" : 5,
							"parameter_mmin" : 0,
							"parameter_mmax" : 100
						}
					},
					"textjustification" : 0,
					"varname" : "accentsNumbox"
				}
			},
			{
				"box" : {
					"id" : "obj-143",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [
						""
					],
					"patching_rect" : [
						1880.0,
						330.0,
						110.0,
						20.0
					],
					"text" : "setAccents $1"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [
						"obj-37",
						0
					],
					"source" : [
						"obj-1",
						7
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-10",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-102",
						0
					],
					"order" : 1,
					"source" : [
						"obj-100",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-104",
						0
					],
					"order" : 0,
					"source" : [
						"obj-100",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-102",
						0
					],
					"order" : 1,
					"source" : [
						"obj-101",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-106",
						0
					],
					"order" : 0,
					"source" : [
						"obj-101",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-49",
						0
					],
					"source" : [
						"obj-102",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-82",
						0
					],
					"source" : [
						"obj-104",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-82",
						0
					],
					"source" : [
						"obj-106",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-11",
						0
					],
					"source" : [
						"obj-12",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-27",
						0
					],
					"source" : [
						"obj-13",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-6",
						0
					],
					"source" : [
						"obj-13",
						2
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-90",
						0
					],
					"source" : [
						"obj-13",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-19",
						1
					],
					"source" : [
						"obj-15",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-11",
						0
					],
					"source" : [
						"obj-16",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-35",
						0
					],
					"source" : [
						"obj-18",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-90",
						0
					],
					"source" : [
						"obj-18",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-12",
						0
					],
					"source" : [
						"obj-19",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-49",
						0
					],
					"source" : [
						"obj-2",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-20",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-23",
						0
					],
					"order" : 1,
					"source" : [
						"obj-21",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-32",
						1
					],
					"order" : 0,
					"source" : [
						"obj-21",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-24",
						0
					],
					"source" : [
						"obj-23",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-26",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-26",
						0
					],
					"source" : [
						"obj-28",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-32",
						0
					],
					"order" : 1,
					"source" : [
						"obj-29",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-43",
						0
					],
					"order" : 0,
					"source" : [
						"obj-29",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-47",
						0
					],
					"order" : 2,
					"source" : [
						"obj-29",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-11",
						0
					],
					"source" : [
						"obj-3",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-90",
						0
					],
					"source" : [
						"obj-30",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-34",
						0
					],
					"source" : [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-36",
						0
					],
					"source" : [
						"obj-34",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-48",
						0
					],
					"source" : [
						"obj-34",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-27",
						0
					],
					"order" : 1,
					"source" : [
						"obj-35",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-86",
						0
					],
					"order" : 0,
					"source" : [
						"obj-35",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-24",
						0
					],
					"source" : [
						"obj-36",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-14",
						0
					],
					"order" : 1,
					"source" : [
						"obj-37",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-50",
						0
					],
					"order" : 0,
					"source" : [
						"obj-37",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-18",
						0
					],
					"source" : [
						"obj-38",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-54",
						0
					],
					"source" : [
						"obj-39",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-91",
						0
					],
					"source" : [
						"obj-4",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-42",
						0
					],
					"source" : [
						"obj-40",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-46",
						0
					],
					"source" : [
						"obj-41",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-41",
						0
					],
					"source" : [
						"obj-43",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-41",
						0
					],
					"order" : 0,
					"source" : [
						"obj-44",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-43",
						1
					],
					"order" : 1,
					"source" : [
						"obj-44",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-52",
						0
					],
					"source" : [
						"obj-45",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-53",
						0
					],
					"order" : 2,
					"source" : [
						"obj-45",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-56",
						0
					],
					"order" : 3,
					"source" : [
						"obj-45",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-61",
						0
					],
					"order" : 1,
					"source" : [
						"obj-45",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-63",
						0
					],
					"order" : 0,
					"source" : [
						"obj-45",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-24",
						0
					],
					"source" : [
						"obj-46",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-24",
						0
					],
					"source" : [
						"obj-48",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-2",
						0
					],
					"order" : 0,
					"source" : [
						"obj-51",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-25",
						1
					],
					"order" : 1,
					"source" : [
						"obj-51",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-31",
						0
					],
					"order" : 4,
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-33",
						0
					],
					"order" : 3,
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-73",
						0
					],
					"order" : 2,
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-75",
						0
					],
					"order" : 0,
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-95",
						0
					],
					"order" : 1,
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-65",
						0
					],
					"source" : [
						"obj-53",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-54",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-55",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-45",
						0
					],
					"source" : [
						"obj-56",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-77",
						0
					],
					"midpoints" : [
						345.5,
						222.0,
						345.5,
						222.0
					],
					"source" : [
						"obj-57",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-37",
						2
					],
					"source" : [
						"obj-59",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-37",
						1
					],
					"source" : [
						"obj-59",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-7",
						0
					],
					"source" : [
						"obj-6",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-59",
						0
					],
					"source" : [
						"obj-60",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-66",
						0
					],
					"source" : [
						"obj-61",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-5",
						0
					],
					"source" : [
						"obj-62",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-67",
						0
					],
					"source" : [
						"obj-63",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-53",
						0
					],
					"order" : 2,
					"source" : [
						"obj-64",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-56",
						0
					],
					"order" : 3,
					"source" : [
						"obj-64",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-61",
						0
					],
					"order" : 1,
					"source" : [
						"obj-64",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-63",
						0
					],
					"order" : 0,
					"source" : [
						"obj-64",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-69",
						0
					],
					"source" : [
						"obj-65",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-71",
						0
					],
					"source" : [
						"obj-66",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-74",
						0
					],
					"source" : [
						"obj-67",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-79",
						0
					],
					"order" : 1,
					"source" : [
						"obj-68",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-80",
						0
					],
					"order" : 0,
					"source" : [
						"obj-68",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-75",
						0
					],
					"source" : [
						"obj-69",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-20",
						0
					],
					"source" : [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-49",
						0
					],
					"source" : [
						"obj-70",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-75",
						0
					],
					"source" : [
						"obj-71",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-72",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-75",
						0
					],
					"source" : [
						"obj-74",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-18",
						0
					],
					"source" : [
						"obj-76",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-77",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-1",
						0
					],
					"order" : 0,
					"source" : [
						"obj-78",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-83",
						0
					],
					"order" : 1,
					"source" : [
						"obj-78",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-49",
						0
					],
					"source" : [
						"obj-79",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-90",
						0
					],
					"source" : [
						"obj-8",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-82",
						0
					],
					"source" : [
						"obj-80",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-87",
						0
					],
					"source" : [
						"obj-84",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-93",
						0
					],
					"source" : [
						"obj-85",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-86",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-88",
						0
					],
					"source" : [
						"obj-87",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-84",
						0
					],
					"order" : 1,
					"source" : [
						"obj-88",
						2
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-85",
						0
					],
					"order" : 0,
					"source" : [
						"obj-88",
						2
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-87",
						0
					],
					"source" : [
						"obj-88",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-92",
						0
					],
					"source" : [
						"obj-89",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-58",
						0
					],
					"source" : [
						"obj-90",
						1
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-70",
						0
					],
					"source" : [
						"obj-90",
						3
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-97",
						1
					],
					"source" : [
						"obj-90",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-93",
						0
					],
					"source" : [
						"obj-92",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-10",
						0
					],
					"order" : 3,
					"source" : [
						"obj-94",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-16",
						0
					],
					"order" : 2,
					"source" : [
						"obj-94",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-3",
						0
					],
					"order" : 1,
					"source" : [
						"obj-94",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-40",
						0
					],
					"order" : 0,
					"source" : [
						"obj-94",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-97",
						0
					],
					"source" : [
						"obj-96",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-25",
						0
					],
					"source" : [
						"obj-97",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-15",
						0
					],
					"order" : 0,
					"source" : [
						"obj-98",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-19",
						0
					],
					"order" : 1,
					"source" : [
						"obj-98",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-109",
						0
					],
					"source" : [
						"obj-107",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-109",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-108",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-114",
						0
					],
					"source" : [
						"obj-111",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-114",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-115",
						0
					],
					"source" : [
						"obj-113",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-115",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-112",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-116",
						0
					],
					"source" : [
						"obj-13",
						3
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-119",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-120",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-121",
						0
					],
					"source" : [
						"obj-117",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-121",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-122",
						0
					],
					"source" : [
						"obj-118",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-122",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-123",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-125",
						0
					],
					"source" : [
						"obj-124",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-125",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-128",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-129",
						0
					],
					"source" : [
						"obj-13",
						4
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-130",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-133",
						0
					],
					"source" : [
						"obj-131",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-133",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-134",
						0
					],
					"source" : [
						"obj-132",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-134",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-129",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-135",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-137",
						0
					],
					"source" : [
						"obj-136",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-137",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-138",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-140",
						0
					],
					"source" : [
						"obj-139",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-140",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-141",
						0
					],
					"source" : [
						"obj-52",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-143",
						0
					],
					"source" : [
						"obj-142",
						0
					]
				}
			},
			{
				"patchline" : {
					"destination" : [
						"obj-13",
						0
					],
					"source" : [
						"obj-143",
						0
					]
				}
			}
		],
		"parameters" : {
			"obj-100" : [
				"RotateLeft",
				"RotateLeft",
				0
			],
			"obj-101" : [
				"RotateRight",
				"RotateRight",
				0
			],
			"obj-21" : [
				"Fold",
				"Fold",
				0
			],
			"obj-22" : [
				"presetStorage",
				"presetStorage",
				0
			],
			"obj-28" : [
				"Temperature",
				"Temp",
				0
			],
			"obj-39" : [
				"Generate",
				"Generate",
				0
			],
			"obj-4" : [
				"presetNumbox",
				"presetNumbox",
				0
			],
			"obj-44" : [
				"Zoom",
				"Zoom",
				0
			],
			"obj-51" : [
				"Fix gate",
				"Gate",
				0
			],
			"obj-57" : [
				"Default velocity",
				"Velocity",
				0
			],
			"obj-68" : [
				"clip",
				"clip",
				0
			],
			"obj-7" : [
				"initialized",
				"initialized",
				0
			],
			"obj-72" : [
				"generate",
				"generate",
				0
			],
			"obj-87" : [
				"outputPath",
				"outputPath",
				0
			],
			"obj-90" : [
				"Pattern",
				"Pattern",
				0
			],
			"obj-94" : [
				"lengthNumBox",
				"lengthNumBox",
				0
			],
			"obj-96" : [
				"play",
				"play",
				0
			],
			"obj-98" : [
				"ModeMenu",
				"ModeMenu",
				0
			],
			"parameterbanks" : {
				"0" : {
					"index" : 0,
					"name" : "",
					"parameters" : [
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-"
					]
				}
			},
			"inherited_shortname" : 1,
			"obj-107" : [
				"Transpose",
				"Transpose",
				0
			],
			"obj-111" : [
				"mutate",
				"mutate",
				0
			],
			"obj-113" : [
				"Mutate amount",
				"Amount",
				0
			],
			"obj-117" : [
				"Scale root",
				"Root",
				0
			],
			"obj-118" : [
				"Scale",
				"Scale",
				0
			],
			"obj-124" : [
				"Seed",
				"Seed",
				0
			],
			"obj-131" : [
				"historyUndo",
				"historyUndo",
				0
			],
			"obj-132" : [
				"historyRedo",
				"historyRedo",
				0
			],
			"obj-136" : [
				"Rests",
				"Rests",
				0
			],
			"obj-139" : [
				"Slides",
				"Slides",
				0
			],
			"obj-142" : [
				"Accents",
				"Accents",
				0
			]
		},
		"dependency_cache" : [
			{
				"name" : "acid.js",
				"bootpath" : "F:/Projects/Aicd",
				"type" : "TEXT",
				"implicit" : 1
			},
			{
				"name" : "clipSelect.maxpat",
				"bootpath" : "F:/Projects/BassGen",
				"type" : "JSON",
				"implicit" : 1
			},
			{
				"name" : "lm.js",
				"bootpath" : "F:/Projects/Aicd",
				"type" : "TEXT",
				"implicit" : 1
			}
		],
		"latency" : 0,
		"is_mpe" : 0,
		"minimum_live_version" : "",
		"minimum_max_version" : "",
		"platform_compatibility" : 0,
		"project" : {
			"version" : 1,
			"creationdate" : 3590052786,
			"modificationdate" : 3727712678,
			"viewrect" : [
				846.0,
				360.0,
				300.0,
				500.0
			],
			"autoorganize" : 1,
			"hideprojectwindow" : 1,
			"showdependencies" : 1,
			"autolocalize" : 0,
			"contents" : {
				"patchers" : {
					"clipSelect.maxpat" : {
						"kind" : "patcher"
					}
				},
				"code" : {
					"lm.js" : {
						"kind" : "javascript",
						"local" : 1,
						"singleton" : {
							"bootpath" : "F:/Projects/Aicd"
						}
					},
					"acid.js" : {
						"kind" : "javascript",
						"local" : 1,
						"singleton" : {
							"bootpath" : "F:/Projects/Aicd"
						}
					}
				}
			},
			"layout" : {},
			"searchpath" : {},
			"detailsvisible" : 0,
			"amxdtype" : 1835887981,
			"readonly" : 0,
			"devpathtype" : 0,
			"devpath" : ".",
			"sortmode" : 0,
			"viewmode" : 0,
			"includepackages" : 0
		},
		"autosave" : 0,
		"saved_attribute_attributes" : {
			"default_plcolor" : {
				"expression" : ""
			}
		}
	}
}

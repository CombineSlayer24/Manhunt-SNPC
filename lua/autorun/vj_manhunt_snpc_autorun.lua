/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------
*/
------------------ Addon Information ------------------
local PublicAddonName = "Manhunt SNPC Pack"
local AddonName = "Manhunt"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_manhunt_snpc_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vManhunt_Hunters_Cat = "Manhunt - Hunters"
	local vManhunt_Misc_Cat = "Manhunt - Main Characters"
	local vManhunt_EntityCat = "Manhunt - Entities"
	
	VJ.AddCategoryInfo(vManhunt_Hunters_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_Misc_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_EntityCat, {Icon = "vgui/mh_logo.png"})

--[[	Weapon Notes : (If your digging in here!)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	Hoods = (VANILLA: Fist, Bat (Wooden), Blackjack, Crowbar | BETA: Hammer, Fire Axe | CUSTOM: Light Pistol, Revolver)
///	Skinz =  (VANILLA: Fist, Bat (Metal), Knife, Nailgun | BETA: Revolver, Sawn-off Shotgun | CUSTOM: Machete, Light Pistol)
///	Wardogs = (VANILLA: Machete, Shotgun, Sniper Rifle, Revolver | BETA: PSG-1, Hunting Knife | CUSTOM: Fist, Bat (Wooden), Assault Rifle)
///	Innocentz = (VANILLA: Fist, Revolver, Sawn-off Shotgun, Knife, Sickle, Axe, Bat (Wooden) | BETA: Bat (Spiked), Shotgun | CUSTOM: Heavy Pistol)
///	Smileys = (VANILLA: Fist, Meat Cleaver, Revolver, Shotgun, Light Pistol, Sawn-off Shotgun, Knife, Bat (Metal)| BETA: Hammer, Bat (Spiked), Blackjack, Sickle)
///	CCPD = (VANILLA: Revolver, Nightstick, Shotgun, Light Pistol, Heavy Pistol, Sub-Machine Gun, Sniper Rifle | CUSTOM: Bat (Wooden), Fist)
///	CCPD Swat = (VANILLA: Shotgun, Heavy Pistol, Sub-Machine Gun | CUSTOM: Nightstick, Fist, Assault Rifle)
///	Cerberus = (VANILLA: Assault Rifle, Shotgun, Heavy Pistol | CUSTOM: Fist, Nightstick, Bat (Wooden), Light Pistol, Sub-Machine Gun)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	James Earl Cash = (All)
///	Rameriez (Boss) = (VANILLA: Sniper Rifle, Shotgun | CUSTOM: Assault Rifle, Heavy Pistol)
///	Bunny (Boss) (?)
///	Cerberus Leader (Boss) (Same loadout as Cerberus)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///	Item Rarites = 5 (very common), 4 (common), 3 (somewhat common), 2 (rare), 1 (extremely rare)
///	Striker = Melee welder (325)
///	Gunman = Gun welder (150)
--]]

	local ManHunt_Hoods_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_blackjack",
		"weapon_vj_manhunt_melee_crowbar",
		"weapon_vj_manhunt_melee_crowbar",
		"weapon_vj_manhunt_melee_crowbar",
		"weapon_vj_manhunt_melee_crowbar",
		"weapon_vj_manhunt_melee_fireaxe",
		"weapon_vj_manhunt_melee_fireaxe",
		"weapon_vj_manhunt_melee_fireaxe",
		"weapon_vj_manhunt_melee_hammer",
		"weapon_vj_manhunt_melee_hammer",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists"
	}

	local ManHunt_Hoods_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light"
	}

	local ManHunt_Skinz_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_bat_m",
		"weapon_vj_manhunt_melee_knife",
		"weapon_vj_manhunt_melee_knife",
		"weapon_vj_manhunt_melee_knife",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_machete",
		"weapon_vj_manhunt_melee_machete"
	}

	local ManHunt_Skinz_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_nailgun",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_shotgun_sawnoff",
		"weapon_vj_manhunt_shotgun_sawnoff"
	}

	local ManHunt_CCPD_Cop_Striker_Weapons =  
	{	
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_nightstick",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_fists",
		"weapon_vj_manhunt_melee_bat_w",
		"weapon_vj_manhunt_melee_bat_w"
	}

	local ManHunt_CCPD_Cop_Gunman_Weapons =  
	{	
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_pistol_38r",
		"weapon_vj_manhunt_shotgun",
		"weapon_vj_manhunt_shotgun",
		"weapon_vj_manhunt_shotgun",
		"weapon_vj_manhunt_shotgun",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		"weapon_vj_manhunt_pistol_light_ps2",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_heavy",
		--"weapon_vj_manhunt_pistol_smg",
		--"weapon_vj_manhunt_pistol_smg",
		"weapon_vj_manhunt_rifle_sniper"
	}

	---------- Hunters ---------------------
	VJ.AddNPC_HUMAN("Skinz Member (Friendly)","npc_vj_skin",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Member","npc_vj_skin_h",ManHunt_Skinz_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Gunman (Friendly)","npc_vj_skin_gunman",ManHunt_Skinz_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Gunman","npc_vj_skin_gunman_h",ManHunt_Skinz_Gunman_Weapons,vManhunt_Hunters_Cat)

	VJ.AddNPC_HUMAN("Hoods Member (Friendly)","npc_vj_hood",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Member","npc_vj_hood_h",ManHunt_Hoods_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Gunman (Friendly)","npc_vj_hood_gunman",ManHunt_Hoods_Gunman_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Gunman","npc_vj_hood_gunman_h",ManHunt_Hoods_Gunman_Weapons,vManhunt_Hunters_Cat)

	VJ.AddNPC_HUMAN("CCPD Officer (Friendly)","npc_vj_ccpd_cop",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("CCPD Officer","npc_vj_ccpd_cop_h",ManHunt_CCPD_Cop_Striker_Weapons,vManhunt_Hunters_Cat)

	---------- Misc ------------------------
	VJ.AddNPC_HUMAN("James Earl Cash (Friendly)","npc_vj_cash",ManHunt_Hoods_Striker_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("James Earl Cash","npc_vj_cash_h",ManHunt_Hoods_Striker_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("Monkey (Friendly)","npc_vj_monkey",{"weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun","weapon_vj_manhunt_shotgun"},vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Monkey","npc_vj_monkey_h",{"weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun_sawnoff","weapon_vj_manhunt_shotgun","weapon_vj_manhunt_shotgun"},vManhunt_Hunters_Cat)
	---------- Weapons ---------------------
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light", "weapon_vj_manhunt_pistol_light")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light (PS2)", "weapon_vj_manhunt_pistol_light_ps2")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Revolver", "weapon_vj_manhunt_pistol_38r")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Nailgun", "weapon_vj_manhunt_pistol_nailgun")
	VJ.AddNPCWeapon("VJ_Manhunt_Rifle_Sniper (Bolt)", "weapon_vj_manhunt_rifle_sniper")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Blackjack", "weapon_vj_manhunt_melee_blackjack")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Bat (Metal)", "weapon_vj_manhunt_melee_bat_m")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Bat (Wood)", "weapon_vj_manhunt_melee_bat_w")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Nightstick", "weapon_vj_manhunt_melee_nightstick")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Fists", "weapon_vj_manhunt_melee_fists")
	VJ.AddNPCWeapon("VJ_Manhunt_Shotgun_Sawnoff", "weapon_vj_manhunt_shotgun_sawnoff")
	VJ.AddNPCWeapon("VJ_Manhunt_Shotgun", "weapon_vj_manhunt_shotgun")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Crowbar", "weapon_vj_manhunt_melee_crowbar")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Machete", "weapon_vj_manhunt_melee_machete")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Knife", "weapon_vj_manhunt_melee_knife")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Hammer", "weapon_vj_manhunt_melee_hammer")

	VJ.AddEntity("Painkillers", "sent_vj_pills_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Shotgun Ammo", "sent_vj_shotgun_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Pistol Ammo", "sent_vj_pistol_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Pistol + SMG Ammo", "sent_vj_pis_smg_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("SMG Ammo", "sent_vj_smg_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	VJ.AddEntity("Rifle Ammo", "sent_vj_rifle_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
	-- VJ.AddEntity("Sniper Ammo", "sent_vj_pistol_ammo_pickup", "Pyri", false, 0, true, vManhunt_EntityCat) -- Adds an entity to the spawnmenu
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Decals ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Blood
	game.AddDecal("VJ_Manhunt_Blood_Red",{"decals/manhunt/blood1","decals/manhunt/blood2","decals/manhunt/blood3"})
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Precaches ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	util.PrecacheModel("models/manhunt/gibs/1.mdl")
	util.PrecacheModel("models/manhunt/gibs/2.mdl")
	util.PrecacheModel("models/manhunt/gibs/3.mdl")
	util.PrecacheModel("models/manhunt/gibs/4.mdl")
	------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddConVar("vj_manhunt_hunters_allied", 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Manhunt", "Manhunt", "", "", function(Panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
				return
			end
			Panel:AddControl("Header", {Description = "NOTICE!: Newly spawned SNPC's will take affect to the changes you made!"})
			Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
			Panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_manhunt_hunters_allied 0"})
			Panel:AddControl("Checkbox", {Label = "Allow Hunters to be allied together", Command = "vj_manhunt_hunters_allied"})
			Panel:ControlHelp("If enabled, All hunters will be friendly to all")
			Panel:ControlHelp(" ")
			Panel:ControlHelp("If disabled, All hunters won't be friendly to eachother (Default class relations)")
		end)
	end)
end
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
AddCSLuaFile(AutorunFile)
VJ.AddAddonProperty(AddonName,AddonType)
else
if CLIENT then
	chat.AddText(Color(0, 200, 200), PublicAddonName,
	Color(0, 255, 0), " was unable to install, you are missing ",
	Color(255, 100, 0), "VJ Base!")
end

timer.Simple(1, function()
	if not VJBASE_ERROR_MISSING then
		VJBASE_ERROR_MISSING = true
		if CLIENT then
			// Get rid of old error messages from addons running on older code...
			if VJF && type(VJF) == "Panel" then
				VJF:Close()
			end
			VJF = true
			
			local frame = vgui.Create("DFrame")
			frame:SetSize(600, 160)
			frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
			frame:SetTitle("Error: VJ Base is missing!")
			frame:SetBackgroundBlur(true)
			frame:MakePopup()

			local labelTitle = vgui.Create("DLabel", frame)
			labelTitle:SetPos(250, 30)
			labelTitle:SetText("VJ BASE IS MISSING!")
			labelTitle:SetTextColor(Color(255,128,128))
			labelTitle:SizeToContents()
			
			local label1 = vgui.Create("DLabel", frame)
			label1:SetPos(170, 50)
			label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
			label1:SizeToContents()
			
			local label2 = vgui.Create("DLabel", frame)
			label2:SetPos(10, 70)
			label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
			label2:SizeToContents()
			
			local link = vgui.Create("DLabelURL", frame)
			link:SetSize(300, 20)
			link:SetPos(195, 100)
			link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
			link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
			
			local buttonClose = vgui.Create("DButton", frame)
			buttonClose:SetText("CLOSE")
			buttonClose:SetPos(260, 120)
			buttonClose:SetSize(80, 35)
			buttonClose.DoClick = function()
				frame:Close()
			end
		elseif (SERVER) then
			VJF = true
			timer.Remove("VJBASEMissing")
			timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
				print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
			end)
		end
	end
end)
end
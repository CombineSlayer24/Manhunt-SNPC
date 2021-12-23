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
	local vManhunt_Misc_Cat = "Manhunt - Misc"
	
	VJ.AddCategoryInfo(vManhunt_Hunters_Cat, {Icon = "vgui/mh_logo.png"})
	VJ.AddCategoryInfo(vManhunt_Misc_Cat, {Icon = "vgui/mh_logo.png"})

	local ManHunt_Skinz_Weapons =  {"weapon_vj_manhunt_glock","weapon_vj_manhunt_glockps2"}

	---------- Hunters ---------------------
	VJ.AddNPC_HUMAN("Skinz Member","npc_vj_skin",ManHunt_Skinz_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Skinz Member (Hostile)","npc_vj_skin_h",ManHunt_Skinz_Weapons,vManhunt_Hunters_Cat)

	VJ.AddNPC_HUMAN("Hoods Member","npc_vj_hood",ManHunt_Skinz_Weapons,vManhunt_Hunters_Cat)
	VJ.AddNPC_HUMAN("Hoods Member (Hostile)","npc_vj_hood_h",ManHunt_Skinz_Weapons,vManhunt_Hunters_Cat)

	---------- Misc ------------------------
	VJ.AddNPC_HUMAN("James Earl Cash","npc_vj_cash",ManHunt_Skinz_Weapons,vManhunt_Misc_Cat)
	VJ.AddNPC_HUMAN("James Earl Cash (Hostile)","npc_vj_cash_h",ManHunt_Skinz_Weapons,vManhunt_Misc_Cat)

	---------- Weapons ---------------------
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light", "weapon_vj_manhunt_pistol_light")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Light (PS2)", "weapon_vj_manhunt_pistol_light_ps2")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Revolver", "weapon_vj_manhunt_pistol_38r")
	VJ.AddNPCWeapon("VJ_Manhunt_Pistol_Nailgun", "weapon_vj_manhunt_pistol_nailgun")
	VJ.AddNPCWeapon("VJ_Manhunt_Melee_Blackjack", "weapon_vj_manhunt_blackjack")

	VJ.AddEntity("Pills Pickup", "sent_vj_pills_pickup", "Pyri", false, 0, true, vEntityCat) -- Adds an entity to the spawnmenu
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
	util.PrecacheModel("models/manhunt/npc/skin1.mdl")
	util.PrecacheModel("models/manhunt/npc/skin2.mdl")
	util.PrecacheModel("models/manhunt/npc/skin3.mdl")
	util.PrecacheModel("models/manhunt/npc/hood1.mdl")
	util.PrecacheModel("models/manhunt/npc/hood2.mdl")
	util.PrecacheModel("models/manhunt/npc/hood3.mdl")
	------------------------------------------------------------------------------------------------------------------------------------------------------
	// Add this later
	-- local AddConvars = {}
	-- AddConvars["vj_gtalcs_additional_voicesets"] = 0
	-- for k, v in pairs(AddConvars) do
	-- 	if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	-- end
	
	-- if CLIENT then
	-- local function VJ_MANHUNT_MAIN(Panel)
	-- 	if !game.SinglePlayer() then
	-- 	if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
	-- 		Panel:AddControl( "Label", {Text = "You are not an admin!"})
	-- 		Panel:ControlHelp("Notice: Only admins can change this settings")
	-- 		return
	-- 		end
	-- 	end
	-- 	Panel:AddControl( "Label", {Text = "Notice: Only admins can change this settings."})
	-- 	local vj_manhunt_cmdreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "1"}
	-- 	vj_gtalcs_cmdreset.Options["#vjbase.menugeneral.default"] = { 
	-- 	vj_gtalcs_additional_voicesets = "0",
	-- 	--vj_gtalcs_additional_meleesounds = "0",
	-- 	}
	-- 	Panel:AddControl("Header", {Description = "NOTICE!: Newly spawned SNPC's will take affect to the changes you made!"})
	-- 	Panel:AddControl("Checkbox", {Label = "Can Peds use additional voices? (GTA III voices)", Command = "vj_gtalcs_additional_voicesets"})
	-- 	Panel:ControlHelp("If unchecked, peds will only have LCS voicesets. (Limited to certain peds)")
	-- 	--Panel:AddControl("Checkbox", {Label = "Melee weapons use additional sounds?", Command = "vj_gtalcs_additional_meleesounds"})
	-- 	--Panel:ControlHelp("If unchecked, melee weapons will only have classic GTA sfx. If checked, melee weapons will use Bully CCE sfx + classic GTA sfx.")
				
	-- end
	-- function VJ_ADDTOMENU_MANHUNT()
	-- 	spawnmenu.AddToolMenuOption( "DrVrej", "SNPC Configures", "MANHUNT SNPC", "MANHUNT SNPC", "", "", VJ_MANHUNT_MAIN, {} )
	-- end
	-- 	hook.Add( "PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT", VJ_ADDTOMENU_MANHUNT )
	-- end
	-- ConVars --
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end
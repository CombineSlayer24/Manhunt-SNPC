ENT.Base 			= "npc_vj_lnr_base_inf" -- Credit to Darkborn
ENT.Type 			= "ai"
ENT.PrintName 		= "Undead Smiley Bolter"
ENT.Author 			= "Pyri"
ENT.Contact 		= ""
ENT.Purpose 		= "Braaaainnns?"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Manhunt - Undead"

if (CLIENT) then
    local Name = "Undead Smiley Bolter"
    local LangName = "npc_vj_mh_undead_smiley_run"
    language.Add(LangName, Name)
    killicon.Add(LangName,"vgui/manhunt/fist",Color(220, 35, 35))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"vgui/manhunt/fist",Color(220, 35, 35))
end
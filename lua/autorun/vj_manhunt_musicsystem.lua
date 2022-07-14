--[[ Manhunt Music is aiming to recreate the music system in Manhunt 1,
How it works: 
When the client is in-game and we play the music based on the client's actions
all 4 tracks should play at once, however, 3 tracks are muted and 1 will be playing for that phase the player is in.
--
If they choose to enable the music system, we play the Idle phase.
Idle phase plays when there are currently no enemies that are aware of our presence.
--
If the player is in a dark area, we slowly fade out the music. (only in Idle mode)
-- 
If a hostile NPC has heard the player (that made the noise) we play the Suspicious phase
Suspicious phase plays when 1 or more hostile NPCs are walking to the ares that they heard the noise (need to call the Investigation detection system code from VJ Base)
--
If a hostile NPC spots us, we play Spotted phase
Spotted phase plays when the hostile NPC has spotted us (the client that got spotted)
--
If a hostile NPC has spot us and is in active fight and if the VJ SNPC gets close to the client, we play Combat phase
Combat phase plays when the hostile NPC is close to the client (400-500 HU?), if the NPC is far away, we change Combat phase to Spotted phase.
--
Server admin/mods can choose which scene OST to play to all clients. (doing clientside may be a real headache, so probably serverside works better?)
I don't really know what i'm trying to do, i would need help with this. ]]--

if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

-- Serverside commands that affect all players
local mh_music_enable = CreateConVar("vj_sv_manhunt_music_enable","1",FCVAR_REPLICATED," Enable the Manhunt Music System. 0- Off, 1- On",0,1)
local mh_music_fade_speed = CreateConVar( "vj_sv_manhunt_music_fade", "1.25", FCVAR_REPLICATED,"How fast should we make music transitions? < than 1 = fast, > than 1 = slower",0,2)
local mh_music_vol_idle = CreateConVar("vj_sv_manhunt_music_vol_idle","0.35",FCVAR_REPLICATED,"Idle volume control",0,3)
local mh_music_vol_sus = CreateConVar("vj_sv_manhunt_music_vol_suspicious","0.4",FCVAR_REPLICATED,"Suspicious volume control",0,3)
local mh_music_vol_spot = CreateConVar("vj_sv_manhunt_music_vol_spotted","0.6",FCVAR_REPLICATED,"Spotted volume control",0,3)
local mh_music_vol_comb = CreateConVar("vj_sv_manhunt_music_vol_combat","0.75",FCVAR_REPLICATED,"Combat volume control",0,3)

// Only 2 are added since these are only in the demo
if ( SERVER ) then

	resource.AddFile("sound/music/stems/born_again_1_idle.ogg")
	resource.AddFile("sound/music/stems/born_again_2_suspicious.ogg")
	resource.AddFile("sound/music/stems/born_again_3_spotted.ogg")
	resource.AddFile("sound/music/stems/born_again_4_combat.ogg")
	resource.AddFile("sound/music/stems/doorway_hell_1_idle.ogg")
	resource.AddFile("sound/music/stems/doorway_hell_2_suspicious.ogg")
	resource.AddFile("sound/music/stems/doorway_hell_3_spotted.ogg")
	resource.AddFile("sound/music/stems/doorway_hell_4_combat.ogg")

end

-- Files are in .OGG format
local ManhuntMusic_Table = {
    ["born_again"] = {
        Name = "Born Again",
        Idle = {"born_again_1_idle"},
        Suspicious = {"born_again_2_suspicious"},
        Spotted = {"born_again_3_spotted"},
        Combat = {"born_again_4_combat"},
    },
    ["doorway_hell"] = {
        Name = "Doorway To Hell",
        Idle = {"doorway_hell_1_idle"},
        Suspicious = {"doorway_hell_2_suspicious"},
        Spotted = {"doorway_hell_3_spotted"},
        Combat = {"doorway_hell_4_combat"},
    },
    ["roadway_to_hell"] = {
        Name = "Roadway To Hell",
        Idle = {"roadway_to_hell_1_idle"},
        Suspicious = {"roadway_to_hell_2_suspicious"},
        Spotted = {"roadway_to_hell_3_spotted"},
        Combat = {"roadway_to_hell_4_combat"},
    },
    ["white_trash"] = {
        Name = "White Trash",
        Idle = {"white_trash_1_idle"},
        Suspicious = {"white_trash_2_suspicious"},
        Spotted = {"white_trash_3_spotted"},
        Combat = {"white_trash_4_combat"},
    },
    ["fuelled_by_hate"] = {
        Name = "Fuelled By Hate",
        Idle = {"fuelled_by_hate_1_idle"},
        Suspicious = {"fuelled_by_hate_2_suspicious"},
        Spotted = {"fuelled_by_hate_3_spotted"},
        Combat = {"fuelled_by_hate_4_combat"},
    },
    ["grounds_for_assault"] = {
        Name = "Grounds For Assault",
        Idle = {"grounds_for_assault_1_idle"},
        Suspicious = {"grounds_for_assault_2_suspicious"},
        Spotted = {"grounds_for_assault_3_spotted"},
        Combat = {"grounds_for_assault_4_combat"},
    },
    ["strapped_for_cash"] = {
        Name = "Strapped For Cash",
        Idle = {"strapped_for_cash_1_idle"},
        Suspicious = {"strapped_for_cash_2_suspicious"},
        Spotted = {"strapped_for_cash_3_spotted"},
        Combat = {"strapped_for_cash_4_combat"},
    },
    ["view_of_innocence"] = {
        Name = "View Of Innocence",
        Idle = {"view_of_innocence_1_idle"},
        Suspicious = {"view_of_innocence_2_suspicious"},
        Spotted = {"view_of_innocence_3_spotted"},
        Combat = {"view_of_innocence_4_combat"},
    },
    ["graveyard_shift"] = {
        Name = "Graveyard Shift",
        Idle = {"graveyard_shift_1_idle"},
        Suspicious = {"graveyard_shift_2_suspicious"},
        Spotted = {"graveyard_shift_3_spotted"},
        Combat = {"graveyard_shift_4_combat"},
    },
    ["mouth_of_madness"] = {
        Name = "Mouth Of Madness",
        Idle = {"mouth_of_madness_1_idle"},
        Suspicious = {"mouth_of_madness_2_suspicious"},
        Spotted = {"mouth_of_madness_3_spotted"},
        Combat = {"mouth_of_madness_4_combat"},
    },
    ["doing_time"] = {
        Name = "Doing Time",
        Idle = {"doing_time_1_idle"},
        Suspicious = {"doing_time_2_suspicious"},
        Spotted = {"doing_time_3_spotted"},
        Combat = {"doing_time_4_combat"},
    },
    ["divided_they_fall"] = {
        Name = "Divided They Fall",
        Idle = {"divided_they_fall_1_idle"},
        Suspicious = {"divided_they_fall_2_suspicious"},
        Spotted = {"divided_they_fall_3_spotted"},
        Combat = {"divided_they_fall_4_combat"},
    },
    ["press_coverage"] = {
        Name = "Press Coverage",
        Idle = {"press_coverage_1_idle"},
        Suspicious = {"press_coverage_2_suspicious"},
        Spotted = {"press_coverage_3_spotted"},
        Combat = {"press_coverage_4_combat"},
    },
    ["wrong_sides_of_the_tracks"] = {
        Name = "Wrong Side of the Tracks",
        Idle = {"wrong_side_of_tracks_1_idle"},
        Suspicious = {"wrong_side_of_tracks_2_suspicious"},
        Spotted = {"wrong_side_of_tracks_3_spotted"},
        Combat = {"wrong_side_of_tracks_4_combat"},
    },
    ["trained_to_kill"] = {
        Name = "Trained To Kill",
        Idle = {"trained_to_kill_1_idle"},
        Suspicious = {"trained_to_kill_2_suspicious"},
        Spotted = {"trained_to_kill_3_spotted"},
        Combat = {"trained_to_kill_4_combat"},
    },
    ["border_patrol"] = {
        Name = "Border Patrol",
        Idle = {"border_patrol_1_idle"},
        Suspicious = {"border_patrol_2_suspicious"},
        Spotted = {"border_patrol_3_spotted"},
        Combat = {"border_patrol_4_combat"},
    },
    ["key_personnel"] = {
        Name = "Key Personnel",
        Idle = {"key_personnel_1_idle"},
        Suspicious = {"key_personnel_2_suspicious"},
        Spotted = {"key_personnel_3_spotted"},
        Combat = {"key_personnel_4_combat"},
    },
    ["deliverance"] = {
        Name = "Deliverance",
        Idle = {"deliverance_1_idle"},
        Suspicious = {"deliverance_2_suspicious"},
        Spotted = {"deliverance_3_spotted"},
        Combat = {"deliverance_4_combat"},
    },
    ["time_2_die"] = {
        Name = "Time 2 Die",
        Idle = {"time_2_die_1_idle"},
        Suspicious = {"time_2_die_2_suspicious"},
        Spotted = {"time_2_die_3_spotted"},
        Combat = {"time_2_die_4_combat"},
    },
    ["unused_theme"] = {
        Name = "Unused Theme",
        Idle = {"unused_1_idle"},
        Suspicious = {"unused_2_suspicious"},
        Spotted = {"unused_3_spotted"},
        Combat = {"unused_4_combat"},
    },
}

if ( SERVER ) then    
    hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_MANHUNT", function()
        spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Manhunt (Music System)", "Manhunt (Music System)", "", "", function(panel)
            
            panel:Help("This menu contains options for the music system. Only server admins/mods can change setting listed here.")

            local box,label = panel:ComboBox("Select music")
            box.LoadMusics = function(s)
                s:Clear()

                for k,v in pairs(ManhuntMusic_Table) do
                    s:AddChoice(v.name,k)
                end
            end
        end)
    end)
end

local ply = IsPlayer() -- For targetting players
local npc = ent.IsVJBaseSNPC() -- For VJ Only NPCs ( We want to target VJ only NPCS because they can Investigate sounds, unlike HL2 NPCs )

function MusicGet(name)
	return ManhuntMusic_Table[name]
end

-- Get the current music state for the player
function GetMusicState()
    if IsValid(ply) then

    end
end

-- If we are in the shawdows (dark lit areas), slowly fade the idle music to 0
function DarknessPhase()

end

-- Play Idle phase if no enemies know our location
function PlayIdle()

end

-- If a VJ NPC hears noise from the Player, play Suspicious
function PlaySuspicious()

end

-- If a VJ NPC spots us, play the spotted music
function PlaySpotted()

end

-- If a VJ NPC is near us in a certain radius during PlaySpotted(), play Combat
function PlayCombat()

end

-- to filter check if there's VJ NPC active
function CheckForEnemies()

end

-- filter check if the VJ NPC is invetigating the player that made the noise
function CheckIfInvestigating()
    
end
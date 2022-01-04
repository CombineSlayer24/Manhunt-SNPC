if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_melee_base_manhunt_v2"
SWEP.PrintName					= "Manhunt Fists"
SWEP.Author 					= "Comrade Communist"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
SWEP.WorldModel					= ""
SWEP.HoldType 					= "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= math.random(4,6) -- Damage
SWEP.Primary.PlayerDamage		= "Same" -- Only applies for players | "Same" = Same as self.Primary.Damage, "Double" = Double the self.Primary.Damage OR put a number to be different from self.Primary.Damage
SWEP.Primary.Force				= math.random(1,2) -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 1000 -- Max amount of bullets per clip
SWEP.Primary.Recoil				= 0.01 -- How much recoil does the player get?
SWEP.NPC_NextPrimaryFire 		= 1.093
SWEP.Primary.Delay				= 1.3 -- Time until it can shoot again
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Ammo				= "smg" -- Ammo type
SWEP.Primary.Sound				= {"weapons/melee/mh_melee_miss.wav"}
SWEP.Primary.HasDistantSound	= false -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DistantSound		= {"weapons/melee/mh_melee_miss.wav"}

SWEP.UseHands				= true
SWEP.ViewModelFOV			= 67

function SWEP:CustomOnInitialize()

self.Owner.AnimTbl_MeleeAttack = {"melee_gunhit","range_fists_l_1","range_fists_l_2","range_fists_r_1","range_fists_r_2","range_fistse_noga_1","range_fistse_noga_2","swing"}
self.Owner.DefaultSoundTbl_MeleeAttack = {"weapons/melee/mh_melee_hit1.wav","weapons/melee/mh_melee_hit2.wav","weapons/melee/mh_melee_hit3.wav"}
self.Owner.DefaultSoundTbl_MeleeAttackMiss = {"weapons/melee/mh_melee_miss.wav"}
self.Owner.AnimTbl_WeaponAttack = {ACT_HL2MP_IDLE_FIST}
end

function SWEP:CustomOnThink() 
self.Owner.Weapon_FiringDistanceFar = math.random(45,55)
self.Owner.Weapon_FiringDistanceClose = math.random(-100,-1000)
self.Owner.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_FIST}
self.Owner.AnimTbl_Walk = {ACT_HL2MP_WALK_FIST}
self.Owner.AnimTbl_Run = {ACT_HL2MP_RUN_FIST}
self.Owner.AnimTbl_ShootWhileMovingWalk = {ACT_HL2MP_WALK_FIST}
self.Owner.AnimTbl_ShootWhileMovingRun = {ACT_HL2MP_RUN_FIST}
self.Owner.WeaponReloadAnimationFaceEnemy = false
self.Owner.HasWeaponBackAway = true
self.Owner.WeaponBackAway_Distance = 40
self.Owner.AllowWeaponReloading = true
self.Owner.CanCrouchOnWeaponAttack = false
self.Owner.RunAwayOnUnknownDamage = false
self.Owner.MoveOrHideOnDamageByEnemy = false
self.Owner.DisableWeaponReloadAnimation = true
self.Owner.WaitForEnemyToComeOut = false
self.Owner.NoWeapon_UseScaredBehavior = false
self.Owner.RunFromEnemy_Distance = 10000
end

function SWEP:CustomOnPrimaryAttack_BeforeShoot()
				local Rand = math.random(1,2)
				if Rand == 1 then 
self.NPC_NextPrimaryFire 		= 0.2		
		elseif Rand == 2 then 
	self.NPC_NextPrimaryFire 		= 0.3		
		end
self.Owner:VJ_ACT_PLAYACTIVITY({ACT_MELEE_ATTACK_SWING,ACT_HL2MP_SIT_FIST,ACT_HL2MP_GESTURE_RANGE_ATTACK_FIST,ACT_MELEE_ATTACK1},true,false,true)
 end
function SWEP:CustomOnPrimaryAttack_AfterShoot()
self.Owner:VJ_ACT_PLAYACTIVITY(ACT_HL2MP_IDLE_FIST,false,0.01,false,1,{SequenceDuration=self.DeathFlinchTime})
	pos = self.Owner:GetShootPos()
	ang = self.Owner:GetAimVector()
	damagedice = math.Rand(1,2)
			
	pain = self.Primary.Damage * damagedice
			self.Weapon:EmitSound("weapons/melee/mh_melee_miss.wav")--slash in the wind sound here
				if SERVER and IsValid(self.Owner) then
						local slash = {}
						slash.start = pos
						slash.endpos = pos + (ang * 80)
						slash.filter = self.Owner
						slash.mins = Vector(-5, -5, 0)
						slash.maxs = Vector(5, 5, 5)
						local slashtrace = util.TraceHull(slash)
						if slashtrace.Hit then
							targ = slashtrace.Entity
							if targ:IsPlayer() or targ:IsNPC() then
									//self.Owner:EmitSound("Flesh.ImpactHard",55,100)								
								paininfo = DamageInfo()
								paininfo:SetDamage(pain)
								paininfo:SetDamageType(DMG_SLASH)
								paininfo:SetAttacker(self.Owner)
								paininfo:SetInflictor(self.Weapon)
						  local RandomForce = math.random(1,20)
								paininfo:SetDamageForce(slashtrace.Normal * RandomForce)
								if targ:IsPlayer() then
								targ:ViewPunch( Angle( -10, -20, 0 ) )
								end
							local blood = targ:GetBloodColor()	
						   local fleshimpact		= EffectData()
								fleshimpact:SetEntity(self.Weapon)
								fleshimpact:SetOrigin(slashtrace.HitPos)
								fleshimpact:SetNormal(slashtrace.HitPos)
								if blood >= 0 then
								fleshimpact:SetColor(blood)
								util.Effect("BloodImpact", fleshimpact)
								end
								
								if SERVER then targ:TakeDamageInfo(paininfo) end
							end
						end
					end
						local slash = {}
						slash.start = pos
						slash.endpos = pos + (ang * 80)
						slash.filter = self.Owner
						slash.mins = Vector(-5, -5, 0)
						slash.maxs = Vector(5, 5, 5)

								local slash = {}
						slash.start = pos
						slash.endpos = pos + (ang * 80)
						slash.filter = self.Owner
						slash.mins = Vector(-5, -5, 0)
						slash.maxs = Vector(5, 5, 5)
				local slashtrace = util.TraceHull(slash)
						if slashtrace.Hit then
							targ = slashtrace.Entity
							if targ:IsPlayer() or targ:IsNPC() then
									//self.Owner:EmitSound("Flesh.ImpactHard",55,100)								
								paininfo = DamageInfo()
								paininfo:SetDamage(pain)
								paininfo:SetDamageType(DMG_SLASH)
								paininfo:SetAttacker(self.Owner)
								paininfo:SetInflictor(self.Weapon)
						  local RandomForce = math.random(1,20)
								paininfo:SetDamageForce(slashtrace.Normal * RandomForce)
								if targ:IsPlayer() then
								targ:ViewPunch( Angle( -10, -20, 0 ) )
								end
							local blood = targ:GetBloodColor()	
						   local fleshimpact		= EffectData()
								fleshimpact:SetEntity(self.Weapon)
								fleshimpact:SetOrigin(slashtrace.HitPos)
								fleshimpact:SetNormal(slashtrace.HitPos)
								if blood >= 0 then
								fleshimpact:SetColor(blood)
								util.Effect("BloodImpact", fleshimpact)
								end
								end



	end

	end



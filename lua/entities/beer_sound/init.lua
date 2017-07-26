AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("BeerSound")
util.AddNetworkString("PlayerSoundBeer")

resource.AddFile("sound/beer/beer.wav")

function ENT:Initialize()

	self:SetModel("models/props_junk/garbage_glassbottle003a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()

	if phys:IsValid() then
		phys:Wake()
	end

end

function ENT:Use(a, c, u, v)
	net.Start("BeerSound")
		-- Acting like a hook
	net.Broadcast()

	net.Start("PlayerSoundBeer")
		-- Acting like a hook
	net.Send(c)
	
	self:Remove()
end
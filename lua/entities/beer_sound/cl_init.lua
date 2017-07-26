include("shared.lua")

function ENT:Draw()

	self:DrawModel()

end

net.Receive( "BeerSound", function()
	sound.PlayFile("sound/beer/beer.wav", "mono", function() end)
end )

net.Receive("PlayerSoundBeer", function() 
	RunConsoleCommand("say", "About that beer I owed ya...")
end )
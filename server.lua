ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local ShowNumbers = true

Citizen.CreateThread( function(source)
	local xPlayers = ESX.GetPlayers()
	while true do
		xPlayers = ESX.GetPlayers()
  
 		 if ShowNumbers then
			AmbulanceConnected = 0
			PoliceConnected = 0
			CasinoConnected = 0
			UnicornConnected = 0
			GangsConnected = 0
			MechanicConnected = 0
			LawyerConnected = 0
		else 
			AmbulanceConnected = "❌"
			PoliceConnected = "❌"
			CasinoConnected = "❌"
			UnicornConnected = "❌"
			GangsConnected = "❌"
			MechanicConnected = "❌"
			LawyerConnected = "❌"
		end
		
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			
			if xPlayer.job.name == 'ambulance' then
				if ShowNumbers then
					AmbulanceConnected = AmbulanceConnected + 1
				else
					AmbulanceConnected = "✔️"
				end
			end	
			
			if xPlayer.job.name == 'police' then
				if ShowNumbers then
					PoliceConnected = PoliceConnected + 1
				else
					PoliceConnected = "✔️"
				end
			end	
			
			if xPlayer.job.name == 'casino' then
				if ShowNumbers then
					CasinoConnected = CasinoConnected + 1
				else
					CasinoConnected = "✔️"
				end
			end
			
			if xPlayer.job.name == 'mechanic' then
					if ShowNumbers then
					MechanicConnected = MechanicConnected + 1
				else
					MechanicConnected = "✔️"
				end
			end
			
			if xPlayer.job.name == 'unicorn' then
				if ShowNumbers then
					UnicornConnected = UnicornConnected + 1
				else
					UnicornConnected = "✔️"
				end
			end
			
			if xPlayer.job.name == 'lawyer' then
				if ShowNumbers then
					LawyerConnected = LawyerConnected + 1
				else
					LawyerConnected = "✔️"
				end
			end
			
			if xPlayer.job.name == 'vagos' or xPlayer.job.name == 'motoclub' or xPlayer.job.name == 'grove' or xPlayer.job.name == 'ballas' or xPlayer.job.name == 'bishops' or xPlayer.job.name == 'mafia' then
				if ShowNumbers then
					GangsConnected = GangsConnected + 1
				else
					GangsConnected = "✔️"
				end
			end
			
		end
		
		local jobsc = "🚑:"..AmbulanceConnected.."  👮‍:"..PoliceConnected.."  🔧:"..MechanicConnected.."  💎:"..CasinoConnected.."  🍸:"..UnicornConnected.."  💀:"..GangsConnected.."  ⚖️:"..LawyerConnected		
		ExecuteCommand(('sets Jobs "%s"'):format(jobsc))
		
		Citizen.Wait(1000 * 60) -- Every Minute
	end
end)
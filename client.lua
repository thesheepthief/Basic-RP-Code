

--- No Drive Fast Drive by?

local passengerDriveBy = true  --- Can Passenger Shoot?


Citizen.CreateThread(function()
	while true do
		Wait(1)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local speed = GetEntitySpeed(vehicle)
		local mph = 2.23694
		local vehicleClass = GetVehicleClass(vehicle)
		local vehicleModel = GetEntityModel(vehicle)
			
			
		if vehicleClass ~= 15 and 16 then
		GetEntitySpeed(GetPedInVehicleSeat(GetPlayerPed(-1), false)) 
		-- If you want kmh change below
		if math.floor(speed*mph) > 40 then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)



--- Removes Police Car Spawns

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if (PlayerData.job ~= nil and (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'ambulance')) then
                  ESX.ShowNotification("Emergency vehicles are for first responders only.")
                  SetVehicleUndriveable(veh, true)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local playerLocalisation = GetEntityCoords(playerPed)
    ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 1000.0) --- Checks If Cars Within this range then removes if true
    end
end)


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(1)
      -- Common Weapon Drops
      RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
      RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
      RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
    end
end)

  --- Removes Rewards When Entering Police/Military Vehicles
  
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(1)
          id = PlayerId()
          DisablePlayerVehicleRewards(id)	
      end
end)


--- Local Traffic Control Configure To preferences # Note That This Can Trigger Multiple Car Explosions Using OneSync If Values To High

DensityMultiplier = 1.00
Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0)
          SetVehicleDensityMultiplierThisFrame(1.5)
          SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
          SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
          SetPedDensityMultiplierThisFrame(1.5)
          SetScenarioPedDensityMultiplierThisFrame(0.55)
      end
end)
  


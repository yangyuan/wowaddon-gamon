SetCVar("scriptErrors", 1, SHOW_LUA_ERRORS)

kill_lucky_yi = function()
	if not C_PetBattles.IsInBattle() then
		return
	end
	
	if C_PetBattles.IsWaitingOnOpponent() then
		return
	end
	
	local pet_active = C_PetBattles.GetActivePet(1)
	local pet_health = C_PetBattles.GetHealth(1, pet_active)
	local pet_health_enemy = C_PetBattles.GetHealth(2, 1)
	
	local pet_back_1 = 1;
	local pet_back_1_healt = 0;
	local pet_back_2 = 2;
	local pet_back_2_healt = 0;
	if pet_active == 1 then
		pet_back_1 = 3
	end
	if pet_active == 2 then
		pet_back_2 = 3
	end 
	
	pet_back_1_healt = C_PetBattles.GetHealth(1, pet_back_1)
	pet_back_2_healt = C_PetBattles.GetHealth(1, pet_back_2)
	
	if pet_back_2_healt > pet_back_1_healt then
		local temp = 0
		temp = pet_back_1
		pet_back_1 = pet_back_2
		pet_back_2 = temp
		
		temp = pet_back_1_healt
		pet_back_1_healt = pet_back_2_healt
		pet_back_2_healt = temp
	end 
	
	if pet_health < 256 then
		if pet_back_1_healt > 768 then
			C_PetBattles.ChangePet(pet_back_1)
			return
		end
	end

	if pet_health_enemy < 300 and pet_health > 650 and C_PetBattles.GetAbilityState(1, 1, 3) then
		print 'x1'
		C_PetBattles.UseAbility(3)
		return
	end
	
	if pet_health_enemy < 450 and pet_health <= 650 and C_PetBattles.GetAbilityState(1, 1, 3) then
		print 'x2'
		C_PetBattles.UseAbility(3)
		return
	end
	
	if pet_health_enemy < 140 and pet_health > 650 and C_PetBattles.GetAbilityState(1, 1, 1) then
		print 'x3'
		C_PetBattles.UseAbility(1)
		return
	end
	
	if pet_health_enemy < 210 and pet_health <= 650 and C_PetBattles.GetAbilityState(1, 1, 1) then
		print 'x4'
		C_PetBattles.UseAbility(1)
		return
	end
	
	if not PetBattleUtil_PetHasAura(2,1,918) then
		print 'x5'
		C_PetBattles.UseAbility(2)
		return
	end
	
	if C_PetBattles.GetAbilityState(1, 1, 1) then
		print 'x6'
		C_PetBattles.UseAbility(1)
		return
	end
	
	if C_PetBattles.GetAbilityState(1, 1, 3) then
		print 'x7'
		C_PetBattles.UseAbility(3)
		return
	end
	
	print 'x8'
	if not( C_PetBattles.UseAbility(2) and C_PetBattles.GetAbilityState(1, 1, 1) ) then
		print 'x9'
		C_PetBattles.ChangePet(pet_back_1)
	end
end


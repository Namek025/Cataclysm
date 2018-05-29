-- Spell Healing Bonus
-- Remuevo script spell_pal_avenging_wrath_heal_bonus
DELETE FROM spell_script_names WHERE spell_id IN (635,19750,20473,53563,82326,82327,85673,86452) AND scriptname = 'spell_pal_avenging_wrath_heal_bonus';
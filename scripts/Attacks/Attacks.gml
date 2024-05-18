// Attack struct
function Attack(_attack_obj, _final_attack_obj, _cooldown_s, _desc, _menu_spr) {
    return {
        attack_obj: _attack_obj,
		final_attack_obj: _final_attack_obj,
		cooldown_s: _cooldown_s,
		cooldown: _cooldown_s*FPS,
		description: _desc,
        menu_spr: _menu_spr,
    }
}

SoulFlame = Attack(
	oAttackSoulFlame,
	oFinalSoulFlame,
	0.3,
	"A flame created from the concentration of your connection to the magic in this world.",
	sMenuSoulFlame
)

StunShock = Attack(
	oAttackStunShock,
	oFinalSoulFlame,
	2,
	"An electrical burst with the power to stop enemies in their tracks.",
	sMenuStunShock
)

Grapes = Attack(
	oAttackGrapes,
	oFinalSoulFlame,
	0.3,
	"Your lunch!",
	sMenuGrapes
)

Push = Attack(
	oAttackPush,
	oFinalSoulFlame,
	0,
	"Pushes foes!",
	sMenuPush
)

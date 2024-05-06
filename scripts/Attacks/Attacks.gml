// Attack struct
function Attack(_atk_obj, _cooldown_s, _desc, _menu_spr) {
    return {
        atk_obj: _atk_obj,
		cooldown_s: _cooldown_s,
		cooldown: _cooldown_s*FPS,
		description: _desc,
        menu_spr: _menu_spr,
    }
}

SoulFlame = Attack(
	oAttackSoulFlame,
	0.3,
	"A flame created from the concentration of your connection to the magic in this world.",
	sMenuSoulFlame
)

StunShock = Attack(
	oAttackStunShock,
	2,
	"An electrical burst with the power to stop enemies in their tracks.",
	sMenuStunShock
)

Grapes = Attack(
	oAttackGrapes,
	0.3,
	"Your lunch!",
	sMenuGrapes
)
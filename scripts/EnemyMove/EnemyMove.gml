function EnemyMoveNone(){}

function EnemyMoveSideToSide() {
	x += 5*sin(lifetime/10);
}

function EnemyMoveUpAndDown() {
	y += 5*sin(lifetime/10);
}
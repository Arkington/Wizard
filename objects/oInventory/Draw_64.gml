/// @desc Draw inventory and set Selector position

if (live_call()) return live_result;



InvDrawMainWindow();
InvDrawInfoWindow();

if (tab == TABS.ITEMS) {
	InvDrawEquipWindow();
}
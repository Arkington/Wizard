/// @desc
function MusicOnRoomEntry() {
	switch room {
		
		// Lower Bizzaire
		case rAxelTreehouseInt:
			return NONE;
		
		case rAxelTreehouseExt:
			return musBeforeYourCourage;
		
		case rLowerBizzaire:
			return musBeforeYourCourage;
			
		case rBubblegums:
			return musBeforeYourCourage;
			
		case rGWGPathBelow:
			return NONE;

		case rCliffBench:
			return NONE;
			
		case rGreatWizardGate:
			if (global.state.GWG_OPEN) { return musSpacewalk; }
			else { return NONE; }
			
		case rGWGPathAbove:
			return musSpacewalk;
			
		case rGreatWizardCourtyard:
			return musSpacewalk;
			
		case rGreatWizardWishingWell:
			return musSpacewalk;
		
		
		// Default
		default:
			return NONE;
	}
}
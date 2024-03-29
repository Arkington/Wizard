/// @desc
if !active { exit; }

// Run code
if !complete {
	if args != NONE { script_execute_ext(to_execute, args); }
	else { to_execute(); }
	complete = true;
}
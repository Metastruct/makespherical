
/*

Copyright (C) 2012 David 'Falcqn' Hepworth
All rights not explicitly granted are reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and assosciated files 
(the "software") to use the software without restriction in any and all compatible environments, regardless of whether 
the use is part of a for-profit organisation or not. The software itself may UNDER NO CIRCUMSTANCES be sold, traded or 
monetised in any fashion whatsoever.

The software may NOT be reuploaded to any distributor or redistributed at all unless given express written consent by all 
authors and copyright holders. The software is free to modify for personal use, including but not limited to use on servers 
whether they be "for-profit" organisations or not, provided that this license is left unaltered in any way. 
Again, the software itself may UNDER NO CIRCUMSTANCES be sold, traded or monetised in any fashion whatsoever. 
Any modifications of the software may not be distributed unless either express written consent is given by the authors and
copyright holders, or the modifications are part of a "FORK" on the website "GitHub".

The software and all of its assets included are property of their respective author(s).
The software is provided "As-Is" without warranty of any kind, express or implied, including but not limited to
the warranties of fitness for a particular purpose and noninfringement. In no event shall the authors or copyright
holders be held liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise
arising from, out of, or in connection with the software or the use of other dealings in the software.
Under no circumstances may this license be removed from any of the Software's files, documentation or code.

*/

MakeSpherical = MakeSpherical or {}
local MakeSpherical = MakeSpherical

e2function void entity:makeSpherical( number radius )

	if not MakeSpherical.CanTool( this ) then return false end

	local constraintdata = MakeSpherical.CopyConstraintData( this, true )
	MakeSpherical.ApplySphericalCollisionsE2( this, true, radius, nil )
	timer.Simple( 0.01, function() MakeSpherical.ApplyConstraintData( this, constraintdata ) end )

end

e2function void entity:removeSpherical()

	if not MakeSpherical.CanTool( this ) then return false end

	local constraintdata = MakeSpherical.CopyConstraintData( this, true )
	MakeSpherical.ApplySphericalCollisionsE2( this, false, 0, nil )
	timer.Simple( 0.01, function() MakeSpherical.ApplyConstraintData( this, constraintdata ) end )
	
end
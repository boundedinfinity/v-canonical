module name

import canonical.id as cid

interface Repository {
	get(cid.Id) ?Name
	save(Name) !cid.Id
	close() !
}



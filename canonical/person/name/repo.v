module name

import canonical.id as cid

pub interface Repository {
	get(cid.Id) !Name
	save(Name) !
}


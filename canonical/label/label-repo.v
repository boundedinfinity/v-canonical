module label

import canonical.id as cid

interface Repository {
	get(cid.Id) ?Label
	save(Label) !cid.Id
	close() !
}


module affix

import canonical.id

pub struct Category {
pub mut:
	id          id.Id
	name        string
	description ?string
}

pub fn(this Category) matches(term string) bool {
	return this.name.to_lower() == term.to_lower()
}

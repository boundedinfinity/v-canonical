module affix

import canonical.id

pub struct Category {
pub:
	id id.Id = id.new()
pub mut:
	name        string @[required]
	description ?string
}


pub fn (this Category) matches(term string) bool {
	return this.name.to_lower() == term.to_lower()
}


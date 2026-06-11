module label

import canonical.id

pub struct Label {
pub mut:
	id          id.Id
	name        string
	description ?string
}

pub fn (this Label) matches(term string) bool {
	return this.name.to_lower() == term.to_lower()
}


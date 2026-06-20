module label

import canonical.id

pub struct Label {
pub:
	id id.Id = id.new() @[required]
pub mut:
	name          string @[required]
	abbreviations ?[]string
	description   ?string
}

pub fn (this Label) matches(term string) bool {
	lower := term.to_lower()

	if this.name.to_lower() == lower {
		return true
	}

	if abbrev := this.abbreviations {
		return abbrev.any(it.to_lower() == lower)
	}

	return false
}

pub type Labels = Label | []Label | LabelGroup

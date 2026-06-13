module affix

import canonical.id

struct Affix {
pub:
	id id.Id = id.new()
pub mut:
	name          string @[required]
	abbreviations ?[]string
	description   ?string
	category      Category @[required]
}

pub fn (this Affix) matches(term string) bool {
	lower := term.to_lower()

	if this.name.to_lower() == lower {
		return true
	}

	if abbrev := this.abbreviations {
		return abbrev.any(it.to_lower() == lower)
	}

	return false
}

pub struct Prefix {
	Affix
}

pub struct Suffix {
	Affix
}

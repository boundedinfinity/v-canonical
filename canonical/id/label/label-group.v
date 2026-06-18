module label

import canonical.id

pub struct LabelGroup {
pub mut:
	id            id.Id
	name          string @[required]
	abbreviations ?[]string
	description   ?string
	labels        ?[]Label
}

pub fn (this LabelGroup) matches(term string) bool {
	lower := term.to_lower()

	if this.name.to_lower() == lower {
		return true
	}

	if abbrev := this.abbreviations {
		if abbrev.any(it.to_lower() == lower) {
			return true
		}
	}

	if labels := this.labels {
		if labels.any(it.matches(term)) {
			return true
		}
	}

	return false
}



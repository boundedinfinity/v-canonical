module label

import canonical.id

pub struct LabelGroup {
pub:
	id id.Id = id.new() @[required]
pub mut:
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

pub fn (mut this LabelGroup) add(labels Labels) {
	mut current := if ls := this.labels { ls.clone() } else { []Label{} }

	match labels {
		Label {
			current << labels
		}
		[]Label {
			current << labels
		}
		LabelGroup {
			current << labels.labels or { []Label{} }
		}
	}

	this.labels = current
}


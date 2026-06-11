module affix

import canonical.id

struct Affix {
pub mut:
	id            id.Id
	name          string
	abbreviations ?[]string
	description   ?string
	category      Category
}

pub struct Prefix {
	Affix
}

pub struct Suffix {
	Affix
}

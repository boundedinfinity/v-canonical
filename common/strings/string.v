module strings

pub type String = string

pub fn (this String) uncaptialize() string {
	match this.len {
		0 { return this }
		1 { return this.to_lower() }
		else { return this[..0].to_lower() + this[1..] }
	}
}

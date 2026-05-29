module strings

pub fn (this String) camel_to_snake_upper() string {
	return this.camel_to_snake().to_upper()
}

pub fn (this String) camel_to_kebab() string {
	return this.camel_to_snake().replace('_', '-')
}

pub fn (this String) camel_to_kebab_upper() string {
	return this.camel_to_snake_upper().replace('_', '-')
}

pub fn (this String) camel_to_pascal() string {
	return this.capitalize()
}

pub fn (this String) kebab_to_camel() string {
	return this.kebab_to_snake().to_lower().snake_to_camel()
}

pub fn (this String) kebab_to_snake() string {
	return this.replace('-', '_')
}

pub fn (this String) pascal_to_camel() string {
	return this.uncaptialize()
}

module case

import common.strings as cstrings
import strings

// ////////////////////////////////////////////////////////////////////////////////////////////////
// camel
// ////////////////////////////////////////////////////////////////////////////////////////////////

pub fn camel_to_kebab(s string) string {
	return  camel_to_phrase(s).replace(' ', '-')
}

pub fn camel_to_kebab_upper(s string) string {
	return camel_to_kebab(s).to_upper()
}

pub fn camel_to_pascal(s string) string {
	return s.capitalize()
}

pub fn camel_to_phrase(s string) string {
	return strings.split_capital(s).join(' ').to_lower()
}

pub fn camel_to_phrase_title(s string) string {
	return camel_to_phrase(s).title()
}

pub fn camel_to_snake(s string) string {
	return camel_to_phrase(s).replace(' ', '_')
}

pub fn camel_to_snake_upper(s string) string {
	return camel_to_snake(s).to_upper()
}

// ////////////////////////////////////////////////////////////////////////////////////////////////
// kebab
// ////////////////////////////////////////////////////////////////////////////////////////////////

pub fn kebab_to_camel(s string) string {
	return cstrings.uncapitalize(kebab_to_pascal(s))
}

pub fn kebab_to_pascal(s string) string {
	return kebab_to_phrase_title(s).replace(' ', '')
}

pub fn kebab_to_phrase(s string) string {
	return s.replace('-', ' ').to_lower()
}

pub fn kebab_to_phrase_title(s string) string {
	return kebab_to_phrase(s).title()
}

pub fn kebab_to_snake(s string) string {
	return s.replace('-', '_').to_lower()
}

pub fn kebab_to_snake_upper(s string) string {
	return s.replace('-', '_').to_upper()
}

// ////////////////////////////////////////////////////////////////////////////////////////////////
// pascal
// ////////////////////////////////////////////////////////////////////////////////////////////////

pub fn pascal_to_camel(s string) string {
	return cstrings.uncapitalize(s)
}

pub fn pascal_to_kebab(s string) string {
	return pascal_to_phrase(s).replace(' ', '-')
}

pub fn pascal_to_kebab_upper(s string) string {
	return strings.split_capital(s).join('-').to_upper()
}

pub fn pascal_to_phrase(s string) string {
	return strings.split_capital(s).join(' ').to_lower()
}

pub fn pascal_to_phrase_title(s string) string {
	return pascal_to_phrase(s).title()
}

pub fn pascal_to_snake(s string) string {
	return pascal_to_phrase(s).replace(' ', '_')
}

pub fn pascal_to_snake_upper(s string) string {
	return strings.split_capital(s).join('_').to_upper()
}

// ////////////////////////////////////////////////////////////////////////////////////////////////
// phrase
// ////////////////////////////////////////////////////////////////////////////////////////////////

pub fn phrase_to_camel(s string) string {
	return cstrings.uncapitalize(phrase_to_pascal(s))
}

pub fn phrase_to_kebab(s string) string {
	return s.to_lower().replace(' ', '-')
}

pub fn phrase_to_kebab_upper(s string) string {
	return s.to_upper().replace(' ', '-')
}

pub fn phrase_to_pascal(s string) string {
	return s.to_lower().title().replace(' ', '')
}

pub fn phrase_to_snake(s string) string {
	return s.to_lower().replace(' ', '_')
}

pub fn phrase_to_snake_upper(s string) string {
	return s.to_upper().replace(' ', '_')
}

// ////////////////////////////////////////////////////////////////////////////////////////////////
// snake
// ////////////////////////////////////////////////////////////////////////////////////////////////

pub fn snake_to_camel(s string) string {
	return cstrings.uncapitalize(snake_to_phrase(s).title().replace(' ', ''))
}

pub fn snake_to_kabab(s string) string {
	return s.replace('_', '-').to_lower()
}

pub fn snake_to_kabab_upper(s string) string {
	return s.replace('_', '-').to_upper()
}

pub fn snake_to_pascal(s string) string {
	return snake_to_phrase_title(s).replace(' ', '')
}

pub fn snake_to_phrase(s string) string {
	return s.replace('_', ' ').to_lower()
}

pub fn snake_to_phrase_title(s string) string {
	return s.replace('_', ' ').title()
}

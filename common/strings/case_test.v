module strings_test

import common.strings as s

fn test_join() {
	assert s.String('Abcd').camel_to_kebab() == 'abcd'
	assert s.String('Abcd').camel_to_kebab_upper() == 'ABCD'
	assert s.String('aBcd').camel_to_kebab() == 'a-bcd'
	assert s.String('aBcd').camel_to_kebab_upper() == 'A-BCD'
	assert s.String('a').camel_to_kebab() == 'a'
	assert s.String('').camel_to_kebab() == ''

	assert s.String('Abcd').camel_to_pascal() == 'Abcd'
	assert s.String('aBcd').camel_to_pascal() == 'ABcd'
	assert s.String('abCd').camel_to_pascal() == 'AbCd'
	assert s.String('a').camel_to_pascal() == 'A'
	assert s.String('').camel_to_pascal() == ''

	assert s.String('Abcd').camel_to_snake() == 'abcd'
	assert s.String('Abcd').camel_to_snake_upper() == 'ABCD'
	assert s.String('aBcd').camel_to_snake() == 'a_bcd'
	assert s.String('aBcd').camel_to_snake_upper() == 'A_BCD'

	// assert strings.String('aBcd').camel_to_kebab() == 'a-bcd'
	// assert strings.String('aBcd').camel_to_kebab_upper() == 'A-BCD'

	// assert strings.String('AB-CD').kebab_to_camel() == 'abCd'
	// assert strings.String('ab-cd').kebab_to_camel() == 'abCd'

	// assert strings.String('A-BCD').kebab_to_snake() == 'A_BCD'
	// assert strings.String('a-bcd').kebab_to_snake() == 'a_bcd'
}

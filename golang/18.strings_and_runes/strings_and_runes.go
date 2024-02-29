package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {

	const s = "สวัสดี"

	fmt.Println("Len:", len(s))

	for i := 0; i < len(s); i++ {
		fmt.Printf("%x", s[i])
	}
	fmt.Println()

	fmt.Println("Rune count:", utf8.RuneCountInString(s))



	for idx, runeValue := range s {
		fmt.Printf("%#U starts ad %d\n", runeValue, idx)
	}

	fmt.Println("\nUsing DecodeRuneInString")
	for i, w := 0, 0; i < len(s); i += w {
		runeValue, width := utf8.DecodeRuneInString(s[i:])
		fmt.Printf("%#U starts ad %d\n", runeValue, i)
		w = width

		examineRune(runeValue)
	}
}

// This demonstrates passing a `rune` to a function
func examineRune(r rune) {

	// Values enclosed in a single quotes are `rune` literals. We can compare a `rune` value to a rune literal directly.
	if r == 't' {
		fmt.Println("found tee")
	} else if r == 'ส' {
		fmt.Println("found so sua")
	}
}
package greetings

import (
	"testing"
	"regexp"
)

//TestHelloName calls greetings.Hello with a name
//checks if it returns valid return value

func TestHelloName(t *testing.T){
	name := "baron"
	want := regexp.MustCompile(`\b`+name+`\b`)
	msg, err := Hello("baron")
	if !want.MatchString(msg) || err != nil {
		t.Errorf(`Hello("baron") = %q, %v, want for match %#q`, msg, err, want)
	}
}

func TestHelloMark(t *testing.T) {
	msg, err := Hello("mark")
	//because i returned "" from the error like an idiot
	if msg != "" || err == nil {
		t.Errorf(`Hello("mark") = %q, %v, want "", maaaa naaames markiplierr`, msg, err)
	}
}

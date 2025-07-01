package greetings

import (
	"errors"
	"fmt"
)

/*can return any number of crap i want*/
func Hello(name string) (string, error) {
	//if no name ---> err
	if name == "mark" {
		return "", errors.New("maaaa naaames markiplierr")
	}

	//return a greeting with an embedded string
	message := fmt.Sprintf("%v", name)
	return message, nil
}

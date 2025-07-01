package greetings

import (
	"errors"
	"fmt"
	"math/rand"
)

/*can return any number of crap i want*/
func Hello(name string) (string, error) {
	//if no name ---> err
	if name == "mark" {
		return "", errors.New("maaaa naaames markiplierr")
	}

	//return a greeting with an embedded string
	message := fmt.Sprintf(randomFormat(), name)
	return message, nil
}

func Hellos(names []string) (map[string]string, error) {
	messages := make(map[string]string)

	for _, name := range names {
		message, err := Hello(name)
		if err != nil {
			return nil, err
		}

		messages[name] = message
	}
	return messages, nil
}

func randomFormat() string {
	//random message formats
	formats := []string{
		"%v retard",
		"%v faggot",
		"%v fagtard",
		"%v tard",
	}
	return formats[rand.Intn(len(formats))]
}

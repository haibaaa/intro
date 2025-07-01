package main
import (
	"fmt"
	"log"
	"example.com/greetings"
)

func main(){
	//log prefix and flag to disable printing
	log.SetPrefix("greetings: ")
	log.SetFlags(0)

	//implement err handling
	//message, err := greetings.Hello("hello, people ma name's markiplier")
	message, err := greetings.Hello("mark")
	if err != nil {
		log.Fatal(err)
	}

	//get a greeting message and print it
	fmt.Println(message)
}

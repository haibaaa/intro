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
	names := []string{"ma buoy", "ya buoy", "ma gal", "ya gal"}
	messages, err := greetings.Hellos(names)
	if err != nil {
		log.Fatal(err)
	}

	//get a greeting message and print it
	fmt.Println(messages)
}

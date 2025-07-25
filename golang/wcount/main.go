package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
)

func main() {
	var f io.Reader
	if len(os.Args) < 2 {
		f = os.Stdin
	} else {

		file, err := os.Open(os.Args[1])
		if err != nil {
			fmt.Println(err)
		}
		defer file.Close()

		f = file
	}

	scanner := bufio.NewScanner(f)
	scanner.Split(bufio.ScanWords)

	var count int = 0
	for scanner.Scan() {
		count++
	}

	if err := scanner.Err(); err != nil {
		println(err)
		return
	}

	fmt.Println(count)
}

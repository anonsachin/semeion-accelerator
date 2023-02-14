package main

import (
	"flag"
	"log"
	"os"
	"strings"
)

func main() {
	location := flag.String("loaction","test_data.mem","specify the loaction of the file.")
	flag.Parse()

	data, err := os.ReadFile(*location)
	if err != nil {
		log.Fatalf("Unable to read file %v",err)
	}

	new := strings.ReplaceAll(string(data),"\t","")

	f, err := os.Create("image_data.mem")
	if err != nil {
		log.Fatalf("Unable to create file %v",err)
	}

	_, err = f.Write([]byte(new))
	if err != nil {
		log.Fatalf("Unable to write to file %v",err)
	}

}
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path"
	"sync"

	"github.com/spf13/cobra"
)

func main() {
	rootCmd := &cobra.Command{}
	rootCmd.AddCommand(formatJsonsCmd())

	if err := rootCmd.Execute(); err != nil {
		log.Fatalf("execute: %v\n", err)
	}
}

func formatJsonsCmd() *cobra.Command {
	const flagDir = "dir"

	cmd := &cobra.Command{
		Use:   "format-jsons",
		Short: "Format JSON files in directory",
		Run: func(cmd *cobra.Command, args []string) {
			dir, err := cmd.Flags().GetString(flagDir)
			if err != nil {
				log.Fatalf("get flag: %v\n", err)
			}

			paths, err := os.ReadDir(dir)
			if err != nil {
				log.Fatalf("read dir: %v\n", err)
			}

			var files []string
			for _, p := range paths {
				if !p.IsDir() {
					files = append(files, path.Join(dir, p.Name()))
				}
			}

			var wg sync.WaitGroup
			for _, f := range files {
				wg.Add(1)
				go func(f string) {
					defer wg.Done()

					if err := formatJsonFile(f); err != nil {
						fmt.Printf("%s: %v\n", f, err)
					} else {
						fmt.Println(f)
					}
				}(f)
			}

			wg.Wait()
		},
	}

	cmd.Flags().String(flagDir, "", "Formatting JSON files directory")

	return cmd
}

func formatJsonFile(f string) error {
	dat, err := os.ReadFile(f)
	if err != nil {
		return fmt.Errorf("read file: %v", err)
	}

	var obj any
	err = json.Unmarshal(dat, &obj)
	if err != nil {
		return fmt.Errorf("unmarshal: %v", err)
	}

	var buf bytes.Buffer
	encoder := json.NewEncoder(&buf)
	encoder.SetEscapeHTML(false)

	err = encoder.Encode(obj)
	if err != nil {
		return fmt.Errorf("encode: %v", err)
	}

	if err = os.WriteFile(f, buf.Bytes(), 0644); err != nil {
		return fmt.Errorf("write file: %v", err)
	}

	return nil
}

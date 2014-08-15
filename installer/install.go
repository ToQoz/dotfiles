package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
)

var (
	ignore   = flag.String("i", "^.git|.DS_Store$", "pattern for ignore dotfiles")
	exitCode = 0
)

func report(err error) {
	fmt.Fprintln(os.Stderr, err.Error())
	exitCode = 2
}

func main() {
	defer os.Exit(exitCode)

	flag.Parse()

	wd, err := os.Getwd()
	if err != nil {
		report(err)
		return
	}

	ignoreRe, err := regexp.Compile(*ignore)
	if err != nil {
		report(err)
		return
	}

	files, err := ioutil.ReadDir(wd)
	if err != nil {
		report(err)
		return
	}

	for _, file := range files {
		if !strings.HasPrefix(file.Name(), ".") {
			continue
		}

		if ignoreRe.MatchString(file.Name()) {
			continue
		}

		to := filepath.Join(wd, file.Name())
		if _, err := os.Stat(to); err != nil {
			report(err)
			continue
		}

		from := filepath.Join(os.Getenv("HOME"), file.Name())
		if _, err := os.Stat(from); err == nil {
			report(fmt.Errorf("%s is already exists", from))
			continue
		}

		err = runLink(from, to)
		if err != nil {
			report(err)
			return
		}

		fmt.Fprintf(os.Stdout, "%s -> %s\n", from, to)
	}

	// Install settings of Karabiner(keyremap4macbook)
	from := filepath.Join(wd, "os", "keyremap4macbook", "private.xml")
	to := filepath.Join(os.Getenv("HOME"), "Library", `Application\ Support`, "Karabiner", "private.xml")
	err = runLink(from, to)
	if err != nil {
		report(err)
		return
	}

}

func runLink(from, to string) error {
	cmd := exec.Command("/bin/ln", "-sf", to, from)
	return cmd.Run()
}

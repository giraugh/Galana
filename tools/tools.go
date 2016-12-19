package main

import (
  "fmt"
  "path/filepath"
  "os"
  "sort"
  "./go-version"
  "io"
  "flag"
  "os/exec"
  "regexp"
)

type ByVersion []string

func (s ByVersion) Len() int {
    return len(s)
}
func (s ByVersion) Swap(i, j int) {
    s[i], s[j] = s[j], s[i]
}
func (s ByVersion) Less(i, j int) bool {
    return version.Compare(s[i], s[j], ">")
}

var command string
var files []string
var file string

func main() {
  flag.Parse()
  command = flag.Arg(0)

  //Create Latest
  if command == "latest" {
    createLatest()
    return
  }

  //Print latest version
  if command == "versions" {
    printVersions()
    return
  }

  //Create Latest
  if command == "push" {
    pushToButler()
    return
  }

  //Create Latest
  if command == "push-latest" {
    createLatest()
    pushToButler()
    return
  }
}

func createLatest() {
  //Get Latest Windows and copy it
  file = getHighestVersion("../builds/win", ".exe")
  copyFileContents(file, "../builds/latest_win/Galana.exe")
  fmt.Println("Windows Success")

  //Get Latest Android and copy it
  file = getHighestVersion("../builds/and", ".apk")
  copyFileContents(file, "../builds/latest_and/Galana.apk")
  fmt.Println("Android Success")
}

func pushToButler() {
  //Windows First
  exec.Command("cmd", "/C", "start", "/wait", "butler", "push", "../builds/latest_win", "tdos/galana:win-beta", "--userversion", getHighestVersionString("../builds/win", ".exe")).Run()

  //Windows First
  exec.Command("cmd", "/C", "start", "/wait", "butler", "push", "../builds/latest_and", "tdos/galana:android-beta", "--userversion", getHighestVersionString("../builds/and", ".apk")).Run()
}

func printVersions() {
  winv := getHighestVersionString("../builds/win", ".exe")
  andv := getHighestVersionString("../builds/and", ".apk")

  fmt.Println("Windows: " + winv)
  fmt.Println("Android: " + andv)
}

func getHighestVersion(dir, ext string) string {
  //Reset files
  files = make([]string, 0)

  //Get all files
  filepath.Walk(dir, collateFiles)

  //Remove all files that don't have extension
  b := files[:0]
  for _, x := range files {
      if hasExtension(x, ext) {
          b = append(b, x)
      }
  }
  files = b

  //Sort by version
  sort.Sort(ByVersion(files))

  //Did we get any files?
  if len(files) == 0 {
    fmt.Println("No files found")
    return ""
  }

  return files[0]
}

func getHighestVersionString(dir, ext string) string {
  p := getHighestVersion(dir, ext)
  vExp := regexp.MustCompile("[\\s\\S]*\\\\v([0-9]+\\.[0-9]+\\.[0-9]+)[\\s\\S]*")
  p = vExp.ReplaceAllString(p, "$1")
  return p
}

func collateFiles(path string, f os.FileInfo, err error) error {
  files = append(files, path)
	return nil
}

func hasExtension(str, ext string) bool {
  el := len(ext)
  return str[len(str)-el:] == ext
}

func copyFileContents(src, dst string) (err error) {
    in, err := os.Open(src)
    if err != nil {
        return
    }
    defer in.Close()
    out, err := os.Create(dst)
    if err != nil {
        return
    }
    defer func() {
        cerr := out.Close()
        if err == nil {
            err = cerr
        }
    }()
    if _, err = io.Copy(out, in); err != nil {
        return
    }
    err = out.Sync()
    return
}

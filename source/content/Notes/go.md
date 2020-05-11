---
title: "Go"
date: 2020-05-11T11:04:57+01:00
---

#### References
The following notes were extracted, adjusted or extended from the following references.

- [Go mastering by Mihalis Tsoukalos](https://www.packtpub.com/networking-and-servers/mastering-go)


### General

**1. Go inserts only a semicolon at the end of a "{"**

```bash
 func main()
 {              // <-- this will trigger error
    ....
 }
```

```bash
 func main(){              // <-- this will  NOT trigger error
    ....
 }
```

**2. Install and clean packages**

```bash
$ go get -v github.com/mastsoud/go/package_name
.....
$ go clean -i -v -x package_name
$ rm -rf ~/go/src/github.com/mastsoud/go/package_name

```

**3. Stdin/out/err**

| Go       | Unix                                             |
|----------|--------------------------------------------------|
|os.Stdin  |  stdin   -->  /dev/stdin  -->  /proc/self/fd/0   | 
|os.Stdout | stdout   -->  /dev/stdout  -->  /proc/self/fd/1  | 
|os.Stderr | stderr   -->  /dev/stderr  -->  /proc/self/fd/2  | 


**4. Reading input**

```bash
package main
import (
    "bufio"
    "fmt"
    "os"
)

func main(){
    var f *os.File
    f = os.Stdin
    defer f.Close()
    scanner := bufio.NewScanner(f)
    for scanner.Scan() {
        fmt.Println(">", scanner.Text())
    }
}
```

**5. Logs**

- rsyslogd configuration

```bash
$ grep -v "#" /etc/rsyslog.conf
```

- Syslog

```bash
package main
import (
    "fmt"
    "log"
    "log/syslog"
    "os"
    "path/filepath"
)
func main() {
    programName := filepath.Base(os.Args[0])
    sysLog, err := syslog.New(syslog.LOG_INFO|syslog.LOG_LOCAL7,programName)
    if err != nil {
        log.Fatal(err)
    } else {
        log.SetOutput(sysLog)
    }
    log.Println("LOG_INFO + LOG_LOCAL7: Logging in Go!")
    sysLog, err = syslog.New(syslog.LOG_MAIL, "Some program!")
    if err != nil {
        log.Fatal(err)
    } else {
        log.SetOutput(sysLog)
    }
    log.Println("LOG_MAIL: Logging in Go!")
    fmt.Println("Will you see this?")
}

```

**6. Errors**

- Error types

```bash
package main
import (
    "errors"
    "fmt"
)
func returnError(a, b int) error {
    if a == b {
        err := errors.New("Error in returnError() function!")
        return err
    } else {
        return nil
    }
}

func main() {
    err := returnError(1, 2)
    if err == nil {
    fmt.Println("returnError() ended normally!")
        fmt.Println(err)
    }
    err = returnError(10, 10)
    if err == nil {
        fmt.Println("returnError() ended normally!")
    } else {
        fmt.Println(err)
    }
    if err.Error() == "Error in returnError() function!" {
        fmt.Println("!!")
    }
}

```

- Typical handling of errors

```bash
   if err != nil {
        fmt.Println(err)  or  log.Println(err)    or   panic(err)
        os.Exit(10)
    } 
```

- Example

```bash
package main
import (
    "errors"
    "fmt"
    "os"
    "strconv"
)
func main() {
    if len(os.Args) == 1 {
        fmt.Println("Please give one or more floats.")
        os.Exit(1)
    }
    arguments := os.Args
    var err error = errors.New("An error")
    k := 1
    var n float64
    for err != nil {
        if k >= len(arguments) {
            fmt.Println("None of the arguments is a float!")
            return
        }
        n, err = strconv.ParseFloat(arguments[k], 64)
        k++
    }
    min, max := n, n
    for i := 2; i < len(arguments); i++ {
        n, err := strconv.ParseFloat(arguments[i], 64)
        if err == nil {
            if n < min {
                min = n
            }
            if n > max {
                max = n
            }
        }
    }
    fmt.Println("Min:", min)
    fmt.Println("Max:", max)
}

```

**7. Using docker**

- Dockerfile

```bash
FROM golang:alpine
RUN mkdir /files
COPY hw.go /files
WORKDIR /file
RUN go build -o /files/hw hw.go
ENTRYPOINT ["/files/hw"]
```

```bash
$ docker build -t go_hw:v1 .
$ docker run go_hw:v1
```

### Go internals

**1. Go compiler**

- Compiling source file

```bash
$ go tool compile sourceFile.go
$ ls -ltr sourceFile.o
```

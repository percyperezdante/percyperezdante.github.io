package main
import (
    "fmt"
)

type XY struct{
    x int
    y int
}

func returnPointer(x,y int) *XY {
    x++
    y++
    return &XY{x,y}
}
func returnStruct(x,y int) XY {
    x--
    y--
    return XY{x,y}
}
func main(){
    s1:=returnPointer(3,4)
    s2:=returnStruct(3,4)
    fmt.Println((*s1).x)
    fmt.Println(s2.x)
}




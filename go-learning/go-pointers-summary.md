## ✅ Go pointers summary

- **Go always passes arguments by value**, but the value can be a pointer (i.e., an address).
- Use a **pointer (`*T`)** when:
  - You want to **modify** the original value inside a function or method.
  - You want to **avoid copying** large structs for performance.

---

### Struct methods

- Use **pointer receivers** if:
  - You need to modify the struct.
  - You want to avoid copying large structs.
- Use **value receivers** if:
  - You don’t need to modify the struct.
  - The struct is small and copying is cheap.

---

### Slices, maps, channels

- Already reference types → no pointer needed to modify contents.

---

### Interfaces

- Interfaces always hold pointers internally and are always passed by value in Go.

---

## 🧑‍💻 Examples

### Function with pointer argument

```go
func modify(x *int) {
*x = 10
}

func main() {
a := 5
modify(&a) // pass address of a
fmt.Println(a) // prints 10
}
```

---

### Passing a struct pointer to avoid copy

```go
type Big struct { Data [10000]int }

func process(b *Big) {
b.Data[0] = 1 // modifies original
}

func main() {
var b Big
process(&b) // pass address
fmt.Println(b.Data[0]) // prints 1
}
```

---

### Method receivers

```go
type Point struct {
X, Y int
}

// Value receiver: does not modify original
func (p Point) MoveByValue(dx, dy int) {
p.X += dx
p.Y += dy
}

// Pointer receiver: modifies original
func (p *Point) MoveByPointer(dx, dy int) {
p.X += dx
p.Y += dy
}

func main() {
p := Point{1, 2}

    p.MoveByValue(10, 10)
    fmt.Println(p) // prints {1 2}, original unchanged

    p.MoveByPointer(10, 10)
    fmt.Println(p) // prints {11 12}, original changed

}
```

---

## 📝 Cheat sheet

| Situation               | Pointer? | Why                             |
| ----------------------- | -------- | ------------------------------- |
| Modify original value   | ✅       | Need to change caller's data    |
| Avoid big copy          | ✅       | More efficient                  |
| Just read, small struct | ❌       | Copy is fine                    |
| Slice/map/channel       | ❌       | Already references              |
| Interface type          | ❌       | Already internally uses pointer |

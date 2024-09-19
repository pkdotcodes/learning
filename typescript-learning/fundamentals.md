## 1. Type Inference and Type Casting

- Type Inference:
  - TypeScript automatically determines the type of a variable based on its initialization value.
  - You don't always have to explicitly specify types for variables; TypeScript infers them from their usage.
- Example:

```typescript
let age = 25; // TypeScript infers `age` as number
let name = "John"; // TypeScript infers `name` as string
```

- Type Casting:
  - Type casting (type assertion) allows you to explicitly specify the type of a value.
  - Useful when TypeScript cannot infer the correct type or when you want to override its inference.
- Example:

```typescript
let userInput: unknown = "Hello";
let strLength = (userInput as string).length;
// Type casting to assert `userInput` as string
```

## 2. Typing Variables and Functions

- Typing Variables:
  - Use a colon followed by the type to type variables.
- Example:

```typescript
let age: number = 25;
```

- Typing Functions:
  - Specify types for function arguments and return types.
- Example:

```typescript
function add(a: number, b: number): number {
  return a + b;
}
```

## 3. Objects, Arrays, and Tuples

- Objects:
  - Represent a collection of key-value pairs.
  - Each key is a string, and each value can be of any type.
    Example:

```typescript
let person: { name: string; age: number } = { name: "Alice", age: 30 };
```

- Arrays:
  - Store collections of similar items.
  - Specify the type of elements that an array should contain.
    Example:

```typescript
let numbers: number[] = [1, 2, 3, 4, 5];
```

- Tuples:
  - Arrays with fixed lengths and specific element types for each position.
  - Express arrays where the type of a fixed number of elements is known, but need not be the same.
  - Tuples are useful when you want to ensure a specific order and type of elements in an array-like structure.
- Example:

```typescript
let person: [string, number] = ["Alice", 30];
```

- Index Signature:
  - Allows defining a type for objects where you can specify the type of values for any arbitrary property key.
  - Useful when the properties of an object are dynamic and cannot be known beforehand.
- Example:

```typescript
 const phones: {
	 [k: string]: {
		 country: string
		 area: string
		 number: string
	 }
 } = home: { country: "+1", area: "211", number: "652-4515" },
	 work: { country: "+1", area: "670", number: "752-5856" },
	 fax: { country: "+1", area: "322", number: "525-4357" },
```

- Readonly:
  - Indicates that a property or array should not be modified after initialization.
  - Prevents accidental modification of data, enhancing code reliability.
- Example:

```typescript
const roNumPair: readonly [number, number] = [4, 5];
roNumPair.length;
roNumPair.push(6); // [4, 5, 6] //! Not allowed
roNumPair.pop(); // [4, 5] //! Not allowed
```

## 4. Union and Intersection Types

- Union Types:
  - Allow a variable to hold values of different types.
  - Denoted by the `|` symbol between types.
  - Useful when a variable can accept multiple types of values.
- Example:

```typescript
let result: string | number;
result = "success"; // Valid
result = 10; // Valid
result = true;
// Error: Type 'boolean' is not assignable to type 'string | number'.
```

- Intersection Types:
  - Combine multiple types into one.
  - Denoted by the `&` symbol between types.
  - The resulting type contains all properties and methods of each type.
- Example:

```typescript
type Printable = {
  print(): void;
};

type Loggable = {
  log(): void;
};

function combine(obj: Printable & Loggable): void {
  obj.print();
  obj.log();
}

let obj = {
  print() {
    console.log("Printing...");
  },
  log() {
    console.log("Logging...");
  },
};
combine(obj); // Outputs: "Printing..." and "Logging..."
```

## 5. \*\*Interface and Type Aliases

- Interface:
  - Define a blueprint for objects, describing the properties and methods they should have.
  - Used for defining contracts within your codebase, promoting consistency and maintainability.
  - Can be extended and implemented by other interfaces or classes.
- Example:

```typescript
interface Person {
  name: string;
  age: number;
  greet(): void;
}

class Student implements Person {
  constructor(
    public name: string,
    public age: number,
  ) {}
  greet() {
    console.log(`Hello, my name is ${this.name} and 
	        I'm ${this.age} years old.`);
  }
}

let student = new Student("Alice", 25);
student.greet(); // Outputs: "Hello, my name is Alice and I'm 25 years old."
```

- Type Aliases:
  - Create custom names for types to improve readability and maintainability.
  - Used to define complex types or combinations of existing types.
  - Can represent primitive types, union types, intersection types, and more.
- Example:

```typescript
type ID = string | number;
type Status = "active" | "inactive";

interface User {
  id: ID;
  name: string;
  status: Status;
}

let user: User = {
  id: 123,
  name: "John",
  status: "active",
};
```

- Inheritance using intersection types
  - Intersection types (`&`) in TypeScript enable combining properties and methods from multiple types into a single type.
  - When two types are intersected, the resulting type includes all properties and methods from each type.
  - This can be used to simulate inheritance-like behavior by extending one type with the properties and methods of another type.
- Example:

```typescript
type Animal = {
  name: string;
  age: number;
};

type Dog = Animal & {
  breed: string;
  bark(): void;
};

let myDog: Dog = {
  name: "Buddy",
  age: 3,
  breed: "Golden Retriever",
  bark() {
    console.log("Woof!");
  },
};

console.log(myDog.name); // Outputs: Buddy
console.log(myDog.age); // Outputs: 3
console.log(myDog.breed); // Outputs: Golden Retriever
myDog.bark(); // Outputs: Woof!
```

## 6. Type Queries

**Type Queries with `keyof`, `typeof`, and Indexed Access Types**

- `keyof` Operator:
  - Allows you to obtain the union type of all property names of a given type.
  - Useful for creating generic functions or types that operate on object properties dynamically.
- `typeof` Operator:
  - Returns the type of a variable, object, or function.
  - Useful for extracting the type of an existing entity without explicitly specifying it.
- Indexed Access Types:
  - Allow accessing the type of a specific property within another type dynamically using square brackets.
  - Useful for creating generic types that depend on properties of other types.
  - Example:

```typescript
interface Person {
  name: string;
  age: number;
}

let propertyName: keyof Person = "name";
// Type of 'propertyName' is 'name' | 'age'

let person: Person = {
  name: "Alice",
  age: 30,
};

type NameType = typeof person.name; // Type of 'NameType' is 'string'
type AgeType = (typeof person)["age"]; // Type of 'AgeType' is 'number'
type PersonProperty = Person["name"]; // Type of 'PersonProperty' is 'string'
```

In this example:

- `keyof Person` yields a union type `'name' | 'age'`, representing the possible property names of the `Person` interface.
- `typeof person.name` returns the type `string`, representing the type of the `name` property in the `person` object.
- `typeof person['age']` is equivalent to `typeof person.age`, both yielding the type `number`.
- `Person['name']` returns the type `string`, which is the type of the `name` property in the `Person` interface.

## 7. Callables, Constructables, and Function Overloads

- **Callables:**
  - Refers to types that can be invoked with function-call syntax.
  - This includes functions, methods, and objects with a `call` or `apply` method.
- **Constructables:**
  - Refers to types that can be invoked with the `new` keyword to create new instances.
  - Typically, classes or constructor functions are constructables.
- **Function Overloads:**
  - Allows defining multiple function signatures for a single function declaration.
  - Useful when a function can accept different parameter types or return different types based on input.
- Example:

```typescript
// Callable type
type Logger = (message: string) => void;

// Constructable class
class Person {
  constructor(public name: string) {}
  greet() {
    console.log(`Hello, my name is ${this.name}.`);
  }
}

// Function with overloads
function display(value: string): void;
function display(value: number): string;
function display(value: string | number): string | void {
  if (typeof value === "string") {
    console.log(`String value: ${value}`);
  } else {
    return `Number value: ${value}`;
  }
}

let logger: Logger = (message) => console.log(message);
let person = new Person("Alice");
let result1 = display("Hello"); // Outputs: String value: Hello
let result2 = display(42); // Outputs: Number value: 42
```

In this example:

- `Logger` is a callable type representing a function that accepts a string parameter and returns void.
- `Person` is a constructable class with a constructor that accepts a name parameter.
- `display` function is defined with multiple overloads, allowing it to accept either a string or a number parameter and return different types accordingly.
- These concepts help in defining and using functions and classes with different behaviors based on their invocation or input.

## 8. Classes

- Access Modifiers:
  - Control the visibility of class members.
  - TypeScript supports three access modifiers: `public`, `private`, and `protected`.
- Readonly:
  - Marks a property as read-only, meaning it can only be assigned a value once during initialization.
  - Ensures that the property cannot be modified after initialization.
- Private Members (`#`):
  - Marks a class member as private, restricting access to it from outside the class.
  - `#` is a JavaScript feature for private members, providing encapsulation and data hiding.
- Constructor:
  - Special method called when an instance of a class is created.
  - Used to initialize class properties and perform setup tasks.
- Static:
  - Defines properties or methods that belong to the class itself, rather than instances of the class.
  - Static members are accessed using the class name directly.
- Override:
  - Allows a subclass to provide a specific implementation of a method that is already defined in its superclass.
  - Useful for implementing polymorphic behavior and extending functionality.
- Example:

```typescript
class Person {
    readonly #personalNumber: string;
    constructor(
        public name: string,
        private _age: number,
        readonly gender: string,
        personalNumber: string
    ) {
        this.#personalNumber = serialNumber;
    }

    static welcome(): string {
        return "Welcome to the community!";
    }

    displayName(): void {
        console.log(`Name: ${this.name}):
    }

    get age(): number {
        return this._age;
    }

    set age(newAge: number) {
        if (newAge >= 0 && newAge <= 120) {
            this._age = newAge;
        } else {
            console.log("Invalid age!");
        }
    }
}

class Employee extends Person {
	public department: srting;
    constructor(
        name: string,
        age: number,
        gender: string,
        personalNumber: string,
        department: string
    ) {
        super(name, age, gender, personalNumber);
		this.department = deparment
    }

    override displayInfo(): void {
        super.displayInfo();
        console.log(`Department: ${this.department}`);
    }
}

let person = new Person("Alice", 30, "Female", "ABC123");
console.log(Person.welcome()); // Outputs: "Welcome to the community!"
person.displayInfo(); // Outputs: "Name: Alice, Age: 30, Gender: Female, Serial Number: ABC123"

let employee = new Employee("Bob", 35, "Male", "XYZ789", "IT");
employee.displayInfo();
```

## 9. Type Guards

- Definition:
  - Type guards are conditional statements or functions that help narrow down the type of a variable within a certain block of code.
  - They allow TypeScript to make more accurate inferences about the types of variables.
- Types of Type Guards:
  - **typeof type guards:** Check the type of a variable at runtime using the `typeof` operator.
  - **instanceof type guards:** Determine whether an object is an instance of a specific class or constructor function.
  - **user-defined type guards:** Custom functions that return a boolean to indicate whether a variable is of a specific type.
- Example:

```typescript
let value:
  | Date
  | null
  | undefined
  | "pineapple"
  | [number]
  | { dateRange: [Date, Date] };

// instanceof
if (value instanceof Date) {
  value; // value is inferred as Date type
}

// typeof
else if (typeof value === "string") {
  value; // value is inferred as string type
}

// Specific value check
else if (value === null) {
  value; // value is inferred as null type
}

// Truthy/falsy check
else if (!value) {
  value; // value is inferred as undefined type
}

// Array check
else if (Array.isArray(value)) {
  value; // value is inferred as number[] type
}

// Property presence check
else if ("dateRange" in value) {
  value; // value is inferred as { dateRange: [Date, Date] } type
} else {
  value; // value is inferred as never type
}
// user-defined type guard
interface CarLike {
  make: string;
  model: string;
  year: number;
}

let maybeCar: any;

// the guard - inline type guard
if (
  maybeCar &&
  typeof maybeCar === "object" &&
  "make" in maybeCar &&
  typeof maybeCar["make"] === "string" &&
  "model" in maybeCar &&
  typeof maybeCar["model"] === "string" &&
  "year" in maybeCar &&
  typeof maybeCar["year"] === "number"
) {
  maybeCar; // value is inferred as CarLike type
}

// the guard - user-defined function type guard
function isCarLike(valueToTest: any): valueToTest is CarLike {
  return (
    valueToTest &&
    typeof valueToTest === "object" &&
    "make" in valueToTest &&
    typeof valueToTest["make"] === "string" &&
    "model" in valueToTest &&
    typeof valueToTest["model"] === "string" &&
    "year" in valueToTest &&
    typeof valueToTest["year"] === "number"
  );
}

if (isCarLike(maybeCar)) {
  maybeCar; // value is inferred as CarLike type
}
```

## 10. Generics

- Definition:
  - Generics in TypeScript allow you to create reusable components that can work with a variety of data types.
  - They enable you to define functions, classes, and interfaces without specifying the exact type they will operate on.
- Syntax:
  - Generics are represented using angle brackets (`<>`) and type parameters.
  - Type parameters act as placeholders for the actual types that will be used when the generic component is used.
- Example:

```typescript
// Generic function
function identity<T>(arg: T): T {
  return arg;
}

let result1 = identity<string>("Hello"); // result1 is inferred as string
let result2 = identity<number>(123); // result2 is inferred as number

// Generic class
class Box<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

let box1 = new Box<string>("Value inside the box");
console.log(box1.getValue()); // Outputs: Value inside the box

let box2 = new Box<number>(42);
console.log(box2.getValue()); // Outputs: 42

function listToDict<T>(
  list: T[],
  idGen: (arg: T) => string,
): { [k: string]: T } {
  const dict: { [k: string]: T } = {};
  for (const item of list) {
    const id = idGen(item);
    dict[id] = item;
  }
  return dict;
}

// Example usage
interface Product {
  id: string;
  name: string;
}

const products: Product[] = [
  { id: "p1", name: "Product 1" },
  { id: "p2", name: "Product 2" },
  { id: "p3", name: "Product 3" },
];

function getProductID(product: Product): string {
  return product.id;
}

const productDict = listToDict(products, getProductID);
console.log(productDict);
```

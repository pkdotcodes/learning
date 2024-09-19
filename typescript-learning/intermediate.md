## 1. Declaration Merging

- Definition:

  - Declaration Merging is a TypeScript feature that allows for combining two or more separate declarations into a single definition. This feature is applicable to interfaces, namespaces, and type aliases, enabling developers to extend existing types in a flexible manner.

- Interfaces Merging:

  - TypeScript enables merging of interfaces that share the same name into a single interface.
  - Example:

    ```typescript
    interface Box {
      height: number;
      width: number;
    }

    interface Box {
      scale: number;
    }

    let box: Box = { height: 5, width: 6, scale: 10 };
    ```

- Namespaces Merging:

  - Namespaces with the same name will also merge their exported members.
  - Example:

  ```typescript
  namespace Animals {
    export class Zebra {}
  }

  namespace Animals {
    export interface Legged {
      numberOfLegs: number;
    }
    export class Dog {}
  }

  let zebra = new Animals.Zebra();
  let dog = new Animals.Dog();
  ```

- Module Augmentation:

  - Modules and namespaces can be augmented by additional declarations in other files.
  - Example:

  ```typescript
  // Original module file
  module Animal {
    export class Zebra {}
  }

  // Additional file
  module Animal {
    export interface Legged {
      numberOfLegs: number;
    }
    export class Dog {}
  }
  ```

- Benefits and Considerations:

  - Declaration Merging offers a powerful way to extend existing types and namespaces. However, it requires careful use to avoid complexity and ensure code maintainability.

- Further Reading:
  - TypeScript Official Documentation on Declaration Merging: [TypeScript: Declaration Merging](https://www.typescriptlang.org/docs/handbook/declaration-merging.html)

## 2. Top and Bottom Types

- Definition:

  - In TypeScript, **top types** are types that can hold any value. The top types in TypeScript are `any` and `unknown`.
  - **Bottom types**, on the other hand, are types that can hold no values. The bottom type in TypeScript is `never`.

- Top Types:

  - The `any` type allows for any type of value and bypasses type-checking, offering full flexibility but sacrificing type safety.
  - The `unknown` type represents any value as well, but unlike `any`, it doesn't allow you to arbitrarily call methods or properties on it without narrowing the type first.
  - Example:

  ```typescript
  // Using any
  let flexible: any = "A string";
  flexible = 42; // Allowed
  flexible.methodDoesNotExist(); // Allowed, but will runtime error

  // Using unknown
  let mystery: unknown = "An unknown string";
  mystery = 42; // Allowed
  // mystery.methodDoesNotExist(); // Error: Object is of type 'unknown'.
  ```

- Bottom Type:

  - The `never` type represents values that never occur. For example, it's the return type for functions that always throw an exception or have infinite loops.
  - Example:

  ```typescript
  // Function that throws an error and never returns
  function error(message: string): never {
    throw new Error(message);
  }

  // Function with an infinite loop and never returns
  function infiniteLoop(): never {
    while (true) {}
  }
  ```

- Special Types:

  - `object` and `{}`: Both represent any non-primitive type. The `object` type is more restrictive compared to `{}`, as `{}` can potentially include functions.
  - Example:

  ```typescript
  let obj: object = { key: "value" };
  let anything: {} = () => console.log("This is a function, and it's allowed.");
  ```

  - `null` and `undefined`: These types represent the absence of a value. TypeScript has strict null checking which, when enabled, makes it necessary to explicitly handle `null` and `undefined`.
  - `void`: Used to indicate that a function doesn't return a value.
  - Example:

  ```typescript
  function logMessage(): void {
    console.log("This function returns nothing.");
  }
  ```

- Benefits and Considerations:

  - Understanding and correctly using top and bottom types, as well as special types like `object`, `{}`, `null`, `undefined`, and `void`, are crucial for maintaining type safety in TypeScript applications.
  - Use `any` sparingly to avoid sacrificing type safety.
  - Use `unknown` when you need to accept any type but want to ensure type checking is applied.
  - `never` is useful for function return types where the function does not return by either throwing an error or entering an infinite loop.
  - Be explicit with `null` and `undefined` to avoid runtime errors in applications with strict null checking enabled.

- Further Reading:
  - TypeScript Official Documentation: [Basic Types](https://www.typescriptlang.org/docs/handbook/basic-types.html)

## 3. Nullish values

- Definition

  - TypeScript introduces specific handling for values that are "nullish," i.e., `null` or `undefined`. This concept is important for writing safer code and avoiding runtime errors due to unexpectedly nullish values.

- `null` and `undefined`

  - `null`: Explicitly signifies the intentional absence of any object value.
  - `undefined`: Indicates that a variable has been declared but not assigned a value.

- `void`

  - The `void` type is used in TypeScript to denote the absence of a return value in functions.
  - Example:
    ```typescript
    function logMessage(): void {
      console.log("This function returns nothing");
    }
    ```

- Non-null Assertion Operator (`!`)

  - The non-null assertion operator (`!`) is used to tell TypeScript that an expression is not null or undefined even when TypeScript's type checking would consider it possible.
  - Example:
    ```typescript
    function processMessage(message: string | null) {
      console.log(message!.toLowerCase());
    }
    ```

- Definite Assignment Assertion (`!` in Declarations)
  - Used in declarations to assert that a member will definitely be assigned before it's used, even if TypeScript's analysis can't detect it.
  - Example:
    ```typescript
    class Demo {
      x!: number; // Assert that x will be initialized later
      constructor() {
        this.init();
      }
      init() {
        this.x = 10;
      }
    }
    ```
- Optional Chaining (`?.`)

  - Optional chaining allows reading the value of a property located deep within a chain of connected objects without having to expressly validate that each reference in the chain is not nullish.
  - Example:

    ```typescript
    const response = {
      settings: {
        theme: {
          color: "blue",
        },
      },
    };

    const themeColor = response.settings?.theme?.color; // 'blue'
    ```

- Nullish Coalescing Operator (`??`)
  - The nullish coalescing operator (`??`) returns the right-hand operand when the left-hand operand is null or undefined, and otherwise returns the left-hand operand.
  - Example:
    ```typescript
    const input = undefined;
    const defaultValue = "default";
    const output = input ?? defaultValue; // 'default'
    ```

## 4. Generics: Scopes and Constraints

- Definition
  - Generics in TypeScript provide a way to create reusable components that can work over a variety of types rather than a single one. This feature enhances the flexibility and type safety of functions, classes, and interfaces.
- Basic Usage of Generics

  - Generics are typically used to type functions, interfaces, and classes where the type of properties, arguments, or return values are not fixed.
  - Example:
    ```typescript
    function identity<T>(arg: T): T {
      return arg;
    }
    ```

- Generic Constraints

  - Constraints in generics allow you to define requirements for the type parameters. This is done using the `extends` keyword.
  - Example:
    ```typescript
    function loggingIdentity<T extends { length: number }>(arg: T): T {
      console.log(arg.length); // Now we know it has a .length property
      return arg;
    }
    ```

- Generic Interfaces

  - Interfaces can be generic and often are used to define the structure of a function with a generic type.
  - Example:

    ```typescript
    interface GenericIdentityFn<T> {
      (arg: T): T;
    }

    function identity<T>(arg: T): T {
      return arg;
    }

    let myIdentity: GenericIdentityFn<number> = identity;
    ```

- Generic Classes

  - Generic classes have a generic type parameter on the class itself so that properties and methods can utilize this parameter.
  - Example:

    ```typescript
    class GenericNumber<T> {
      zeroValue: T;
      add: (x: T, y: T) => T;
    }

    let myGenericNumber = new GenericNumber<number>();
    myGenericNumber.zeroValue = 0;
    myGenericNumber.add = function (x, y) {
      return x + y;
    };
    ```

- Using Type Parameters in Generic Constraints

  - You can declare a type parameter that is constrained by another type parameter. For example, you can enforce that one type parameter extends another.
  - Example:
    ```typescript
    function find<T, U extends T>(arr: T[], element: U): U | undefined {
      return arr.find((e) => e === element);
    }
    ```

- Scopes of Type Parameters
  - Type parameters are scoped to the function, class, or interface they are declared in, similar to how variables have their scopes in functions.
  - They are not visible outside their respective blocks unless explicitly returned or exposed through another type.
- Further Reading
  - TypeScript Official Documentation on Generics: [TypeScript: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)

## 5. Mapped Types

- Definition
  - Mapped types allow the creation of new types by transforming properties of an existing type in a systematic way. They are a versatile and powerful feature in TypeScript for generating types based on existing types.
- Basic Concept of Mapped Types

  - Mapped types iterate over a list of properties (keys) and produce a new type with modifications applied to the properties. This is achieved by specifying a type variable in a type literal, which then applies a transformation to each property in the type.

    - Example:

      ```typescript
      type ReadOnly<T> = {
        readonly [P in keyof T]: T[P];
      };

      type User = {
        id: number;
        name: string;
        age: number;
      };

      type ReadOnlyUser = ReadOnly<User>;
      // ReadOnlyUser has all properties of User but they are all read-only:
      // {
      //   readonly id: number;
      //   readonly name: string;
      //   readonly age: number;
      // }
      ```

- Using Mapped Types

  - Mapped types can make properties optional, readonly, or of a specific type, among other transformations. This allows developers to create flexible and reusable type definitions that can adapt existing types to different contexts.
  - Example:

  ```typescript
  type Optional<T> = {
    [P in keyof T]?: T[P];
  };

  type OptionalUser = Optional<User>;
  // OptionalUser has all properties of User but they are all optional:
  // {
  //   id?: number;
  //   name?: string;
  //   age?: number;
  // }
  ```

- Common Mapped Types

  - `Partial<T>`: Makes all properties of type `T` optional.
  - `Required<T>`: Makes all properties of type `T` required.
  - `Readonly<T>`: Makes all properties of type `T` read-only.
  - `Record<K, T>`: Creates a type with a set of properties `K` of type `T`.
  - Example:

  ```typescript
  type Person = {
    name: string;
    age: number;
  };

  type OptionalPerson = Partial<Person>;
  type ReadonlyPerson = Readonly<Person>;
  type RecordOfPeople = Record<string, Person>;
  // RecordOfPeople can be used to create an object with any keys, but all values must be of type Person
  ```

- Modifying Property Types

  - Mapped types can also be used to transform the types of the properties themselves, not just their optionality or mutability.
  - Example:

  ```typescript
  type StringProperties<T> = {
    [P in keyof T]: string;
  };

  type StringifiedPerson = StringProperties<Person>;
  // StringifiedPerson will have all properties of Person, but their types are changed to string:
  // {
  //   name: string;
  //   age: string;
  // }
  ```

- Conditional and Advanced Mapped Types

  - Mapped types can include conditional types to apply more complex logic based on the property types.
  - Example:

  ```typescript
  type ConditionalProperties<T> = {
    [P in keyof T]: T[P] extends boolean ? "Yes" : "No";
  };

  type CheckBooleans = ConditionalProperties<{ flag: boolean; count: number }>;
  // CheckBooleans results in:
  // {
  //   flag: 'Yes';
  //   count: 'No';
  // }
  ```

- Utility Types and Mapped Types

  - TypeScript includes several built-in utility types that use mapped types under the hood, simplifying common type transformations.
  - Example:

  ```typescript
  type Pick<T, K extends keyof T> = {
    [P in K]: T[P];
  };
  ```

- Further Reading
  - TypeScript Official Documentation on Mapped Types: [TypeScript: Mapped Types](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html)

## 6. Utility Types

- Definition
  - Utility types in TypeScript provide built-in type transformations that allow developers to manipulate types in a variety of useful ways. These types are part of the TypeScript library and offer convenient shortcuts for common type operations.
- Common Utility Types

  - `Partial<T>`: Makes all properties of `T` optional.

  ```typescript
  type Partial<T> = {
    [P in keyof T]?: T[P];
  };
  ```

  - `Required<T>`: Makes all properties of `T` required.

  ```typescript
  type Required<T> = {
    [P in keyof T]-?: T[P];
  };
  ```

  - `Readonly<T>`: Makes all properties of `T` readonly.

  ```typescript
  type Readonly<T> = {
    readonly [P in keyof T]: T[P];
  };
  ```

  - `Record<K, T>`: Creates a type with a set of properties `K` of type `T`.

  ```typescript
  type Record<K extends keyof any, T> = {
    [P in K]: T;
  };
  ```

  - `Pick<T, K>`: Creates a type by picking the set of properties `K` from `T`.

  ```typescript
  type Pick<T, K extends keyof T> = {
    [P in K]: T[P];
  };
  ```

  - `Omit<T, K>`: Creates a type by omitting the properties `K` from `T`.

  ```typescript
  type Omit<T, K extends keyof any> = Pick<T, Exclude<keyof T, K>>;
  ```

  - `Exclude<T, U>`: Excludes from `T` those types that are assignable to `U`.

  ```typescript
  type Exclude<T, U> = T extends U ? never : T;
  ```

  - `Extract<T, U>`: Selects from `T` those types that are assignable to `U`.

  ```typescript
  type Extract<T, U> = T extends U ? T : never;
  ```

  - `NonNullable<T>`: Excludes `null` and `undefined` from `T`.

  ```typescript
  type NonNullable<T> = T extends null | undefined ? never : T;
  ```

- Using Utility Types

  - Utility types can be nested and combined to create complex type transformations.
  - Example:

  ```typescript
  type ComplexType = NonNullable<Partial<Pick<Person, "name" | "age">>>;
  // This type is a partially nullable version of Person, excluding null and undefined for 'name' and 'age'.
  ```

- Further Reading
- TypeScript Official Documentation on Utility Types: [TypeScript: Utility Types](https://www.typescriptlang.org/docs/handbook/utility-types.html)

## 7. Variance Over Type Parameters

- Definition
  - Variance describes how subtype relationships between more complex types relate to subtype relationships between their components. In TypeScript, understanding variance is essential for correctly typing functions and class hierarchies involving generics.
- Types of Variance

  - **Covariant**: When a type parameter `T` appears in an output position (like in a return type), it exhibits covariance. Changes in `T` preserve the direction of assignment compatibility.
  - Example:

    ```typescript
    type Covariant<T> = () => T;
    let stringSupplier: Covariant<string> = () => "Hello";
    let objectSupplier: Covariant<object> = () => ({});
    // Covariant: `stringSupplier` can be assigned to `objectSupplier` because `string` is a subtype of `object`.
    ```

  - **Contravariant**: When a type parameter `T` appears in an input position (like in function parameters), it exhibits contravariance. Changes in `T` reverse the direction of assignment compatibility.
  - Example:

    ```typescript
    type Contravariant<T> = (a: T) => void;
    let objectConsumer: Contravariant<object> = (x: object) => console.log(x);
    let stringConsumer: Contravariant<string> = objectConsumer;
    // Contravariant: `objectConsumer` can be assigned to `stringConsumer` because `object` is a supertype of `string`.
    ```

  - **Invariant**: If a type parameter `T` affects both input and output positions, it is considered invariant. Neither covariant nor contravariant rules apply, and exact type matches are required.
  - Example:
    ```typescript
    type Invariant<T> = {
      func: (arg: T) => T;
    };
    let invariantString: Invariant<string> = {
      func: (arg: string) => arg.toLowerCase(),
    };
    let invariantObject: Invariant<object>;
    // Invariant: Cannot assign `invariantString` to `invariantObject` or vice versa without explicit type assertion.
    ```

- Impact of Variance in TypeScript
  - Understanding variance is crucial for designing APIs and libraries in TypeScript, as it affects how users of the library can extend and interact with types, especially when generics are involved.
  - Variance affects how types are assigned and re-assigned in complex structures, which impacts polymorphism and code reuse.
- Practical Applications

  - Variance determines the compatibility of type signatures in function assignments, method overriding, and interface implementations.
  - Proper use of variance can lead to more robust and flexible type systems within applications.

- Further Reading
  - TypeScript Official Documentation on Type Compatibility: [TypeScript: Type Compatibility](https://www.typescriptlang.org/docs/handbook/type-compatibility.html)

# CGFloatGenericRotator - iOS (Swift)

I use this rotator in many of my Apps for generating/rotating/scrolling random CGFloat values **between** min-max.

Files

```swift
Extensions.swift
GenericCGFloatRotator.swift
Helper.swift
```

Note

```swift
// The results are very random, always between min-max values.
// 'extraInfoHowMany' parameter pseudo-defines (+randomly) how the values will be distributed.
```

Usage

```swift
let from: CGFloat = 0
let to: CGFloat = 1
let extraInfoHowMany = Helper.randomBetween(10, max: 1000, includeMax: true)

let rotator = GenericCGFloatRotator(
    rotateValue: Helper.randomMinAddMax(from, max: (to - from)),    // Initial value
    from: from,
    to: to,
    extraInfoHowMany: extraInfoHowMany,
    modifyValue: true   // If false, initial value 'rotateValue' will be FIXED
)

print("From: \(from)")
print("To: \(to)")
print("ExtraInfoHowMany: \(extraInfoHowMany)")

var allValues = String()

for _ in 0 ... 1000
{
    let rotated = rotator.rotate()
    allValues = "\(allValues)\n\(rotated)"
    print(rotated)
}
```

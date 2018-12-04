# CGFloatGenericRotator - iOS (Swift)

I use this simple class in many of my Apps for generating/rotating CGFloat min-max values.

Files:

```swift
Extensions.swift
GenericCGFloatRotator.swift
Helper.swift
```

Usage

```swift
let from: CGFloat = 0
let to: CGFloat = 1
let howMany = Helper.randomBetween(10, max: 1000, includeMax: true)

let rotator = GenericCGFloatRotator(
    rotateValue: Helper.randomMinAddMax(from, max: (to - from)),
    from: from,
    to: to,
    extraInfoHowMany: howMany,
    modifyValue: true
)

print("From: \(from)")
print("To: \(to)")
print("N-times: \(howMany)")

var allValues = String()

for _ in 0 ... 1000
{
    let rotated = rotator.rotate()
    allValues = "\(allValues)\n\(rotated)"
    print(rotated)
}
```

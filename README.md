# GenericCGFloatRotator - iOS (Swift)

I use this helper class in many of my Apps for generating/rotating/scrolling **random** CGFloat values **between** min-max.
This will be useful for you if you really need **many random** values between min-max.

Files

```swift
Extensions.swift
GenericCGFloatRotator.swift
Helper.swift
```

Note

```swift
// The results are very random, always between min-max values.
// 'extraInfoHowMany' parameter pseudo-defines (+randomly) how 
// the values will be distributed. So it must be set wisely.
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
    let rotated = rotator.rotate()  // ROTATE -> get new value
    allValues = "\(allValues)\n\(rotated)"
    print(rotated)
}

print("---")
print("---")
print("---")

Helper.runAsyncMain {
    self.valuesTextView.text = allValues
    self.valuesTextView.setContentOffset(.zero, animated: true)
}
```

Example of usage (ColorRotator) how to get super-random colors (transitions) one after another

```swift

// To get new color -> func rotate() -> UIColor

final class ColorRotator {
    
    private var color: UIColor
    
    private let extraInfoHowMany: Int
    private let modifyValue: Bool
    
    private let redRotator: GenericCGFloatRotator
    private let greenRotator: GenericCGFloatRotator
    private let blueRotator: GenericCGFloatRotator
    private let alphaRotator: GenericCGFloatRotator
    
    init(startingColor: UIColor, modifyValue: Bool, extraInfoHowMany: Int)
    {
        self.color = startingColor
        self.modifyValue = modifyValue
        self.extraInfoHowMany = extraInfoHowMany
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        // MOST common settings for color scrolling - Scroll RGB && NOT-ALPHA
        // MOST common settings for color scrolling - Scroll RGB && NOT-ALPHA
        // MOST common settings for color scrolling - Scroll RGB && NOT-ALPHA
        var modifyRed = true
        var modifyGreen = true
        var modifyBlue = true
        var modifyAlpha = false
        
        Helper.randomFifty {
            
            // Randomize modifiying settings
            // Randomize modifiying settings
            // Randomize modifiying settings
            modifyRed = Helper.randomFifty()
            modifyGreen = Helper.randomFifty()
            modifyBlue = Helper.randomFifty()
            modifyAlpha = Helper.randomFifty()
            
        }
        
        redRotator = GenericCGFloatRotator(
            rotateValue: r,
            extraInfoHowMany: self.extraInfoHowMany,
            modifyValue: modifyRed
        )
        greenRotator = GenericCGFloatRotator(
            rotateValue: g,
            extraInfoHowMany: self.extraInfoHowMany,
            modifyValue: modifyGreen
        )
        blueRotator = GenericCGFloatRotator(
            rotateValue: b,
            extraInfoHowMany: self.extraInfoHowMany,
            modifyValue: modifyBlue
        )
        
        alphaRotator = GenericCGFloatRotator(
            rotateValue: a,
            extraInfoHowMany: self.extraInfoHowMany,
            modifyValue: modifyAlpha
        )
        
    }
    
    func rotate() -> UIColor
    {
        if modifyValue
        {
            color = UIColor(
                red: redRotator.rotate(),
                green: greenRotator.rotate(),
                blue: blueRotator.rotate(),
                alpha: alphaRotator.rotate()
            )
        }
        
        return color
    }
    
}
```

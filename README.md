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
let howMany = Helper.randomBetween(10, max: 10000, includeMax: true)

let rotator = GenericCGFloatRotator(
    rotateValue: Helper.random01(),
    from: from,
    to: to,
    extraInfoHowMany: howMany,
    modifyValue: true
)

print("From: \(from)")
print("To: \(to)")
print("N-times: \(howMany)")

for _ in 0 ... 1000
{
    print(rotator.rotate())
}
```

Example how to use it in a SpriteKit game as a background image

```swift
let background = SKNode()
background.addChild(SKSpriteNode(texture: SKTexture(CGImage: trippyImage.CGImage!)))
background.position = CGPointMake(MasterSKView.frame.midX, MasterSKView.frame.midY)
self.addChild(background)
```

Examples of *fully-randomly-generated* images. These are just **a few examples**.

![Alt text](http://i.imgur.com/9jq9YwQ.png)

![Alt text](http://i.imgur.com/2eZpnHQ.png)

![Alt text](http://i.imgur.com/lpkcXjk.png)

![Alt text](http://i.imgur.com/X8KuFgi.png)

![Alt text](http://i.imgur.com/il3HiB9.png)

![Alt text](http://i.imgur.com/Ynn7VRf.png)

![Alt text](http://i.imgur.com/1wxFGTR.png)

![Alt text](http://i.imgur.com/wKWQPU7.png)

![Alt text](http://i.imgur.com/m3AwCYh.png)

![Alt text](http://i.imgur.com/n9DNufN.png)

![Alt text](http://i.imgur.com/JuNRyxx.png)

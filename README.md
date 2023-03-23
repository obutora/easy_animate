# easy_animate

beautiful simple animation for flutter!🚀  
With this package, you can add animation effects super easily!!⛱

for example...

```dart
const FadeInAnimation(
        child: YourFavoriteWidget(),
    );
```

It`s so easy!🤩

You can easily add animation effects to your apps without setting any further properties.
However, you can customize and set Durtation, Direction, moveAmount and more properties as needed.

- [easy_animate](#easy_animate)
  - [Dependency](#dependency)
  - [Animation List](#animation-list)
    - [FadeIn](#fadein)
    - [FadeOut](#fadeout)
    - [SlideIn](#slidein)
    - [ScaleIn](#scalein)
    - [Shake](#shake)
    - [Bounce](#bounce)
    - [Fluffy](#fluffy)
    - [Pulse](#pulse)
  - [Customizing Animation](#customizing-animation)
  - [Developer mode](#developer-mode)

## Dependency

[simple_animation package](https://pub.dev/packages/simple_animations#customanimationbuilder)

## Animation List

### FadeIn

![fade in animation](https://user-images.githubusercontent.com/24934672/227219910-1491719d-b959-4b39-9671-3930b81bb275.gif)

```dart
FadeInAnimation(
        animateDirection: AnimateDirection.left,
        child: SomeWidget(),
      );
```

### FadeOut

![fade out animation](https://user-images.githubusercontent.com/24934672/227221539-d8bda94e-228e-491e-873d-2931a42513d9.gif)

```dart
FadeOutAnimation(
        animateDirection: AnimateDirection.right,
        child: SomeWidget(),
      );
```

### SlideIn

![slide in animation](https://user-images.githubusercontent.com/24934672/227219931-92c6b24b-25f6-4a6b-a1ed-70469e06f987.gif)

```dart
SlideInAnimation(
        animateDirection: AnimateDirection.left,
        child: SomeWidget(),
      );
```

### ScaleIn

![scale in animation](https://user-images.githubusercontent.com/24934672/227219926-0ff4f9f4-7004-46d9-b921-df299b877d98.gif)

```dart
ScaleInAnimation(
        child: SomeWidget(),
      );
```

### Shake

![shake animation](https://user-images.githubusercontent.com/24934672/227219929-df9bfce8-6bf1-4c9e-a07f-d0e0f93d601e.gif)

```dart
ShakeAnimation(
        isHorizontal: true,
        child: SomeWidget(),
      );
```

### Bounce

![bouce animation](https://user-images.githubusercontent.com/24934672/227218488-e03b8dd3-0258-4513-8fc5-688d08665a5a.gif)

```dart
 BouncingAnimation(
        developerMode: true,
        child: SomeWidget(),
      );
```

### Fluffy

![fluffy animation](https://user-images.githubusercontent.com/24934672/227219917-a56acf03-c6b6-4838-b027-71f9f42de5e9.gif)

```dart
FluffyAnimation(
        child: SomeWidget(),
      );
```

### Pulse

![Pluse animation](https://user-images.githubusercontent.com/24934672/227219922-f4026c8a-620a-4ab0-b10a-6de931f94086.gif)

```dart
PulseAnimation(
        child: SomeWidget(),
      );
```

## Customizing Animation

for example, you can customize FadeInAnimation like this.

```dart
FadeInAnimation(
        animateDirection: AnimateDirection.right,
        animateType: AnimateType.loop,
        durationMilliseconds: 300,
        moveAmount: 200,
        child: MockBox(),
      );
```

| property             | value                                                                                                               | description                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| animateDirection     | AnimateDirection.top, AnimateDirection.right, AnimateDirection.bottom, AnimateDirection.left, AnimateDirection.none | Defines the direction of the animation    |
| animateType          | AnimateType.once, AnimateType.loop, AnimateType.mirror                                                              | Defines the type of animation             |
| durationMilliseconds | double                                                                                                              | Defines the duration(ms) of the animation |
| moveAmount           | double                                                                                                              | Defines the distance of the animation     |

## Developer mode

You can check the animation effect in the developer mode.
It`s very useful for debugging.

```dart
AnimationDeveloperTools(
        child: PulseAnimation(
            developerMode: true, // don't forget this!
            child: SomeWidget(),
        )
    );
```

Yes, just set `AnimationDeveloperTools()` as the parent widget and enable developerMode.

See [simple_animation package](https://pub.dev/packages/simple_animations#customanimationbuilder) for more details.

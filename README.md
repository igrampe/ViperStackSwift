# ViperStackSwift

[![CI Status](http://img.shields.io/travis/igrampe/ViperStackSwift.svg?style=flat)](https://travis-ci.org/igrampe/ViperStackSwift)
[![Version](https://img.shields.io/cocoapods/v/ViperStackSwift.svg?style=flat)](http://cocoapods.org/pods/ViperStackSwift)
[![License](https://img.shields.io/cocoapods/l/ViperStackSwift.svg?style=flat)](http://cocoapods.org/pods/ViperStackSwift)
[![Platform](https://img.shields.io/cocoapods/p/ViperStackSwift.svg?style=flat)](http://cocoapods.org/pods/ViperStackSwift)

## What is it?

`ViperStackSwift` is a library, that provide mechanism for connection between `VIPER` modules.

Also there are some base classes and protocols for `VIPER` module:
- ModuleInput
- ModuleOutput
- ModuleRouter
- ModuleView

With this library you can navigate between modules objects named `Segues`.

`Segue` is an object, that can customize opening UIViewController and it's animation.  
Segues are presented with protocol `Segue`.  
- `BaseSegue` is a base class implementing `Segue` protocol.
- `PushSegue` makes a push in source viewcontroller's navigation controller.
- `ModalSegue` presents destination viewcontroller as modal.

To customize showing `UIViewController`, you should make a subclass of `BaseSegue` and override `perform` and `unwind` methods.

To perform a segue, create a `Segue` object, and call from your `transitionHandler`:

```openModule(withSegue segue: Segue?, linkClosure closure: ModuleLinkClosure?) -> ModuleOpenPromise```



By default you should use `UIViewController` for `transitionHandler`, there is an extension for it.

`linkClosure` is needed to connect parent module as `moduleOutput` with child module.  In `linkClosure` you also can call some methods from child module, for example, pass a parameter from parent to child.

## Language
ViperStackSwift is wirtten in pure Swift.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ViperStackSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ViperStackSwift'
```

## Author

igrampe, igrampe@gmail.com

## License

ViperStackSwift is available under the MIT license. See the LICENSE file for more info.

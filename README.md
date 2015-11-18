# Describe

[![CI Status](http://img.shields.io/travis/mobLee/Describe.svg?style=flat)](https://travis-ci.org/mobLee/Describe)

[Storyboard sucks!](http://stackoverflow.com/a/19457257/1732725)

Describe framework is just a few helper functions, but together with the coding
style guide can make your Swift programmatic views much more readable.

## Installation

Add Describe framework as a dependency of your project, import the module and
you're good to go:

```swift
import Describe
```

## Usage

Describe has one main function with a few variants:

`describe` receives two parameters. The first one is a `UIView` (or subclass)
instance. The second is a closure, it should be responsible for describing the
view. For convenience it returns the same `UIView` instance sent:

```swift
describe(UILabel()) { view in
    view.textColor = UIColor.blackColor()
    view.font = UIFont.systemFontOfSize(24)
    view.text = "some text"
}
```

It's designed to remind you that it's a layout code by the time you look at it.
The equivalent Android layout would look like this:

```xml
<TextView
    android:textColor="@color/black"
    android:fontSize="24sp"
    android:text="some text">
</TextView>
```

The variants, `describeSubview` and `describeArrangedSubview`, are just
extensions of `UIView` and `UIStackView`, respectively, that adds the newly
created view to the caller parent:

```swift
describe(UIView()) { container in
    // container configuration

    container.describeSubview(UILabel()) { label in
        // label configuration

        // you can add constraints here
        // since label is already a subview of container
    }
}
```

## Coding style

First of all, free your view controller from declaring the view and it's
properties. Create a class for your view and declare anything related to the
view's properties and layout there.

Immutable content like most buttons labels, icons and some texts can be
configured by the view. Contents that depend on what is being shown should be
set by the view controller.

This is how a simple view controller and it's view should be:

MyViewController.swift

```swift
import UIKit

class MyViewController: UIViewController {

    override func loadView() {
        let myView = MyView()

        myView.myImage.image = UIImage(named: "myImage.jpg")
        myView.myLabel.text = "User name"
        myView.myButton.addTarget(self, action: "myAction", forControlEvents: .TouchUpInside)

        view = myView
    }

    func myAction() {
        print("do something great")
    }

}
```

MyView.swift

```swift
import UIKit
import Describe
import SnapKit

class MyView: UIStackView {

    var myImage: UIImageView!
    var myLabel: UILabel!
    var myButton: UIButton!

    convenience init() {
        self.init(frame: CGRectZero)
        axis = .Vertical

        describeArrangedSubview(UIStackView()) { stack in
            stack.alignment = .Center
            stack.spacing = 16

            myImage = stack.describeArrangedSubview(UIImageView()) { image in
                image.snp_makeConstraints { make in
                    make.size.equalTo(64)
                }
            }

            myLabel = stack.describeArrangedSubview(UILabel()) { label in
                label.font = UIFont.systemFontOfSize(24)
            }
        }

        myButton = describeArrangedSubview(UIButton()) { button in
            button.setTitle("Button title", forState: .Normal)
            button.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 1), forState: .Normal)
        }
    }

}
```

> We strongly recommend the use of any of the highly rated libs for handling
constraints more easily. In this example we used [SnapKit](http://snapkit.io/).
It wasn't nearly necessary here, but in normal sized projects it can save your
sanity.

## License

Describe is available under the MIT license. See the LICENSE file for more info.

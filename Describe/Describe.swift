import UIKit

public func describe<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
    describeClosure(view)
    return view
}

public extension UIView {

    func describeSubview<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
        addSubview(view)
        describeClosure(view)
        return view
    }

}

public extension UIStackView {

    func describeArrangedSubview<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
        addArrangedSubview(view)
        describeClosure(view)
        return view
    }

}

import UIKit

public func describe<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
    describeClosure(view)
    return view
}

public extension UIView {

    func addSubview<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
        addSubview(view)
        return describe(view, describeClosure: describeClosure)
    }

}

public extension UIStackView {

    func addArrangedSubview<T: UIView>(view: T, @noescape describeClosure: (T) -> ()) -> T {
        addArrangedSubview(view)
        return describe(view, describeClosure: describeClosure)
    }

}

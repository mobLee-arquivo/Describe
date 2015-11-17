import UIKit

public func describe<T: UIView>(viewClass: T.Type, describeClosure: ((T) -> ())? = nil) -> T {
    let view = viewClass.init()
    describeClosure?(view)
    return view
}

public extension UIView {

    func describeSubview<T: UIView>(viewClass: T.Type, describeClosure: ((T) -> ())? = nil) -> T {
        let view = viewClass.init()
        addSubview(view)
        describeClosure?(view)
        return view
    }

}

public extension UIStackView {

    func describeArrangedSubview<T: UIView>(viewClass: T.Type, describeClosure: ((T) -> ())? = nil) -> T {
        let view = viewClass.init()
        addArrangedSubview(view)
        describeClosure?(view)
        return view
    }

}

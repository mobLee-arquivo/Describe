import UIKit

public func describe<T: UIView>(viewClass: T.Type, describeClosure: ((T) -> ())? = nil) -> T {
    let view = viewClass.init()
    describeClosure?(view)
    return view
}

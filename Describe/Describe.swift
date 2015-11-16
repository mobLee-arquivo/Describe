import UIKit

public func describe<T: UIView>(viewClass: T.Type) -> T {
    let view = viewClass.init()
    return view
}

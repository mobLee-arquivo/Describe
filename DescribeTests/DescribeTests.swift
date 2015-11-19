import Quick
import Nimble
import Describe

class DescribeTests: QuickSpec {

    override func spec() {

        describe("#describe") {

            it("should return an instance of the given class") {
                expect(describe(UILabel()) { _ in }).to(beAnInstanceOf(UILabel))
            }

            it("should call the given closure with the created instance") {
                var closureInstance: UIView? = nil
                let returnedInstance = describe(UILabel()) { view in
                    closureInstance = view
                }
                expect(closureInstance).to(equal(returnedInstance))
            }

        }

        describe("UIView") {

            describe("#addSubview") {

                var parentView: UIView!

                beforeEach {
                    parentView = UIView()
                }

                it("should return an instance of the given class") {
                    expect(parentView.addSubview(UILabel()) { _ in }).to(beAnInstanceOf(UILabel))
                }

                it("should call the given closure with the created instance") {
                    var closureInstance: UIView? = nil
                    let returnedInstance = parentView.addSubview(UILabel()) { view in
                        closureInstance = view
                    }
                    expect(closureInstance).to(equal(returnedInstance))
                }

                it("should add the view as subview before calling the closure") {
                    parentView.addSubview(UILabel()) { view in
                        expect(parentView.subviews).to(contain(view))
                    }
                }

            }

        }

        describe("UIStackView") {

            describe("#addArrangedSubview") {

                var parentView: UIStackView!

                beforeEach {
                    parentView = UIStackView()
                }

                it("should return an instance of the given class") {
                    expect(parentView.addArrangedSubview(UILabel()) { _ in }).to(beAnInstanceOf(UILabel))
                }

                it("should call the given closure with the created instance") {
                    var closureInstance: UIView? = nil
                    let returnedInstance = parentView.addArrangedSubview(UILabel()) { view in
                        closureInstance = view
                    }
                    expect(closureInstance).to(equal(returnedInstance))
                }

                it("should add the view as arranged subview before calling the closure") {
                    parentView.addArrangedSubview(UILabel()) { view in
                        expect(parentView.arrangedSubviews).to(contain(view))
                    }
                }

            }

        }

    }

}

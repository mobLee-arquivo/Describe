import Quick
import Nimble
import Describe

class DescribeTests: QuickSpec {

    override func spec() {

        describe("#describe") {

            it("should return an instance of the given class") {
                expect(describe(UILabel.self)).to(beAnInstanceOf(UILabel))
            }

        }

    }

}

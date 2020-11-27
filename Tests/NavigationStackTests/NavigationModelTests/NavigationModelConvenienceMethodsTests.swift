@testable import NavigationStack
import SwiftUI
import XCTest

class NavigationModelConvenienceMethodsTests: XCTestCase {
	var model: NavigationModelStub!

	override func setUp() {
		model = NavigationModelStub(silenceErrors: true)
	}

	// MARK: - Tests

	func testPushContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.showViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.pushContent("Foo") { EmptyView() }

		waitForExpectations(timeout: 1.0)
	}

	func testPopContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.hideViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.popContent("Foo")

		waitForExpectations(timeout: 1.0)
	}

	func testPresentContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.showViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.presentContent("Foo") { EmptyView() }

		waitForExpectations(timeout: 1.0)
	}

	func testDismissContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.hideViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.dismissContent("Foo")

		waitForExpectations(timeout: 1.0)
	}

	func testFadeInContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.showViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.fadeInContent("Foo") { EmptyView() }

		waitForExpectations(timeout: 1.0)
	}

	func testFadeOutContent() throws {
		let modelExpectation = expectation(description: "Model")
		model.hideViewStub = { name, _ in
			XCTAssertEqual("Foo", name)
			modelExpectation.fulfill()
		}

		model.fadeOutContent("Foo")

		waitForExpectations(timeout: 1.0)
	}
}

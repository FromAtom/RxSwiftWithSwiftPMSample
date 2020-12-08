//
//  RxSwiftWithSwiftPMTests.swift
//  RxSwiftWithSwiftPMTests
//
//  Created by FromAtom on 2020/12/08.
//

import XCTest
import RxSwift
import RxTest
@testable import RxSwiftWithSwiftPM

class RxSwiftWithSwiftPMTests: XCTestCase {
	var dispose = DisposeBag()
	let scheduler = TestScheduler(initialClock: 0)
	func testExample() throws {
		XCTAssertTrue(true)
	}
}

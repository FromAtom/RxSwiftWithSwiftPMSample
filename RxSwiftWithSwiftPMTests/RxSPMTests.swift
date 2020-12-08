//
//  RxSPMTests.swift
//  RxSPMTests
//
//  Created by Shai Mishali on 28/02/2020.
//  Copyright © 2020 Shai Mishali. All rights reserved.
//

import XCTest
import RxTest
import RxBlocking
import RxSwift
import RxCocoa
import RxRelay

class RxSPMTests: XCTestCase {
    private let bag = DisposeBag()

    func testRxTest() {
        let scheduler = TestScheduler(initialClock: 0)
        let source = Observable<Int>.interval(.seconds(5),
                                              scheduler: scheduler)
                                    .take(8)

        let observer = scheduler.createObserver(Int.self)
        source.bind(to: observer).disposed(by: bag)

        scheduler.start()

        XCTAssertEqual(observer.events, [
            .next(5, 0),
            .next(10, 1),
            .next(15, 2),
            .next(20, 3),
            .next(25, 4),
            .next(30, 5),
            .next(35, 6),
            .next(40, 7),
            .completed(40)
        ])
    }

    func testRxBlocking() throws {
        let source = Observable<Int>.interval(.milliseconds(20),
                                              scheduler: MainScheduler.instance)
                                    .take(8)

        XCTAssertEqual(
            try source.toBlocking().toArray(),
            [0, 1, 2, 3, 4, 5, 6, 7]
        )
    }
}

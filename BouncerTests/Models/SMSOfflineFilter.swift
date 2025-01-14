//
//  SMSOfflineFilter.swift
//  BouncerTests
//

import XCTest
import IdentityLookup
@testable import Bouncer

class SMSOfflineFilterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testFiltering() {
        var smsFilter: SMSOfflineFilter

        let message = SMSMessage(sender: "ETB Comunicaciones", text: "ETB compra 100 megas y recibe 200 por 6 meses. Incluye extensor de velocidad mas promocion especial. Llama ya sin costo al 018000413807. Ver TyC. Hasta 31 ago 2020")

        // Old style filters (Text + Regex)
        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "etb", type: .any, action: .junk)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.junk)

        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "comunica", type: .sender, action: .promotion)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.promotion)

        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "mega", type: .message, action: .transaction)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.transaction)
        
        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "[a-z]cidad", type: .message, action: .junk)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.junk)
                
        // Regex filter test
        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "[E].*[l][o]cidad", type: .message, action: .junk, useRegex: true)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.junk)
        
        // Content filter test
        smsFilter = SMSOfflineFilter(filterList: [Filter(id: UUID(), phrase: "velocidad", type: .message, action: .junk, useRegex: false)])
        XCTAssertEqual(smsFilter.filterMessage(message: message), ILMessageFilterAction.junk)
        
            

    }
}

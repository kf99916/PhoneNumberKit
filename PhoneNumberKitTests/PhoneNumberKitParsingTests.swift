//
//  PhoneNumberKitParsingTests.swift
//  PhoneNumberKit
//
//  Created by Roy Marmelstein on 29/10/2015.
//  Copyright © 2015 Roy Marmelstein. All rights reserved.
//

import Foundation

import XCTest
@testable import PhoneNumberKit

class PhoneNumberKitParsingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFailingNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "+5491187654321 ABC123", region: "AR")
            XCTAssertNotNil(phoneNumber1)
        }
        catch {
            XCTFail()
        }
    }
    
    func testUSNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "650 253 0000", region: "US")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumberInternationalFormat1 = phoneNumber1.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat1 == "+1 650-253-0000")
            let phoneNumberNationalFormat1 = phoneNumber1.toNational()
            XCTAssertTrue(phoneNumberNationalFormat1 == "(650) 253-0000")
            let phoneNumberE164Format1 = phoneNumber1.toE164()
            XCTAssertTrue(phoneNumberE164Format1 == "+16502530000")
            let phoneNumber2 = try PhoneNumber(rawNumber: "800 253 0000")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumberInternationalFormat2 = phoneNumber2.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat2 == "+1 800-253-0000")
            let phoneNumberNationalFormat2 = phoneNumber2.toNational()
            XCTAssertTrue(phoneNumberNationalFormat2 == "(800) 253-0000")
            let phoneNumberE164Format2 = phoneNumber2.toE164()
            XCTAssertTrue(phoneNumberE164Format2 == "+18002530000")
            let phoneNumber3 = try PhoneNumber(rawNumber: "900 253 0000")
            XCTAssertNotNil(phoneNumber3)
            let phoneNumberInternationalFormat3 = phoneNumber3.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat3 == "+1 900-253-0000")
            let phoneNumberNationalFormat3 = phoneNumber3.toNational()
            XCTAssertTrue(phoneNumberNationalFormat3 == "(900) 253-0000")
            let phoneNumberE164Format3 = phoneNumber3.toE164()
            XCTAssertTrue(phoneNumberE164Format3 == "+19002530000")
        }
        catch {
            XCTFail()
        }
    }
    
    func testBSNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "242 365 1234", region: "BS")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumberInternationalFormat1 = phoneNumber1.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat1 == "+1 242-365-1234")
            let phoneNumberNationalFormat1 = phoneNumber1.toNational()
            XCTAssertTrue(phoneNumberNationalFormat1 == "(242) 365-1234")
            let phoneNumberE164Format1 = phoneNumber1.toE164()
            XCTAssertTrue(phoneNumberE164Format1 == "+12423651234")
        }
        catch {
            XCTFail()
        }
    }
    
    func testGBNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "(020) 7031 3000", region: "GB")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumberInternationalFormat1 = phoneNumber1.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat1 == "+44 20 7031 3000")
            let phoneNumberNationalFormat1 = phoneNumber1.toNational()
            XCTAssertTrue(phoneNumberNationalFormat1 == "020 7031 3000")
            let phoneNumberE164Format1 = phoneNumber1.toE164()
            XCTAssertTrue(phoneNumberE164Format1 == "+442070313000")
            let phoneNumber2 = try PhoneNumber(rawNumber: "(07912) 345 678", region: "GB")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumberInternationalFormat2 = phoneNumber2.toInternational()
            XCTAssertTrue(phoneNumberInternationalFormat2 == "+44 7912 345678")
            let phoneNumberNationalFormat2 = phoneNumber2.toNational()
            XCTAssertTrue(phoneNumberNationalFormat2 == "07912 345678")
            let phoneNumberE164Format2 = phoneNumber2.toE164()
            XCTAssertTrue(phoneNumberE164Format2 == "+447912345678")
        }
        catch {
            XCTFail()
        }
    }
    
    func testDENumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "0291 12345678", region: "DE")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumber2 = try PhoneNumber(rawNumber: "+49 291 12345678", region: "DE")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumber3 = try PhoneNumber(rawNumber: "04134 1234", region: "DE")
            XCTAssertNotNil(phoneNumber3)
            let phoneNumber4 = try PhoneNumber(rawNumber: "09123 12345", region: "DE")
            XCTAssertNotNil(phoneNumber4)
            let phoneNumber5 = try PhoneNumber(rawNumber: "+49 8021 2345", region: "DE")
            XCTAssertNotNil(phoneNumber5)
        }
        catch {
            XCTFail()
        }
    }
    
    func testITNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "02 3661 8300", region: "IT")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumber2 = try PhoneNumber(rawNumber: "+39 02 3661 8300", region: "IT")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumber3 = try PhoneNumber(rawNumber: "+390236618300", region: "IT")
            XCTAssertNotNil(phoneNumber3)
        }
        catch {
            XCTFail()
        }
    }
    
    func testAUNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "02 3661 8300", region: "AU")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumber2 = try PhoneNumber(rawNumber: "+61 2 3661 8300", region: "AU")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumber3 = try PhoneNumber(rawNumber: "+61236618300", region: "AU")
            XCTAssertNotNil(phoneNumber3)
            let phoneNumber4 = try PhoneNumber(rawNumber: "1800 123 456", region: "AU")
            XCTAssertNotNil(phoneNumber4)
            let phoneNumber5 = try PhoneNumber(rawNumber: "+61 1800 123 456", region: "AU")
            XCTAssertNotNil(phoneNumber5)
            let phoneNumber6 = try PhoneNumber(rawNumber: "+611800123456", region: "AU")
            XCTAssertNotNil(phoneNumber6)
        }
        catch {
            XCTFail()
        }
    }
    //
    func testARNumber() {
        do {
            let phoneNumber1 = try PhoneNumber(rawNumber: "011 8765-4321", region: "AR")
            XCTAssertNotNil(phoneNumber1)
            let phoneNumber2 = try PhoneNumber(rawNumber: "+54 11 8765-4321", region: "AR")
            XCTAssertNotNil(phoneNumber2)
            let phoneNumber3 = try PhoneNumber(rawNumber: "+541187654321", region: "AR")
            XCTAssertNotNil(phoneNumber3)
            let phoneNumber4 = try PhoneNumber(rawNumber: "011 15 8765-4321", region: "AR")
            XCTAssertNotNil(phoneNumber4)
            let phoneNumber5 = try PhoneNumber(rawNumber: "+54 9 11 8765 4321", region: "AR")
            XCTAssertNotNil(phoneNumber5)
            let phoneNumber6 = try PhoneNumber(rawNumber: "+5491187654321", region: "AR")
            XCTAssertNotNil(phoneNumber6)
        }
        catch {
            XCTFail()
        }
    }
    
    func testAllExampleNumbers() {
        do {
            let metaDataArray = PhoneNumberKit().metadata.items.filter{$0.codeID.characters.count == 2}
            for metadata in metaDataArray {
                let codeID = metadata.codeID
                let metaDataDescriptions = [metadata.generalDesc, metadata.fixedLine, metadata.mobile, metadata.tollFree, metadata.premiumRate, metadata.sharedCost, metadata.voip, metadata.voicemail, metadata.pager, metadata.uan, metadata.emergency]
                for desc in metaDataDescriptions {
                    if (desc != nil) {
                        let exampleNumber = desc?.exampleNumber
                        if (exampleNumber != nil) {
                            let phoneNumber = try PhoneNumber(rawNumber: exampleNumber!, region: codeID)
                            XCTAssertNotNil(phoneNumber)
                        }
                    }
                }
            }
        }
        catch {
            XCTFail()
        }
    }

    func testPerformanceSimple() {
        let numberOfParses = 1000
        let startTime = NSDate()
        var endTime = NSDate()
        var numberArray: [String] = []
        for var numberIdx = 0; numberIdx < numberOfParses; numberIdx++ {
            numberArray.append("+5491187654321")
        }
        let phoneNumbers = PhoneNumberKit().parseMultiple(numberArray, region: "AR")
        XCTAssertTrue(phoneNumbers.count == numberOfParses)
        endTime = NSDate()
        let timeInterval = endTime.timeIntervalSinceDate(startTime)
        print("time to parse \(numberOfParses) phone numbers, \(timeInterval) seconds")
        XCTAssertTrue(timeInterval < 1)
    }

}
/**
 * Copyright (C) 2017 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import SwiftyJSON

// MARK: Struct

public struct UKSpecificInfo: Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: UKSpecificInfo, rhs: UKSpecificInfo) -> Bool {
        
        return (lhs.nationalInsuranceNumber == rhs.nationalInsuranceNumber && lhs.nhsNumber == rhs.nhsNumber && lhs.drivingLicenseNumber == rhs.drivingLicenseNumber && lhs.passportNumber == rhs.passportNumber && lhs.placeOfBirth == rhs.placeOfBirth && lhs.secondPassportNumber == rhs.secondPassportNumber && lhs.passportExpiryDate == rhs.passportExpiryDate && lhs.secondPassportExpiryDate == rhs.secondPassportExpiryDate)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: UKSpecificInfo, rhs: UKSpecificInfo) -> Bool {
        
        return lhs.passportExpiryDate < rhs.passportExpiryDate
    }
    
    // MARK: - Fields
    
    private struct Fields {
        
        static let nationalInsuranceNumber: String = "nationalInsuranceNumber"
        static let nhsNumber: String = "nhsNumber"
        static let drivingLicenseNumber: String = "drivingLicenseNumber"
        static let passportNumber: String = "passportNumber"
        static let placeOfBirth: String = "placeOfBirth"
        static let secondPassportNumber: String = "secondPassportNumber"
        static let passportExpiryDate: String = "passportExpiryDate"
        static let secondPassportExpiryDate: String = "secondPassportExpiryDate"
        static let recordId: String = "recordId"
        static let unixTimeStamp: String = "unixTimeStamp"
    }
    
    // MARK: - Variables
    
    public var nationalInsuranceNumber: String = ""
    public var nhsNumber: String = ""
    public var drivingLicenseNumber: String = ""
    public var passportNumber: String = ""
    public var placeOfBirth: String = ""
    public var secondPassportNumber: String = ""
    
    public var passportExpiryDate: Date = Date()
    public var secondPassportExpiryDate: Date = Date()
    
    public var recordID: String = "-1"
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        nationalInsuranceNumber = ""
        nhsNumber = ""
        drivingLicenseNumber = ""
        passportNumber = ""
        placeOfBirth = ""
        secondPassportNumber = ""
        
        passportExpiryDate = Date()
        secondPassportExpiryDate = Date()
        
        recordID = "-1"
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init(from dict: JSON) {
        
        if let data = (dict["data"].dictionary) {
            
            if let tempNationalInsuranceNumber = (data[Fields.nationalInsuranceNumber]?.stringValue) {
                
                nationalInsuranceNumber = tempNationalInsuranceNumber
            }
            
            if let tempNhsNumber = (data[Fields.nhsNumber]?.stringValue) {
                
                nhsNumber = tempNhsNumber
            }
            
            if let tempDrivingLicenseNumber = (data[Fields.drivingLicenseNumber]?.stringValue) {
                
                drivingLicenseNumber = tempDrivingLicenseNumber
            }
            
            if let tempPassportNumber = (data[Fields.passportNumber]?.stringValue) {
                
                passportNumber = tempPassportNumber
            }
            
            if let tempPlaceOfBirth = (data[Fields.placeOfBirth]?.stringValue) {
                
                placeOfBirth = tempPlaceOfBirth
            }
            
            if let tempSecondPassportNumber = (data[Fields.secondPassportNumber]?.stringValue) {
                
                secondPassportNumber = tempSecondPassportNumber
            }
            
            if let tempPassportExpiryDate = (data[Fields.passportExpiryDate]?.intValue) {
                
                passportExpiryDate = Date(timeIntervalSince1970: TimeInterval(tempPassportExpiryDate))
            }
            
            if let tempSecondPassportNumber = (data[Fields.secondPassportExpiryDate]?.intValue) {
                
                secondPassportExpiryDate = Date(timeIntervalSince1970: TimeInterval(tempSecondPassportNumber))
            }
        }
        
        recordID = (dict[Fields.recordId].stringValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            Fields.nationalInsuranceNumber: self.nationalInsuranceNumber,
            Fields.nhsNumber: self.nhsNumber,
            Fields.drivingLicenseNumber: self.drivingLicenseNumber,
            Fields.passportNumber: self.passportNumber,
            Fields.placeOfBirth: self.placeOfBirth,
            Fields.secondPassportNumber: self.secondPassportNumber,
            Fields.passportExpiryDate: Int(HATFormatterHelper.formatDateToEpoch(date: self.passportExpiryDate)!)!,
            Fields.secondPassportExpiryDate: Int(HATFormatterHelper.formatDateToEpoch(date: self.secondPassportExpiryDate)!)!,
            Fields.unixTimeStamp: Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
        
    }
}

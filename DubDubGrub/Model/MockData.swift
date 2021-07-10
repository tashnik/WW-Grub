//
//  MockData.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/7/21.
//

import CloudKit

struct MockData {
  
  static var location: CKRecord {
    let record = CKRecord(recordType: RecordType.location)
    
    record[DDGLocation.kName] = "Sean's Bar and Grill"
    record[DDGLocation.kAddress] = "123 Main Street"
    record[DDGLocation.kDescription] = "This is a test description.  Isn't it awesome.  Not sure how long to make it to test the three lines."
    record[DDGLocation.kWebsiteURL] = "https://seanallen.co"
    record[DDGLocation.kLocation] = CLLocation(latitude: 37.331516, longitude: -121.891054)
    record[DDGLocation.kPhoneNumber] = "732-310-0690"
    
    return record
  }
}

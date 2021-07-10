//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/7/21.
//

import SwiftUI

struct AlertItem: Identifiable {
  
  let id = UUID()
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct AlertContext {
  // MARK: MapView Errors.
  static let unableToGetLocations = AlertItem(title: Text("Locations Error"), message: Text("Unable to retrieve locations at this time.\nPlease try again."), dismissButton: .default(Text("Ok")))
  
  static let locationRestricted = AlertItem(title: Text("Locations Restricted"), message: Text("Your location is restricted.  This may be due to parental control."), dismissButton: .default(Text("Ok")))
  
  static let locationDenied = AlertItem(title: Text("Locations Denied"), message: Text("Dub Dub Grub does not have permission to access your location.  To change that, got to your phone's Settings > Dub Dub Grub > Location."), dismissButton: .default(Text("Ok")))
  
  static let locationDisabled = AlertItem(title: Text("Locations Service Disabled"), message: Text("Your phone locations servies are disabled.  To change that, go to your phone's Settings > Privacy > Location Services."), dismissButton: .default(Text("Ok")))
  
  // MARK: ProfileView Errors.
  static let invalidProfile = AlertItem(title: Text("Invalid Profile"), message: Text("All fields required as well as a profile photo.  Your bio must be less than 100 characters.\n Please try again."), dismissButton: .default(Text("Ok")))
}

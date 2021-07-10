//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/5/21.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
  
  let locationManager = LocationManager()
  
  var body: some Scene {
    WindowGroup {
      AppTabView().environmentObject(locationManager)
    }
  }
}

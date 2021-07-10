//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/8/21.
//

import Foundation

final class LocationManager: ObservableObject {
  
  @Published var locations: [DDGLocation] = []
}

//
//  View+Ex.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/6/21.
//

import SwiftUI

extension View {
  func profileNameStyle() -> some View {
    self.modifier(ProfileNameText())
  }
  
  func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

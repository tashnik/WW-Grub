//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/6/21.
//

import SwiftUI

struct AvatarView: View {
  
  var image: UIImage
  var size: CGFloat
  
  var body: some View {
    Image(uiImage: image)
      .resizable()
      .scaledToFit()
      .frame(width: size, height: size)
      .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView(image: PlaceholderImage.avatar, size: 90)
  }
}

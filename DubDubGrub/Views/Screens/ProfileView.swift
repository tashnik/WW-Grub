//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by Tashnik on 7/5/21.
//

import SwiftUI

struct ProfileView: View {
  
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var companyName = ""
  @State private var bio = ""
  @State private var avatar = PlaceholderImage.avatar
  @State private var isShowingPhotoPicker = false
  @State private var alertItem: AlertItem?
  
  var body: some View {
    VStack {
      ZStack {
        NameBackgroundView()
        
        HStack(spacing: 16) {
          ZStack {
            AvatarView(image: avatar, size: 84)
            EditImage()
          }
          .padding(.leading, 12)
          .onTapGesture { isShowingPhotoPicker = true }
          
          VStack(spacing: 1) {
            TextField("First Name", text: $firstName)
              .profileNameStyle()
            
            TextField("Last Name", text: $lastName)
              .profileNameStyle()
            
            TextField("Company Name", text: $companyName)
          }
          .padding(.trailing, 16)
        }
        .padding()
      }
      
      VStack(alignment: .leading, spacing: 8) {
        CharactersRemainView(currentCount: bio.count)
        
        TextEditor(text: $bio)
          .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
          .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
      }
      .padding(.horizontal, 20)
      
      Spacer()
      
      Button {
        createProfile()
      } label: {
       DDGButton(title: "Create Profile")
      }
      .padding(.bottom)
    }
    .navigationTitle("Profile")
    .toolbar {
      Button {
        dismissKeyboard()
      } label: {
        Image(systemName: "keyboard.chevron.compact.down")
      }
    }
    .alert(item: $alertItem, content: { alertItem in
      Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    })
    .sheet(isPresented: $isShowingPhotoPicker) {
      PhotoPicker(image: $avatar)
    }
  }
  
  
  func isValidProfile() -> Bool {
    guard !firstName.isEmpty,
          !lastName.isEmpty,
          !companyName.isEmpty,
          !bio.isEmpty,
          avatar != PlaceholderImage.avatar,
          bio.count < 100 else { return false }
    
    return true
  }
  
  
  func createProfile() {
    guard isValidProfile() else {
      alertItem = AlertContext.invalidProfile
      return
    }
    
    //create profile and send it to CloudKit
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProfileView()
    }
    
  }
}


struct NameBackgroundView: View {
  var body: some View {
    Color(.secondarySystemBackground)
      .frame(height: 130)
      .cornerRadius(12)
      .padding(.horizontal)
  }
}

struct EditImage: View {
  var body: some View {
    Image(systemName: "square.and.pencil")
      .resizable()
      .scaledToFit()
      .frame(width: 14, height: 14)
      .foregroundColor(.white)
      .offset(y: 30)
  }
}

struct CharactersRemainView: View {
  
  var currentCount: Int
  
  var body: some View {
    Text("Bio: ")
      .font(.callout)
      .foregroundColor(.secondary)
    +
      Text("\(100 - currentCount)")
      .bold()
      .font(.callout)
      .foregroundColor(currentCount <= 100 ? .brandPrimary : Color(.systemPink))
    +
    Text(" characters remain")
      .font(.callout)
      .foregroundColor(.secondary)
  }
}

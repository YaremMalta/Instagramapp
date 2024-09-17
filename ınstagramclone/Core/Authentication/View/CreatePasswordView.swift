//
//  CreatePasswordView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 28.08.2024.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegistrationViewModel
    
    var body: some View {
        
            VStack (spacing: 12){
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text ("Your passsword must be at least 8 characters in legth")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal , 24)
                
                
                SecureField("Password" , text : $viewModel.password)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
              
                
                NavigationLink {
                  CompleteSignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                   Text ("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width:360 , height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading ){
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                 }
            }
    }
}

#Preview {
    CreatePasswordView()
}

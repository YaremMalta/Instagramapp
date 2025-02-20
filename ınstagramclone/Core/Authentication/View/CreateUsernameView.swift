//
//  CreateUsernameView.swift
//  ınstagramclone
//
//  Created by YAREM MALTA on 28.08.2024.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegistrationViewModel
    
    
    var body: some View {
        VStack (spacing: 12){
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text ("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal , 24)
            
            
            TextField("Username" , text : $viewModel.username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
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
    
    struct CreateUsernameView_Previews: PreviewProvider {
        static var previews: some View {
            // Test ortamı için sahte bir viewModel oluşturuyoruz
            let viewModel = RegistrationViewModel()
            CreateUsernameView()
                .environmentObject(viewModel)
        }
    }
}

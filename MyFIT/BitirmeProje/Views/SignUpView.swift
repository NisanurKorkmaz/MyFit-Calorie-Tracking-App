//
//  SignUpView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 04/04/2023.
//

import SwiftUI
//import Firebase

struct SignUpView: View {
    @StateObject var model = ModelData()
    @AppStorage("log_status") var status = false
    
    var body: some View {
        
        ZStack(alignment : Alignment(horizontal: .trailing, vertical: .top), content :{
            LinearGradient(gradient: Gradient(colors: [.red, .purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("signup2")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.horizontal)
                    .clipShape(Capsule())
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .cornerRadius(300)
    
                VStack{
                    Text("New Profil on MyFit")
                        .font(.system(size: 30, weight : .heavy))
                        .foregroundColor(.white)
                }
                VStack{
                    TextField("Username", text: $model.signUpemail)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15.0)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $model.signUpPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15.0)
                        .padding(.bottom, 20)
                    SecureField("Re-Enter Password", text: $model.reEnterPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15.0)
                        .padding(.bottom, 20)

                }
                .padding()
                
                VStack{
                    Button(action: model.signup){
                        Text("SIGN UP")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.purple.opacity(0.5))
                            .clipShape(Capsule())
                    }
                }
                .padding()
            }
            Button(action : {model.isSignUp.toggle() }){
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top)
            
        })
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Message"), message: Text(model.alertMSG), dismissButton: .destructive(Text("ok -")))
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

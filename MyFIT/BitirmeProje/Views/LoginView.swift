//
//  LoginView.swift
//  BitirmeProje
//
//  Created by Nisanur Korkmaz on 04/04/2023.
//


import SwiftUI


struct LoginView: View {
    @StateObject var model = ModelData()

    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red, .purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("login2")
                    .resizable()
                    .frame(width: 130, height: 130)
                    .padding(.horizontal)
                    .clipShape(Capsule())
                    .padding(.vertical, 20)
                    .background(Color.white)
                    .cornerRadius(300)
                
                VStack{
                    Text("Welcome to MyFit")
                        .font(.system(size: 30, weight : .heavy))
                        .foregroundColor(.white)
                }
                VStack{
                    TextField("Username", text: $model.email)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15.0)
                        .padding(.bottom, 20)
                    SecureField("Password", text: $model.password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15.0)
                        .padding(.bottom, 20)
                    
                }
                .padding()
                VStack{
                    Button(action: model.login){
                        Text("LOGIN")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.purple.opacity(0.5))
                            .clipShape(Capsule())
                    }
                }
                .padding()
                
                HStack(spacing : 10){
                    Text("Don't have an account ? ")
                        .foregroundColor(.white)
                    Button(action: {
                        model.isSignUp.toggle()
                    }){
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                
            }
            Spacer()
            }
            
                .fullScreenCover(isPresented: $model.isSignUp){
                    SignUpView(model: model)
                }
                .alert(isPresented: $model.alert, content: {
                    Alert(title: Text("Message"), message: Text(model.alertMSG), dismissButton: .destructive(Text("Ok")))
                })

    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


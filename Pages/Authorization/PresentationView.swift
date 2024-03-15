import SwiftUI

struct PresentationView: View {
    @State private var showingSheet = false
    @State private var isSelected = false
    
    var body: some View {
        VStack {
                Text("Welcome!")
                  .font(Font.custom("Poppins", size: 22).weight(.medium))
                  .foregroundColor(.black)
                  .frame(width: 292, height: 60)
                  .background(Color(red: 0.93, green: 0.93, blue: 0.93).opacity(0.80))
                  .cornerRadius(24)
                  .padding(.top, 30)

            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Image("Source Code")
                    Spacer()
                    Image("Marker Pen")
                        .padding(.bottom, 70)
                    Spacer()
                    Image("Literature")
                    Spacer()
                }
                          
                Image("Quickskill")
                
                HStack {
                    Spacer()
                    Image("Console")
                    Spacer()
                    Image("iMac")
                        .padding(.top, 70)
                    Spacer()
                    Image("Rocket")
                    Spacer()
                }
            }

            Spacer()

            VStack(spacing: 10) {
              VStack(spacing: 8) {
                Text("Master skills fast and efficient using AI")
                  .font(Font.custom("Poppins", size: 17).weight(.medium))
                  .foregroundColor(.black)
              }
              .frame(height: 56)
            }
            .padding(8)
            .frame(width: 364, height: 60)
            .background(Color(red: 0.93, green: 0.93, blue: 0.93).opacity(0.80))
            .cornerRadius(24)

            HStack(alignment: .center) {
                Spacer()

                Button(action: {
                    showingSheet = true
                }, label: {
                    Text("More options")
                      .font(Font.custom("Poppins", size: 17).weight(.semibold))
                      .foregroundColor(Color("Purple"))
                })
                .sheet(isPresented: $showingSheet) {
                    // Контент модального окна
                    SheetContentView()
                }


                Spacer()
                // Кнопка для перехода на представление входа в систему
                NavigationLink(destination: LogInView()) {
                    Text("Log In")
                      .font(Font.custom("Poppins", size: 17).weight(.semibold))
                      .foregroundColor(Color("Purple"))
                }
                
                Spacer()
                // Кнопка для перехода на представление регистрации
                NavigationLink(destination: RegistrationView()) {
                    Text("Sign Up")
                      .font(Font.custom("Poppins", size: 17).weight(.semibold))
                      .foregroundColor(Color("Purple"))
                }
                Spacer(minLength: 56)
            }
            .padding(.top, 60)


        }
    }
}

#Preview {
    PresentationView()
}

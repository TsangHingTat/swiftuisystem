//for debug only

import SwiftUI

struct helpView: View {
    var time: String
    var body: some View {
        VStack {
            HStack {
                Text("develop in progress")
                    .padding()
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
            Text("develop in progress !")
                .font(.largeTitle)
                .padding()
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("tsanghingtat")
                    Text(time)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct note: View {
    var body: some View {
        Text("swipe down to pull up developer options")
    }
}

struct FeatureCell: View {
    var image: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct WelcomeScreen: View {
    @Binding var showWelcomeScreen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("MLApp")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            
            VStack(spacing: 24) {
                FeatureCell(image: "swift", title: "SwiftUI", subtitle: "This app is build with SwiftUI.", color: .red)
                
                FeatureCell(image: "hammer.fill", title: "developer options", subtitle: "swipe down to pull up developer options", color: .blue)
                
                FeatureCell(image: "info.circle.fill", title: "Version", subtitle: "App version: 1.0 (Build 3)", color: .gray)
                
                //FeatureCell(image: "exclamationmark.triangle.fill", title: "develop in progress", subtitle: "This welcome view are develop in progress.", color: .yellow)
            }
            .padding(.leading)
            
            Spacer()
            Spacer()
            
            Button(action: { self.showWelcomeScreen = false }) {
                HStack {
                    Spacer()
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(15)
        }
        .padding()
    }
}



struct note_Previews: PreviewProvider {
    static var previews: some View {
        note()
    }
}

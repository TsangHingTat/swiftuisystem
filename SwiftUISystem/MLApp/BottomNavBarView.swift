import SwiftUI
struct BottomNavBarView: View {
    @ObservedObject var viewModel: WebViewModel
    @State var isShowingBookmarks = false
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        VStack {
            HStack {
                Button(action:{
                    viewModel.webViewNavigationPublisher.send(.backward)
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.system(size:30))
                        .foregroundColor(Color.accentColor)
                    
                }
                
                Button(action:{
                    viewModel.webViewNavigationPublisher.send(.forward)
                }) {
                    Image(systemName: "arrow.forward")
                        .font(.system(size:30))
                        .foregroundColor(Color.accentColor)
                }
            }
        }
        
    }
}

import Foundation
import Combine

class WebViewModel: ObservableObject{
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle: String = "Neeva"
    var showLoader = PassthroughSubject<Bool, Never>()
    @Published var url: String = "https://alwaysboringstudio.site/"
}

enum WebViewNavigation {
    case backward, forward, reload, load
}



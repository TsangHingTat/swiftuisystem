//
//  ContentView.swift
//  SwiftUISystem
//
//  Created by Hing Tat Tsang on 30/7/2022.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

struct ContentView: View {
    @State var appname = ""
    @State var background = "wallpaper"
    @State var nav = false
    var body: some View {
        VStack {
            VStack {
                VStack {
                    if appname == "nav3" {
                        VStack {
                            ScrollView {
                                Button {
                                    appname = "mlapp"
                                    background = ""
                                    nav = false
                                } label: {
                                    nav3View(systemname: "brain.head.profile", name: "MLApp", image: "")
                                }
                                Button {
                                    appname = "Browser"
                                    background = ""
                                    nav = true
                                } label: {
                                    nav3View(systemname: "globe", name: "Browser", image: "")
                                }
                                Button {
                                    appname = "Calculator"
                                    background = ""
                                    nav = true
                                } label: {
                                    nav3View(systemname: "", name: "Calculator", image: "calc")
                                }
                                Button {
                                    appname = "Settings"
                                    background = ""
                                    nav = true
                                } label: {
                                    nav3View(systemname: "hammer", name: "Settings", image: "")
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                            Spacer()
                                .frame(height: 50)
                        }
                        
                    } else {
                        if appname == "mlapp" {
                            ImageClassifierView(classifier: ImageClassifier())
                        } else if appname == "Settings" {
                            NavigationView {
                                SettingView()
                            }
                        } else if appname == "Browser" {
                            BrowserPage()
                                .padding(.bottom, 30)
                                .preferredColorScheme(.dark)
                        } else if appname == "Calculator" {
                            CalcView().environmentObject(GlobalEnvironment())
                        } else {
                            Group {
                                VStack {
                                    HStack {
                                        ContenttimerView()
                                    }
                                    HStack {
                                        Button {
                                            appname = "mlapp"
                                            background = ""
                                            nav = false
                                        } label: {
                                            iconsView(name: "MLApp", image: "brain.head.profile", background: "blue")
                                        }
                                        Button {
                                            appname = "Browser"
                                            background = ""
                                            nav = true
                                        } label: {
                                            iconsView(name: "Browser", image: "globe", background: "blue")
                                        }
                                        Button {
                                            appname = "Calculator"
                                            background = ""
                                            nav = true
                                        } label: {
                                            iconsView(name: "Calculator", image: "", background: "blue", imagenonsf: "calc")
                                        }
                                        Button {
                                            appname = "Settings"
                                            background = ""
                                            nav = true
                                        } label: {
                                            iconsView(name: "Settings", image: "hammer", background: "blue")
                                        }
                                        
                                    }
                                    HStack {
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                    }
                                    HStack {
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                        iconsView(name: "Swift", image: "swift", background: "blue")
                                    }
                                }
                                .padding()
                                .background(
                                    Image(background)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .opacity(0.3)
                                )
                            }
                            
                        }
                    }
                    
                    if nav == false {
                        Group {
                            VStack {
                                Spacer()
                                VStack {
                                    ZStack {
                                        HStack {
                                            Button {
                                                appname = ""
                                                background = "wallpaper"
                                                nav = false
                                            } label: {
                                                VStack {
                                                    Spacer()
                                                    Image(systemName: "arrowtriangle.backward")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                    Spacer()
                                                }
                                                .padding()
                                            }
                                            Spacer()
                                            Button {
                                                appname = "nav3"
                                                background = "wallpaper"
                                                nav = true
                                            } label: {
                                                VStack {
                                                    Spacer()
                                                    Image(systemName: "squareshape")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                    Spacer()
                                                }
                                                .padding()
                                            }
                                        }
                                        Button {
                                            appname = ""
                                            background = "wallpaper"
                                            nav = false
                                        } label: {
                                            HStack {
                                                VStack {
                                                    Spacer()
                                                    Image(systemName: "circle.inset.filled")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                    
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.white)
                                }
                                
                            }
                        }
                    } else {
                        // not
                    }
                    
                }
            }
            
        }
        .overlay {
            if nav == true {
                Group {
                    VStack {
                        Spacer()
                        VStack {
                            ZStack {
                                HStack {
                                    Button {
                                        appname = ""
                                        background = "wallpaper"
                                        nav = false
                                    } label: {
                                        VStack {
                                            Spacer()
                                            Image(systemName: "arrowtriangle.backward")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                    Spacer()
                                    Button {
                                        appname = "nav3"
                                        background = "wallpaper"
                                        nav = true
                                    } label: {
                                        VStack {
                                            Spacer()
                                            Image(systemName: "squareshape")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                }
                                Button {
                                    appname = ""
                                    background = "wallpaper"
                                    nav = false
                                } label: {
                                    HStack {
                                        VStack {
                                            Spacer()
                                            Image(systemName: "circle.inset.filled")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            
                            .padding()
                            .frame(height: 50)
                            .background(Color.white)
                        }
                        
                    }
                }
            } else {
                
            }
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .portrait // And making sure it stays that way
        }.onDisappear {
            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
        }
    }
        
}


struct iconsView: View {
    var name: String
    var image: String
    var background: String
    var imagenonsf = ""
    var body: some View {
        VStack {
            if name == "Swift" {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 80, height: 80)
                            .cornerRadius(25)
                            .foregroundColor(.blue)
                            .overlay {
                                Image(systemName: "\(image)")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                    }
                    Text("\(name)")
                        .font(.subheadline)
                }
                .opacity(0)
                
            } else if imagenonsf == "" {
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: 80)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .overlay {
                            Image(systemName: "\(image)")
                                .resizable()
                                .foregroundColor(.blue)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        }
                }
                Text("\(name)")
                    .font(.subheadline)
                
           
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: 80)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .overlay {
                            Image(imagenonsf)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                }
                Text("\(name)")
                    .font(.subheadline)
            
            }
        }
    }
}

struct nav3View: View {
    var systemname = ""
    var name = ""
    var image = ""
    var body: some View {
        if systemname == "" {
            ZStack {
                Rectangle()
                    .frame(width: 250, height: 400)
                    .cornerRadius(15)
                    .foregroundColor(.gray)
                    .padding()
                VStack {
                    HStack {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .cornerRadius(25)
                            .foregroundColor(.blue)
                            .overlay {
                                Image("\(image)")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                        ZStack {
                            Text(name)
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                }
                .frame(width: 200, height: 50)
            }
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 400)
                        .cornerRadius(15)
                        .foregroundColor(.gray)
                        .padding()
                    VStack {
                        HStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .cornerRadius(25)
                                .foregroundColor(.blue)
                                .overlay {
                                    Image(systemName: systemname)
                                        .resizable()
                                        .foregroundColor(.black)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                            ZStack {
                                Text(name)
                                    .font(.subheadline)
                            }
                        }
                        Spacer()
                    }
                    .frame(width: 200, height: 50)
                
            }
        }
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


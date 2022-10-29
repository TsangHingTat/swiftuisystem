//
//  MLView.swift
//  MLApp
//
//  Created by Hing Tat Tsang on 30/7/2022.
//

import SwiftUI

struct ImageClassifierView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var first = true
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 100)
                if let imageClass = classifier.imageClass {
                    Text(imageClass)
                        .lineLimit(2)
                        .font(.largeTitle)
                        .padding()
                } else {
//                    ProgressView()
                    Text("N/A")
                        .lineLimit(2)
                        .font(.largeTitle)
                        .padding()
                }
            }
            ZStack {
                if uiImage != nil {
                    Image(uiImage: uiImage!)
                        .resizable()
                        .scaledToFit()
                        
                    
                }
                Rectangle()
                    .hidden()
                    .frame(height: 350)
                
            }
            
            VStack {
                HStack {
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                            
                        }
                        .padding()
                }
                .font(.title)
                .foregroundColor(.blue)
                
                                 
            }
        }
//        .onAppear {
//            if first == true {
//                isPresenting = true
//                sourceType = .camera
//                first = false
//            } else {
//                print("N/A")
//            }
//        }
        
        .fullScreenCover(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
            
        }
        
        .navigationTitle("ImageClassifier")
        
    }
    
}

struct Previews_ImageClassifierView_Previews: PreviewProvider {
    static var previews: some View {
        ImageClassifierView(classifier: ImageClassifier())
    }
}

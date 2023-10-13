//
//  ContentView.swift
//  Lorem Picsum
//
//  Created by Vito Borghi on 13/10/2023.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment (\.modelContext) var modelContext
    @Query var gallery: [RandyRandyPic]
    
    private var imageURL: URL = URL(string: "")!
    @State private var id = Int.random(in: 0...1000)
    private var downloadedImage: Data? = nil
    
    var body: some View {
        NavigationStack{
            VStack{
                imageContent(id: id)
                .padding()

                Group {
                    Button("Save to album"){
                        Task {
                            //await downloadImage(url: imageURL, context: modelContext)
                        }
                    }
                    .padding()
                    
                    Button ("View Album"){
                        //action
                    }
                    .padding()
                    
                    Button("New Pic") {
                        id = Int.random(in: 0...1000)
                    }
                }
                .buttonStyle(.borderedProminent)

                    
            }
        }
    }
}

func downloadImage(url: URL, context: ModelContext) async {
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let pic = RandyRandyPic(image: data)
        context.insert(pic)
        try? context.save()
    }
    catch {
        print("invalid data.")
    }
    print("image downloaded and saved successfully.")
}

//
//func downloadImage(url: URL, completion: @escaping (Data?) -> Void) {
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        if let error = error {
//            print("Error downloading image: \(error.localizedDescription)")
//            completion(nil)
//            return
//        }
//        completion(data)
//    }.resume()
//}

struct imageContent: View {
    
    private let imageModifiers = ["none", "grayscale","blur"]
    @State public var imageModifier: String = "" {
    willSet {
        if newValue == "none" {
            imageModifier = ""
        }
    }
}
    @State var id: Int

    
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/id/\(id)/400/300/?\(imageModifier)"), scale: 1) { phase in
            switch phase {
                case .empty: ProgressView()
                case .success(let loadedImage): loadedImage
                case .failure: Text("Failed to load the image. Try Again.")
                @unknown default: EmptyView()
            }
        }
        Picker("image modifier", selection: $imageModifier) {
            ForEach(imageModifiers, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.palette)
    }
}

//#Preview {
//    ContentView()
//}

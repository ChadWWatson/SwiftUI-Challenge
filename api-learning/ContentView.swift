//
//  ContentView.swift
//  api-learning
//
//  Created by Isaac Hansen on 3/5/20.
//  Copyright © 2020 Isaac Hansen. All rights reserved.
//

import SwiftUI
import SDWebImage

struct ContentView: View {
    
    @ObservedObject var getData = datas()
    
    var body: some View {
//
        NavigationView{
            List(getData.jsonData) {i in
                
                ListRow(name: i.title)
            }.navigationBarTitle("Isaac Learns Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class datas : ObservableObject {
    @Published var jsonData = [datatype]()
    
    init() {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/photos")!) { (data, _, _) in
            
            do {
                let fetch = try JSONDecoder().decode([datatype].self, from: data!)
                
                DispatchQueue.main.async {
                    self.jsonData = fetch
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct datatype : Identifiable, Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

struct ListRow : View {
    
//    var url :  String
    var name : String
    
    var body : some View {
        HStack {
//            Image(url: URL(string: url)).resizable().frame(width: 60, height: 60)
//                .clipShape(Rectangle())
            
            
            Button(action: {}, label: {
            Text(name).fontWeight(.heavy).padding(.leading)
            }).padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
                .aspectRatio(contentMode: .fill)
        }
    }
}
 

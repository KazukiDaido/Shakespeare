//
//  ContentView.swift
//  Shakespeare
//
//  Created by 大道一輝 on 2023/02/28.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "a"
    @State private var note = ""
    @State private var age = ""
    @State private var registerDate = ""
    
    var body: some View {
        /*
         Text(name)
         Text(note)
         Text(age)
         Text(registerDate)
         */
        VStack{
            Button("名前変更ボタン") {
                pushBotton()
            }
        }
    }
    func pushBotton() {
        /*var shakespeare =
         Shakespeare(name: "a", note: "b", age: 12, registerDate: "c")
         name = shakespeare.name
         note = shakespeare.note
         age = "\(shakespeare.age)"
         registerDate = shakespeare.registerDate
         */
        let url = URL(string: "https://umayadia-apisample.azurewebsites.net/api/persons")!  //URLを生成
        let request = URLRequest(url: url)//Requestを生成
        print("--------------1")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                // let object = try JSONSerialization.jsonObject(with: data, options: []) // DataをJsonに変換
                // print(object)
                print("--------------2")
                let decoder = JSONDecoder()
                let response = try decoder.decode(Success.self, from: data)
                /*
                 print(response)
                 name = response.data[1].name
                 note = response.data[1].note
                 age = "\(response.data[1].age)"
                 registerDate = response.data[1].registerDate
                 */
                List {
                    ForEach(0 ..< response.data.count, id: \.self) { index in
                        Text(response.data[index].name)
                    }
                }
            } catch {
                fatalError("Couldn't parse as \(Shakespeare.self):\n\(error)")
            }
        }
        task.resume()
        print("--------------3")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

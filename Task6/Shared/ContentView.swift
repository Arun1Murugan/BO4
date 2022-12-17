//
//  ContentView.swift
//  Shared
//
//  Created by Arun_Skyraan on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    
    var controllerObject1 = CoreDataController()
    var jsonObject1 = myJsonClass()
    
    let myColumns : [GridItem] =
    [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var CoreDataEntity : [MyDataModel1AEntity] = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: myColumns) {
                    ForEach(CoreDataEntity, id: \.self){ index in
                       
                            NavigationLink(destination: {
                                ScreenBCA(Ctid: index.categoryId ?? "")
                            }, label: {
                                VStack() {
                                
                            ImageWithURL("\(index.catgoryThumbURL!.replacingOccurrences(of: "http", with: "https"))")
                                .clipShape(Circle())
                                
                            Text("\(index.categoryTitle ?? "")")
                                .font(.headline)
                            }
                            .frame(width: 180, height: 190)
                            .cornerRadius(10)
                            .border(.blue, width: 2)
                            })
                      
                        
                    }
                }
               
                .foregroundColor(.purple)
                .background(Color.white)
                .onAppear(perform: {
                    
                    checkData()
                    
                })
            }
            
            
            
        }
        .navigationTitle("Categories")
    }
    func checkData() {
        CoreDataEntity =  CoreDataController.controllerObject.getAllDetails()
        
        if CoreDataEntity.count == 0 {
            
            FetchUrl(CountryCode: "IN")
            
        }
    }
    
    
    
    @State var jsonData : [MyDataModel1A] = []
    
    func FetchUrl(CountryCode: String){
        
        let postData = NSMutableData(data: "categoryCountry=IN".data(using: String.Encoding.utf8)!)
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://bookmaddie.com/webservice/api/get_categories.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode(MyDataModel1.self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.jsonData = decodedResponse.categoriesList
                        for x in self.jsonData{
                            CoreDataController.controllerObject.savaDetails(categoryId: x.categoryId, categoryTitle: x.categoryTitle, catgoryThumbURL: x.catgoryThumbURL, isFav: x.isFav, icon_rgb: x.icon_rgb, categoryThumbUploadType: x.categoryThumbUploadType, categoryIconUploadType: x.categoryIconUploadType)
                            checkData()
                        }
                    }
                    return
                }
                else
                {
                    print("json parse error")
                }
            }else{
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")}
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

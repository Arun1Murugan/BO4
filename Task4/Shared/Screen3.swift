//
//  Screen4.swift
//  Task4
//
//  Created by Arun_Skyraan on 19/09/22.
//

import SwiftUI

struct Screen3: View {
    
    @State var bookid : String
    @ObservedObject var myObject2 = myClass()
    @State var BookDetails : myStructure2A? 
    
    var body: some View {
        
        if myObject2.obj2.count > 0{
            Text("")
                .onAppear(perform: {
                    for x in myObject2.obj2{
                        if x.bookId == bookid{
                             BookDetails = x
                        }
                    }
                })
            if BookDetails != nil{
        VStack(spacing : 10) {
            ZStack {
                    HStack(spacing : 10) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 28))
                        Spacer()
                        Image(systemName: "bookmark")
                            .font(.system(size: 25))
                        Image(systemName: "ellipsis")
                            .font(.system(size: 25))
                            .rotationEffect(.degrees(-90))
                    }
//                    .frame( alignment: .topTrailing)
//                    .padding(.leading)
            }
            .frame(alignment: .topTrailing)
                    
                    ImageWithURL("\(BookDetails!.bookImage.replacingOccurrences(of: "http", with: "https"))")
//                    Image("images-24")
//                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    Text("\(BookDetails!.bookName)")
//                    Text("book name")
                        .font(.title2)
                        .bold()
            Text("\(BookDetails!.BookPublisherName)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                    }
            Text("\(BookDetails!.bookDescription)")
//                    Text("Descriptionasdfghjklasdfghjklsdfghjklasdfghjklasdfghjkzxcvbnmasdfghjksdfghjkl")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .frame( height: 200)
//                        .padding()
                    HStack(spacing : 50) {
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "eye")
                                Text("preview")
                            }
                        })
                        .frame(width: 140, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 4.0)
//                        .padding(10)
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "message")
                                Text("review")
                            }
                        })
                        .frame(width: 140, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 4.0)
//                        .padding(10)
                        
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing : 180) {
                        Text("PAYOUT")
                        Text("$99.99")
                        }
                    })
                    .foregroundColor(.white)
                    .frame(width: 340, height: 40)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding()
              Spacer()

//                ImageWithURL("\(BookDetails!.bookImage.replacingOccurrences(of: "http", with: "https"))")
//                AsyncImage(url: URL(string: ""))
            
            }
        .padding()
        }else{
            Text("please wait...")
                .onAppear(perform: {

                    myObject2.fetchurl2(myImage: bookid)

                })
        }
        }else{
            Text("please wait...")
                .onAppear(perform: {

                    myObject2.fetchurl2(myImage: bookid)

                })
        }

        
    }
    
 
}

struct Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Screen3(bookid: "115")
    }
}

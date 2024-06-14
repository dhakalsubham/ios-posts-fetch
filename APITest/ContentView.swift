//
//  ContentView.swift
//  APITest
//
//  Created by Subham Dhakal on 6/3/24.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem]
    
    private var insertedPosts = false // To ensure we insert posts only once


    var body: some View {
        VStack {
            if !viewModel.posts.isEmpty {

                        VStack {
                            Text("Tap on this button to add data")
                            Button("Add the Item"){
                                insertPosts(viewModel.posts)
                            }
                                        List{
                                            ForEach(items){ item in
                                                Text(item.name)
                                            }
                                            .onDelete{ indexes in
                                                for index in indexes{
                                                }
                                            }
                                        }
                         
                        }
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchPosts()
            insertPosts(viewModel.posts)
            
        }
    }
    
    func insertPosts(_ posts: [Post]) {
        for post in posts {
            // Assuming context is the managed object context where you want to insert the posts
            let dataItem = DataItem(name: post.title) // Assuming Post has a 'title' property
            context.insert(dataItem)
        }
    }

}



//import SwiftUI
//import SwiftData
//
//@available(iOS 17.0, *)
//struct ContentView: View {
//    @StateObject private var viewModel = PostViewModel()
//    @Environment(\.modelContext) private var context
//    
//    @Query private var items: [DataItem]
//    
//    var body: some View {
//        VStack {
//            Text("Tap on this button to add data")
//            Button("Add the Item"){
//                addItem()
//            }
//            List{
//                ForEach(items){ item in
//                    Text(item.name)
//                }
//                .onDelete{ indexes in
//                    for index in indexes{
//                        deleteItem(items[index])
//                    }
//                }
//            }
//        }
//        .onAppear {
//            viewModel.fetchPost()
//        }
//    }
//    
//    func deleteItem(_ item: DataItem){
//        context.delete(item)
//    }
//    
//    func addItem(){
//        let item = DataItem(name:"Test Item")
//        context.insert(item)
//    }
//}

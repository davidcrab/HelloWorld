//
//  ContentView.swift
//  HelloWorld
//
//  Created by David Crabtree on 8/8/24.
//

import SwiftUI

// there is an issue making global let calls
// let guideName: String
//@State private var myGuide: String? = ""
// @Observable
//class Book: Identifiable {
//    var title = "Same guide"
//}

@Observable
class Step: Identifiable {
    var name = "name of step"
}

@Observable
class Guide: Identifiable {
    var title = "This is a guide"
    var description = "description"
    var steps = [Step()]
    
    // how would i change what is returnedwhen Guide is printed?
    
    // yeah well i clearly don't know how to do this. it is tought because it would be important right now.
    // how can i change what is printed with these are printed
    func print() -> String {
        return "override"
        //Swift.print("override print statement", title)
    }
}

struct ContentView: View {
    // @Bindable var book: Book
    // we could put the guideName here but that wouldn't make much sense would it
    // let guideName: String
    // var textInput: String @Binding
    // @State private var myMoney: Double? = 300.0
    @State private var exampleGuides = [Guide(), Guide(), Guide()]
    @State private var guideName: String = "hello"

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, David!")
            TextField("Test", text: $guideName).onChange(of: guideName, initial: true, { oldValue, newValue in
                print("guideName: \(guideName)")
            })
            List(exampleGuides) { guide in
                @Bindable var guide = guide
                TextField("Title", text: $guide.title).onChange(of: guide.title) { oldValue, newValue in
                    print("Guide One's title: \(exampleGuides[0].title)")
                }
            }
            List {
                ForEach(exampleGuides) { guide in
                    VStack {
                        Text(guide.title).font(.title3)
                        Label(guide.description, systemImage: "note")
//                        List {
//                            ForEach(guide.steps) { step in
//                                Text(step.name)
//                            }
//                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    // let booktest: Book
    ContentView()
}


/*
 nice. now i have successfully taught myself how to do this without using google or anything thing else. i ask a question and i find the answer within the code. that is how abstraction works...
 
 okay so now i want to
 */

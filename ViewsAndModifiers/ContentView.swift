//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Esben Viskum on 04/04/2021.
//

import SwiftUI

struct CapsuleText : View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermark(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let colums: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<colums, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

extension View {
    func prominentTitle() -> some View {
        self.modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("En titel")
            .prominentTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

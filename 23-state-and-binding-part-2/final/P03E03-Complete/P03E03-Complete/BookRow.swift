/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct BookRow: View {
  
  @Binding var book: Book
  @ObservedObject var user: User
  
  var proxy: GeometryProxy
  
  var body: some View {
    
    NavigationLink(destination: BookDetailView(book: $book, user: user)) {
      
      VStack {
        Text(book.title)
          .fontWeight(.bold)
          .font(Font.system(.headline, design: .rounded))
          .minimumScaleFactor(0.75)
          .padding(.top)
          .multilineTextAlignment(.center)
          .lineLimit(nil)
          .foregroundColor(.white)
        
        Image(book.imageName)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .padding()
          .shadow(color: .gray, radius: 20)
      }
      .padding()
        .frame(width: max(proxy.size.width - proxy.frame(in: .global).midX, proxy.size.width),
        height: proxy.size.height - 50)
        
        
        .background(Image(book.imageName)
          .renderingMode(.original)
          .resizable()
          .scaledToFill()
          .opacity(1)
          .overlay(Color.rayWenderlichGreen)
          .blendMode(.multiply)
          .blur(radius: 1))
        
        
        .cornerRadius(10)
        .padding(.vertical)
        .shadow(radius: 3)
        .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).midX) / 40), axis: (x: -4, y: -3, z: -3))
    }    
  }
}

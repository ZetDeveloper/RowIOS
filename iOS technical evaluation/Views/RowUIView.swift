//
//  RowUIView.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//

import SwiftUI


struct RowUIView: View {
    @State private var showingAlert = false
    @State var model: RowModelElement?
    
    var image: some View {
        #if DEV
        return Image("DayNumber").resizable().colorMultiply(Color.green.opacity(0.6))
        #else
        return Image("DayNumber").resizable()
        #endif
    }
    
    var body: some View {
        
        Button(action: { self.showingAlert = true }) {
            
            HStack(alignment: .top, spacing: 20) {
                VStack(spacing: 0) {
                    Text("\(model?.day ?? 0)")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                }
                .background(image)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(10)
                
                
                
                VStack(alignment: .leading){
                    Text("Day \(model?.day.asWord ?? "")".uppercased())
                        .font(.system(size: 10))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.gray.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 10)
                    
                    
                    Text(model?.title ?? "")
                        .font(.system(size: 12))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 5)
                    
                    Text(model?.subtitle ?? "")
                        .font(.system(size: 12))
                        
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.gray.opacity(0.8))
                    
                    
                }
                .padding(.bottom, 5)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .colorMultiply(Color.gray.opacity(0.8))
                    .padding()
                
            }
            .background(Color.white)
            
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.model?.title ?? ""), message: Text(self.model?.subtitle ?? ""), dismissButton: .default(Text("OK!")))
        }
    }
}

struct RowUIView_Previews: PreviewProvider {
    static var previews: some View {
        RowUIView()
    }
}

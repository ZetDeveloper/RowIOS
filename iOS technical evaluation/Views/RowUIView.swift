//
//  RowUIView.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//

import SwiftUI


struct RowUIView: View {
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading, spacing: 0) {
            Text("1")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .background(Image("DayNumber"))
                .padding(.leading, 10)
                .padding(.top, 10)
                
                
            }
            .padding()
            
            
            VStack(alignment: .leading){
                Text("Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica. Lorem Ipsum ha sido el texto de relleno estándar de la industria desde la década de 1500, cuando un impresor desconocido tomó una galera de tipos y la mezcló para hacer un libro de muestras tipo. Ha sobrevivido no solo a cinco siglos, sino también al salto a la composición tipográfica electrónica, permaneciendo esencialmente sin cambios. Se popularizó en la década de 1960 con el lanzamiento de hojas de Letraset que contienen pasajes de Lorem Ipsum y, más recientemente, con software de autoedición como Aldus PageMaker que incluye versiones de Lorem Ipsum.")
                    .font(.system(size: 10))
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 20)
                    
                
                Text("Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica. Lorem Ipsum ha sido el texto de relleno estándar de la industria desde la década de 1500, cuando un impresor desconocido tomó una galera de tipos y la mezcló para hacer un libro de muestras tipo. Ha sobrevivido no solo a cinco siglos, sino también al salto a la composición tipográfica electrónica, permaneciendo esencialmente sin cambios. Se popularizó en la década de 1960 con el lanzamiento de hojas de Letraset que contienen pasajes de Lorem Ipsum y, más recientemente, con software de autoedición como Aldus PageMaker que incluye versiones de Lorem Ipsum.")
                    .font(.system(size: 12))
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 8)
                
                Text("Lorem Ipsum es simplemente texto de relleno de la industria de la impresión y la composición tipográfica. Lorem Ipsum ha sido el texto de relleno estándar de la industria desde la década de 1500, cuando un impresor desconocido tomó una galera de tipos y la mezcló para hacer un libro de muestras tipo. Ha sobrevivido no solo a cinco siglos, sino también al salto a la composición tipográfica electrónica, permaneciendo esencialmente sin cambios. Se popularizó en la década de 1960 con el lanzamiento de hojas de Letraset que contienen pasajes de Lorem Ipsum y, más recientemente, con software de autoedición como Aldus PageMaker que incluye versiones de Lorem Ipsum.")
                    .font(.system(size: 12))
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.top, 3)
                    
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .padding()
            
        }
        
        
    }
}

struct RowUIView_Previews: PreviewProvider {
    static var previews: some View {
        RowUIView()
    }
}

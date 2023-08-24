//
//  HeaderView.swift
//  ToDoListSwiftUI
//
//  Created by Umut Barış Çoşkun on 24.08.2023.
//

import SwiftUI

struct HeaderView: View {
    let titleString: String
    let subTitleString: String
    let angle: Double
    let background: Color
    var body: some View {
       
            ZStack{
                RoundedRectangle(cornerRadius: 0).foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                
                
                VStack{
                
                    Text(titleString)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    Text(subTitleString)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                }.padding(.top, 80)
                
            }.frame(width: UIScreen.main.bounds.width * 3,height: 350)
                .offset(y: -150)
           
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(titleString: "Title", subTitleString: "Subtitle", angle: 15, background: .blue)
    }
}

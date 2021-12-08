//
//  PreLaunchView.swift
//  ME-kit
//
//  Created by Apprenant 99 on 08/12/2021.
//

import SwiftUI

struct PreLaunchView: View {
    @State private var showMainView = false
    @State private var angle: Double = 360
    @State private var opacity: Double = 1
    @State private var scale: CGFloat = 0.5

    var body: some View {
        Group{
            if showMainView {
                TabBarView()
            } else {
                ZStack{
                    Color("greenMEkit")
                        .edgesIgnoringSafeArea(.all)
                    Image("logoMEkit")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 250, height: 250)
                        .rotation3DEffect(
                            .degrees(angle),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                        .opacity(opacity)
                        .scaleEffect(scale)
                        
                }
            }
        }.onAppear{
            withAnimation(.linear(duration: 1.4)){
                angle = 0
                scale = 3
                opacity = 0
            }
            withAnimation(Animation.linear.delay(1.5)){
                showMainView = true
            }
        }
    }
}

struct PreLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        PreLaunchView()
    }
}

//
//  ContentView.swift
//  PlanetExplorerGame
//
//  Created by PAUL BARRY on 2022-08-16.
//

import SwiftUI

struct GameView: View {

    @State private var shipPosition = CGPoint(x:100, y: 100)
    @State private var planetComponentPosition = CGPoint(x:1000, y: 300)
    @State private var isPaused = false
    @State private var score = 0
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()


    var body: some View {
        
        GeometryReader { geo in
            
        
            ZStack{

                SpaceShipView()
                    .position(self.shipPosition)
                    .onReceive(self.timer) {_ in
                        self.gravity()
                    }
                
                PlanetComponentView()
                    .position(self.planetComponentPosition)
                    .onReceive(self.timer) {_ in
                        self.planetComponentPositionMove()
                    }
                
                Text("\(self.score)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10 )

                Text("\(self.shipPosition.y)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 20 )

                self.isPaused ? Button("Resume") { self.resume() } : nil

                                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            .gesture(
            TapGesture()
                .onEnded{
                    withAnimation{
                        self.shipPosition.y -= 100
                    }
            })
                .onReceive(self.timer) { _ in
                    self.collisionDetection();
                    self.score += 1
            }
        }
        .edgesIgnoringSafeArea(.all)

        }
    
    //functions
    
    func gravity() {
        withAnimation{
            self.shipPosition.y += 20
        }
    }
    
    func planetComponentPositionMove() {
        
        if self.planetComponentPosition.x > 0
        {
            withAnimation{
                self.planetComponentPosition.x -= 20
            }
        }
        else
        {
            self.planetComponentPosition.x = 1000
            self.planetComponentPosition.y = CGFloat.random(in: 0...500)
            
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    }
    
    func resume() {
        
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        self.planetComponentPosition.x = 1000 // move obsitcle to starting position
        self.shipPosition = CGPoint(x: 100, y: 100) // helicopter to tarting position
        self.isPaused = false
        self.score = 0
    }
    
    func collisionDetection() {
      
        //detect collision with planent component
        if abs(shipPosition.x - planetComponentPosition.x) < (25 + 10) && abs(shipPosition.y - planetComponentPosition.y) < (25 + 100) {
            self.pause()
            self.isPaused = true
        }
        
        //detect collision with ground
        if (shipPosition.y == 800.0){
            self.pause()
            self.isPaused = true
        }

        
    }

}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

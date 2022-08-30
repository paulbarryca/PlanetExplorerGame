//
//  SpaceShipView.swift
//  PlanetExplorerGame
//
//  Created by PAUL BARRY on 2022-08-16.
//

import SwiftUI

struct SpaceShipView: View {
    
    let rows = 5
    let columns = 5
    let size: CGFloat = 10
    var heliBlocks: [[Color]] = [[.clear,.clear,.gray,.clear,.clear],
                                 [.clear,.clear,.green,.clear,.clear],
                                 [.clear,.green,.green,.green,.clear],
                                 [.green,.green,.green,.green,.green],
                                 [.gray,.clear,.green,.clear,.gray]]
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            ForEach((0...self.rows - 1), id: \.self) { row in
                HStack (spacing: 0) {
                    ForEach((0...self.columns - 1), id: \.self) { col in
                        VStack (spacing: 0) {
                            ShipPixelComponentView(size: self.size, color: self.heliBlocks[row][col])
                        }
                    }
                }
            }
        }
    }
    
    mutating func fireThrusters()
    {
        self.heliBlocks = [[.clear,.clear,.gray,.clear,.clear],
                                     [.clear,.clear,.green,.clear,.clear],
                                     [.clear,.green,.green,.green,.clear],
                                     [.green,.green,.green,.green,.green],
                                     [.red,.clear,.red,.clear,.red]]
    }
    mutating func shutDownThrusters()
    {
        self.heliBlocks = [[.clear,.clear,.gray,.clear,.clear],
                                     [.clear,.clear,.green,.clear,.clear],
                                     [.clear,.green,.green,.green,.clear],
                                     [.green,.green,.green,.green,.green],
                                     [.gray,.clear,.gray,.clear,.gray]]
    }
}

struct SpaceShipView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceShipView()
    }
}

//
//  ShipPixelComponentView.swift
//  PlanetExplorerGame
//
//  Created by PAUL BARRY on 2022-08-16.
//

import SwiftUI

struct ShipPixelComponentView: View {
    let size: CGFloat
    let color: Color
    
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
    
}

struct ShipPixelComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipPixelComponentView(size: 10, color: .blue)
    }
}

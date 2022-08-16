//
//  PlanetComponentView.swift
//  PlanetExplorerGame
//
//  Created by PAUL BARRY on 2022-08-16.
//

import SwiftUI

struct PlanetComponentView: View {
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View {
        
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.green)
        
    }
}

struct PlanetComponentView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetComponentView()
    }
}

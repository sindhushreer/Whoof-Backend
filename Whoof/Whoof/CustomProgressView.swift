//
//  CustomProgressView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import SwiftUI

struct CustomProgressView: View {
    var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .opacity(0.3)
                .foregroundColor(Color.black)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .square, lineJoin: .round))
                .opacity(0.7)
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}

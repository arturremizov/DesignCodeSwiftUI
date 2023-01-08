//
//  BlobView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct BlobView: View {
    
    @State var didAppear: Bool = false
    
    var body: some View {
        TimelineView(.animation) { timeline in
            let nowTimeInterval = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle(degrees: nowTimeInterval.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle(degrees: nowTimeInterval.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
//            Text("x: \(x)")
            Canvas { context, size in
                context.fill(
                    path(in: CGRect(origin: .zero, size: size), x: x, x2: x2),
                    with: .linearGradient(
                        Gradient(colors: [.pink, .blue]),
                        startPoint: CGPoint(x: 0, y: 0),
                        endPoint: CGPoint(x: size.width, y: size.height)
                    )
                )
            }
            .frame(width: 400, height: 414)
            .rotationEffect(Angle(degrees:didAppear ? 360 : 0))
        }
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
                didAppear = true
            }
        }
    }
    
    func path(in rect: CGRect, x: CGFloat, x2: CGFloat) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: 0.9923 * width, y: 0.42593 * height))
        
        path.addCurve(
            to: CGPoint(x: 0.6355 * width * x2, y: height),
            control1: CGPoint(x: 0.92554 * width * x2, y: 0.77749 * height * x2),
            control2: CGPoint(x: 0.91864 * width * x2, y: height)
        )
        
        path.addCurve(
            to: CGPoint(x: 0.08995 * width, y: 0.60171 * height),
            control1: CGPoint(x: 0.35237 * width * x, y: height),
            control2: CGPoint(x: 0.2695 * width, y: 0.77304 * height)
        )
        
        path.addCurve(
            to: CGPoint(x: 0.34086 * width, y: 0.06324 * height * x),
            control1: CGPoint(x: -0.0896 * width, y: 0.43038 * height),
            control2: CGPoint(x: 0.00248 * width, y: 0.23012 * height * x)
        )
        
        path.addCurve(
            to: CGPoint(x: 0.9923 * width, y: 0.42593 * height),
            control1: CGPoint(x: 0.67924 * width, y: -0.10364 * height * x),
            control2: CGPoint(x: 1.05906 * width, y: 0.07436 * height * x2)
        )
        
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

//
//  SymbolShape.swift
//  SetGame
//
//  Created by sorn tanharaphan on 25/12/2564 BE.
//

import SwiftUI


struct Diamond: Shape{
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.width * 0.8
        let halfWidth = width/2
        let height = width / 3
        let halfHeight = height/2
        let c1 = CGPoint(
            x: center.x - halfWidth,
            y: center.y
        )
        let c2 = CGPoint(
            x: center.x,
            y: center.y + halfHeight
        )
        let c3 = CGPoint(
            x: center.x + halfWidth,
            y: center.y
        )
        let c4 = CGPoint(
            x: center.x,
            y: center.y - halfHeight
        )
        
        
        var p = Path()
        p.move(to: c1)
        p.addLine(to: c2)
        p.addLine(to: c3)
        p.addLine(to: c4)
        p.addLine(to: c1)
        
        return p
    }
  
}

struct Squiggle: Shape{
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.width * 0.8
        let halfWidth = width/2
        let height = width / 3
        let halfHeight = height/2
        // mt stands for middle top
        let mt = CGPoint(
            x: center.x,
            y: center.y + halfHeight
        )
        // mb stands for middle bottom
        let mb = CGPoint(
            x: center.x,
            y: center.y - halfHeight
        )
        // crt stands for control point on the right at the top
        let crt = CGPoint(
            x: center.x + halfWidth/2,
            y: center.y + 0.7*halfHeight
        )
        let crb = CGPoint(
            x: center.x + halfWidth/2,
            y: center.y - 0.7*halfHeight
        )
        let clt = CGPoint(
            x: center.x - halfWidth/2,
            y: center.y + 0.7*halfHeight
        )
        // crt stands for control point on the left at the bottom
        let clb = CGPoint(
            x: center.x - halfWidth/2,
            y: center.y - 0.7*halfHeight
        )
        // flp stands for the far-left point
        let flp = CGPoint(
            x: center.x - halfWidth,
            y: center.y + 1.5*halfHeight
        )
        let frp = CGPoint(
            x: center.x + halfWidth,
            y: center.y - 1.5*halfHeight
        )
        
        var p = Path()
        p.move(to: mt)
        p.addQuadCurve(to: frp, control: crt)
        p.addQuadCurve(to: mb, control: crb)
        p.addQuadCurve(to: flp, control: clb)
        p.addQuadCurve(to: mt, control: clt)
        
        
        return p
    }
}

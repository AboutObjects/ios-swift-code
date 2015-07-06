// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

// MARK: - CoolView class
class CoolView: UIView
{
    var cells = [CoolViewCell]()
    var previousCellFrame: CGRect = CGRectZero
    var selectedCell: CoolViewCell? = nil {
        willSet { newValue?.selected = true }
    }
    
    func addCell(text: String, color: UIColor? = nil, origin: CGPoint? = CGPointZero)
    {
        let cell = CoolViewCell(text: text)
        
        if let bgColor = color { cell.backgroundColor = bgColor }
        if let position = origin {
            cell.frame = CGRectOffset(cell.frame, position.x, position.y)
        }
        
        addSubview(cell)
        cells.append(cell)
    }
    
    func handleSelection(#cell: CoolViewCell)
    {
        cells.perform { (cell: CoolViewCell) in cell.selected = false }
        
        selectedCell = cell === selectedCell ? nil : cell
    }
}

// MARK: UIResponder Event Phase Methods
extension CoolView
{
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        if let touch: UITouch = touches.first as? UITouch,
            let cell: CoolViewCell = touch.view as? CoolViewCell
        {
            handleSelection(cell: cell)
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) { }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) { }
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) { }
}
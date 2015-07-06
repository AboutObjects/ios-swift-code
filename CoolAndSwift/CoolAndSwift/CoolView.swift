// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

// MARK: - CoolViewDelegate Protocol
@objc protocol CoolViewDelegate : NSObjectProtocol
{
    // NOTE: `optional` protocol methods only available for objc types.
    optional func coolView(coolView: CoolView, didSelectRowAtIndex index: Int)
    optional func coolView(coolView: CoolView, didDeselectRowAtIndex index: Int)
}

// MARK: - CoolView class
class CoolView: UIView
{
    // NOTE: Declared `weak` to avoid potential retain cycles.
    @IBOutlet weak var delegate: CoolViewDelegate?
    
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
    
    func removeCell(cell: CoolViewCell)
    {
        if let index = indexOfCell(cell) {
            cells[index].removeFromSuperview()
            cells.removeAtIndex(index)
            
            delegate?.coolView?(self, didDeselectRowAtIndex: index)
        }
    }
}

extension CoolView
{
    override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
    }
}

// MARK: Handling Selection
extension CoolView
{
    func indexOfCell(cell: CoolViewCell) -> Int?
    {
        return find(cells, cell)
    }
    
    func indexOfSelectedCell() -> Int?
    {
        if let cell = selectedCell {
            return indexOfCell(cell)
        }
        return nil
    }

    func cellAtIndex(index: Int) -> CoolViewCell
    {
        return cells[index]
    }
    
    func deselectAllCells()
    {
        cells.perform { (cell: CoolViewCell) in
            cell.selected = false
        }
    }
    
    /// If `cell` is already selected, deselects it, otherwise, selects it.
    /// Selection is mutually exclusive; `CoolView` doesn't currently support
    /// multiple selection.
    ///
    /// Sends the following delegate notification messages, if the delegate
    /// implements them:
    ///
    /// `coolView(didSelectCellAtIndex:)`
    ///     Sent immediately after selecting the provided cell
    ///
    ///
    /// `coolView(didDeselectCellAtIndex:)`
    ///     Sent immediately after deselecting a cell
    ///
    /// :param: cell The cell to select (or deselect)
    func handleSelection(#cell: CoolViewCell)
    {
        deselectAllCells()
        
        
        if cell === selectedCell {
            let index = indexOfSelectedCell()
            selectedCell = nil
            if index != nil {
                delegate?.coolView?(self, didDeselectRowAtIndex: index!)
            }
        } else {
            selectedCell = cell
            delegate?.coolView?(self, didSelectRowAtIndex: indexOfSelectedCell()!)
        }
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
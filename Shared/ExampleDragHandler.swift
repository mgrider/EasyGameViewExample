import SwiftUI
import EasyGameView

public struct ExampleDragHandler: EasyGameSubviewHandleDrag {

    public func handleDragContinued(forIndex index: Int,
                                    withGestureValue value: DragGesture.Value,
                                    inManager manager: EasyGameManager) {
        print("in handleDragContinued for subview index: \(index)")
    }

    public func handleDragEnded(forIndex index: Int,
                                withGestureValue value: DragGesture.Value,
                                inManager manager: EasyGameManager) {
        print("in handleDragEnded for subview index: \(index)")
    }

    public init() {}
}

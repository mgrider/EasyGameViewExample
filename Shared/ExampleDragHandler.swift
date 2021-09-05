import SwiftUI
import EasyGameView

public struct ExampleDragHandler: EasyGameSubviewHandleDrag {
    public func handleDragContinued(forIndex index: Int,
                                    withOffset offset: CGSize,
                                    inGame game: EasyGameState,
                                    withConfiguration configuration: EasyGameViewConfiguration) -> EasyGameState {
        var game = game
        game.setState(atIndex: index, to: 2)
        return game
    }

    public func handleDragEnded(forIndex index: Int,
                                withOffset offset: CGSize,
                                inGame game: EasyGameState,
                                withConfiguration configuration: EasyGameViewConfiguration) -> EasyGameState {
        var game = game
        game.setState(atIndex: index, to: 2)

        guard configuration.subviewSize.width > 0,
              configuration.subviewSize.height > 0 else {
            return game
        }

        let point = game.pointFor(index: index)
        let offsetX = Int(offset.width / configuration.subviewSize.width)
        let offsetY = Int(offset.height / configuration.subviewSize.height)
        game.setState(atPoint: EasyGameState.Point(x: point.x + offsetX, y: point.y + offsetY), to: 3)
        return game
    }

    public init() {}
}

import SwiftUI
import EasyGameView

class ExampleColorProvider: EasyGameSubviewStateProviderColor {

    static var color0: Color = .red

    static var color1: Color = .green

    static var defaultColor: Color = .gray

    static var draggingColor: Color = .blue

    static var draggedEndColor: Color = .yellow

    func colorForState(state: Int?) -> Color {
        guard let state = state else {
            return .clear
        }
        switch state {
        case 0:
            return ExampleColorProvider.color0
        case 1:
            return ExampleColorProvider.color1
        case 2:
            return ExampleColorProvider.draggingColor
        case 3:
            return ExampleColorProvider.draggedEndColor
        default:
            return ExampleColorProvider.defaultColor
        }
    }

}

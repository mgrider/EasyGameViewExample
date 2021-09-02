import SwiftUI
import EasyGameView

struct ExampleColorProvider: EasyGameSubviewStateProviderColor {
    
    func colorForState(state: Int?) -> Color {
        guard let state = state else {
            return .clear
        }
        switch state {
        case 0:
            return .red
        case 1:
            return .green
        case 2:
            return .blue
        case 3:
            return .yellow
        default:
            return .gray
        }
    }
    
}

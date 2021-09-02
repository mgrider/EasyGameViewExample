import SwiftUI
import EasyGameView

class ExampleState: ObservableObject {

    @Published var selectedExampleTab = 0
    
    @Published var configurationShown = false

    @Published var configurableManager = EasyGameManager(
        game: EasyGameState(gridWidth: 6, gridHeight: 6),
        colorProvider: ExampleColorProvider(),
        config: EasyGameViewConfiguration(
            gridType: .color,
            hasGestureDrag: true,
            hasGestureTap: true
        )
    )

    // Note: The following properties don't work. The array of `GridItem` objects would need
    // to get updated, and that's not happening here.
    @Published var gameColumns = 8.0 {
        didSet {
            configurableManager.game.gridWidth = Int(gameColumns)
        }
    }

    @Published var gameRows = 8.0 {
        didSet {
            configurableManager.game.gridHeight = Int(gameRows)
        }
    }

}

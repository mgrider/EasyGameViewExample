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

    @Published var dragGrowsSubviews = true {
        didSet {
            configurableManager.config.dragScaleMultiplier = dragGrowsSubviews ? 1.25 : 1
        }
    }

    @Published var state0Color: Color = .red {
        didSet {
            ExampleColorProvider.color0 = state0Color
        }
    }

    @Published var state1Color: Color = .green {
        didSet {
            ExampleColorProvider.color1 = state1Color
        }
    }

    @Published var state2Color: Color = .blue {
        didSet {
            ExampleColorProvider.draggingColor = state2Color
        }
    }

    @Published var state3Color: Color = .yellow {
        didSet {
            ExampleColorProvider.draggedEndColor = state3Color
        }
    }

    @Published var stateDefaultColor: Color = .gray {
        didSet {
            ExampleColorProvider.defaultColor = stateDefaultColor
        }
    }


}

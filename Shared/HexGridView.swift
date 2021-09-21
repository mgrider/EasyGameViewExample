import SwiftUI
import EasyGameView

struct HexGridView: View {

    @ObservedObject var exampleState: ExampleState

    var body: some View {

        EasyGameHexView(manager: exampleState.configurableManager)
            .aspectRatio(contentMode: .fit)

    }

}

struct HexGridView_Previews: PreviewProvider {
    static var previews: some View {
        HexGridView(exampleState: ExampleState())
    }
}

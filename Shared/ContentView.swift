import SwiftUI
import EasyGameView

struct ContentView: View {

    @StateObject var exampleState = ExampleState()

    var body: some View {

        TabView(selection: $exampleState.selectedExampleTab)  {
            EasyGameView()
                .tabItem {
                    Text("Default")
                }.tag(0)
            ExampleConfigurableView(exampleState: exampleState)
                .tabItem {
                    Text("Configurable")
                }.tag(1)
            HexGridView(exampleState: exampleState)
                .tabItem {
                    Text("Hex")
                }.tag(2)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

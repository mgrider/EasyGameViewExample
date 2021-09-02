import SwiftUI
import EasyGameView

struct ExampleConfigurableView: View {

    @ObservedObject var exampleState: ExampleState

    var body: some View {

        NavigationView {

            VStack {

                Text("EasyGameView Example")

                EasyGameView(manager: exampleState.configurableManager)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            .navigationTitle("Configurable Example")
            .toolbar(content: {
                Button(
                    action: {
                        self.exampleState.configurationShown = true
                    }) {
                        Text("Edit").bold()
                    }
            })

        }
        .sheet(isPresented: $exampleState.configurationShown) {
            ExampleConfigurationSheetView(exampleState: exampleState, manager: exampleState.configurableManager)
        }

    }
}

struct ExampleConfigurableView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleConfigurableView(exampleState: ExampleState())
    }
}

import SwiftUI
import EasyGameView

struct ExampleConfigurationSheetView: View {

    @ObservedObject var exampleState: ExampleState
    @ObservedObject var manager: EasyGameManager

    var body: some View {

        NavigationView {

            VStack {
                HStack {
                    Text("Grid")
                    Picker("View Type", selection: $manager.config.gridType, content: {
                        Text("Square").tag(EasyGameSubviewType.color)
//                    Text("Hex").tag(GGM_UIView.GridType.hex)
                        Text("Label").tag(EasyGameSubviewType.text)
                    }).pickerStyle(SegmentedPickerStyle())
                }

//                HStack {
//                    Text("Size X: \(exampleState.gameColumns, specifier: "%.0f")")
//                    Slider(value: $exampleState.gameColumns, in: 1.0...20.0, step: 1.0)
//                    Spacer(minLength: 20)
//                    Text("Size Y: \(exampleState.gameRows, specifier: "%.0f")")
//                    Slider(value: $exampleState.gameRows, in: 1.0...20.0, step: 1.0)
//                }

                Toggle(isOn: $manager.config.hasGestureDrag, label: {
                    Text("Drag Changes Grid States")
                })
                Toggle(isOn: $manager.config.hasGestureTap, label: {
                    Text("Tap Changes Grid States")
                })

                Spacer()

            }
            .padding()

            .navigationTitle("Configuration")
            .toolbar(content: {
                Button(
                    action: {
                        self.exampleState.configurationShown = false
                    }) {
                        Text("Done").bold()
                    }
            })

        } // NavigationView

    }
}

struct ExampleConfigurationSheetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExampleConfigurationSheetView(
                exampleState: ExampleState(), manager: EasyGameManager()
            )
        }
    }
}

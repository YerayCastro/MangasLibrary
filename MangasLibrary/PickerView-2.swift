//
//  PickerView-2.swift
//  MangasLibrary
//
//  Created by Yery Castro on 19/3/24.
//

import SwiftUI

import SwiftUI

struct MultiplePicker<Selection: Hashable>: View {
    @Binding var selection: Set<Selection>
    let values: [Item<Selection>]
    let label: Text
    
    var body: some View {
        NavigationLink {
            selectionView
        } label: {
            pickerLabel
        }
    }
    
    private var selectionView: some View {
        List(values, id: \.self) { item in
            Button{
                toggleSelection(value: item.value)
            } label: {
             HStack {
                 Text(item.label).tint(.primary)
                    Spacer()
                    if selection.contains(item.value) {
                        Image(systemName: "checkmark").fontWeight(.semibold)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(label)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var pickerLabel: some View {
        HStack(alignment: .firstTextBaseline){
            label
                .tint(.secondary)
            Spacer()
            Text(selection.isEmpty ? "None" : values.filter{selection.contains($0.value)}.map(\.label).formatted(.list(type: .and))).foregroundStyle(.secondary)
            //Image(systemName: "chevron.forward").imageScale(.small)
        }
    }
    
    private func toggleSelection(value: Selection) {
        guard let _ = selection.remove(value) else {
            selection.insert(value)
            return
        }
    }
    init(selection: Binding<Set<Selection>>, label: Text = Text(""), values: [Item<Selection>]) {
        self._selection = selection
        self.values = values
        self.label = label
    }
    init(selection: Binding<Set<Selection>>, label: Text = Text(""), values: [Selection]) {
        self.init(selection: selection, label: label, values: values.map { Item(value: $0) })
    }
}

struct Item<Value: Hashable>: Hashable {
    let label: String
    let value: Value
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
    init(value: Value, label: String) {
        self.label = label
        self.value = value
    }
    
    init(value: Value) {
        self.init(value: value, label: "\(value)")
    }
}

struct MyView23: View {
    @State private var selection: Set<Int> = []
    var body: some View {
        NavigationStack {
            Form{
                MultiplePicker(selection: $selection, label: Text("Owned Volumes"), values: [1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15])
                Picker("ghjlhklkldfvkfvlfvkflvkfvffv", selection: .constant("gh")) {
                    Text("ghkkklkdlfkflbkldkfbldfbkf fdfbdbsfgnfgnfgn").tag("gh")
                    Text("huj")
                }.pickerStyle(.menu)
            }
            .navigationTitle("Título")
        }
    }
}

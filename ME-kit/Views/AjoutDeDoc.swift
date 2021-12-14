//
//  AjoutDeDoc.swift
//  ME-kit
//
//  Created by Apprenant 67 on 13/12/2021.
//

import SwiftUI

struct AjoutDeDoc: View {
    @State private var document: MessageDocument = MessageDocument(message: "Hello, World!")
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false
    
    var body: some View {
        VStack {
            GroupBox(label: Text("Message:")) {
                TextEditor(text: $document.message)
            }
            GroupBox {
                HStack {
                    Spacer()
                    
                    Button(action: { isImporting = true }, label: {
                        Text("Import")
                    })
                    
                    Spacer()
                    
                    Button(action: { isExporting = true }, label: {
                        Text("Export")
                    })
                    
                    Spacer()
                }
            }
        }
        .padding()
        .fileExporter(
              isPresented: $isExporting,
              document: document,
              contentType: .plainText,
              defaultFilename: "Message"
          ) { result in
              if case .success = result {
                  print ("success")
              } else {
                  print ("Fail")
              }
          }
          .fileImporter(
              isPresented: $isImporting,
              allowedContentTypes: [.plainText],
              allowsMultipleSelection: false
          ) { result in
              do {
                  guard let selectedFile: URL = try result.get().first else { return }
                  guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }

                  document.message = message
              } catch {
                  print ("Fail")
              }
          }
    }
}

struct AjoutDeDoc_Previews: PreviewProvider {
    static var previews: some View {
        AjoutDeDoc()
    }
}


import SwiftUI
import UniformTypeIdentifiers

struct MessageDocument: FileDocument {
    
    static var readableContentTypes: [UTType] { [.plainText] }
    
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
    
}

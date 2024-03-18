//
//  Utils_macOS.swift
//  Diffusion-macOS
//
//  Created by Dolmere on 31/07/2023.
//

import SwiftUI

extension CGImage {
    static func fromData(_ imageData: Data) -> CGImage? {
        if let image = NSBitmapImageRep(data: imageData)?.cgImage {
            return image
        }
        return nil
    }

    func savePNG(path: URL) {
        let image = NSImage(cgImage: self, size: .zero)
        let imageRepresentation = NSBitmapImageRep(data: image.tiffRepresentation!)
        guard let pngData = imageRepresentation?.representation(using: .png, properties: [:]) else {
            print("Error generating PNG data")
            return
        }
        do {
            try pngData.write(to: path)
        } catch {
            print("Error saving: \(error)")
        }
    }
}

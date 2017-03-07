//
//  MagicVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 3/5/17.
//  Copyright © 2017 WePlay. All rights reserved.
/*

import UIKit
import AVFoundation
import CoreMedia

let CMYKHalftone = "CMYK Halftone"
let CMYKHalftoneFilter = CIFilter(name: "CICMYKHalftone", withInputParameters: ["inputWidth" : 20, "inputSharpness": 1])

let ComicEffect = "Comic Effect"
let ComicEffectFilter = CIFilter(name: "CIComicEffect")

let Crystallize = "Crystallize"
let CrystallizeFilter = CIFilter(name: "CICrystallize", withInputParameters: ["inputRadius" : 30])

let Edges = "Edges"
let EdgesEffectFilter = CIFilter(name: "CIEdges", withInputParameters: ["inputIntensity" : 10])

let HexagonalPixellate = "Hex Pixellate"
let HexagonalPixellateFilter = CIFilter(name: "CIHexagonalPixellate", withInputParameters: ["inputScale" : 40])

let Invert = "Invert"
let InvertFilter = CIFilter(name: "CIColorInvert")

let Pointillize = "Pointillize"
let PointillizeFilter = CIFilter(name: "CIPointillize", withInputParameters: ["inputRadius" : 30])

let LineOverlay = "Line Overlay"
let LineOverlayFilter = CIFilter(name: "CILineOverlay")

let Posterize = "Posterize"
let PosterizeFilter = CIFilter(name: "CIColorPosterize", withInputParameters: ["inputLevels" : 5])

let Filters = [
    CMYKHalftone: CMYKHalftoneFilter,
    ComicEffect: ComicEffectFilter,
    Crystallize: CrystallizeFilter,
    Edges: EdgesEffectFilter,
    HexagonalPixellate: HexagonalPixellateFilter,
    Invert: InvertFilter,
    Pointillize: PointillizeFilter,
    LineOverlay: LineOverlayFilter,
    Posterize: PosterizeFilter
]

let FilterNames = [String](Filters.keys).sorted()

class Magic: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cameraView: UIView!
    
    @IBOutlet var filterPicker: UIPickerView!
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    let filtersControl = UISegmentedControl(items: FilterNames)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtersControl.selectedSegmentIndex = 0
        
        filterPicker.delegate = self
        filterPicker.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        var error : NSError?
        
        var input = AVCaptureDeviceInput()
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        }
        catch {
            //  error
        }
        
        if error == nil && (captureSession?.canAddInput(input))! {
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput))! {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
        }
    }
    
    func didPressTakePhoto() {
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
                (sampleBuffer, error) in
            
                if sampleBuffer != nil {
                
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProvider(data: imageData as! CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent) //(jpegDataProviderSource: dataProvider, decode: nil, shouldInterpolate: type, intent: kCGRenderingIntentDefault)
                    
                    
                    
                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    
                    self.imageView.image = image
                    self.imageView.isHidden = false
                    
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            })
        }
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother () {
        if didTakePhoto == true {
            imageView.isHidden = true
            didTakePhoto = false
        } else {
            captureSession?.startRunning()
            didTakePhoto = true
            
            didPressTakePhoto()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Filters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FilterNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        guard let image = self.imageView.image?.cgImage else { return }
        
        guard let filter = Filters[FilterNames[filtersControl.selectedSegmentIndex]] else {
            return
        }
        
        let openGLContext = EAGLContext(api: .openGLES3)
        
        let ciImage = CIImage(cgImage: image)
        
        filter!.setValue(ciImage, forKey: kCIInputImageKey)
        
        let filteredImage = UIImage(ciImage: filter!.value(forKey: kCIOutputImageKey) as! CIImage!)
        
        self.imageView.image = filteredImage
        UIImageWriteToSavedPhotosAlbum(filteredImage, nil, nil, nil)
        
        /*DispatchQueue.main.async {
            self.imageView.image = filteredImage
            UIImageWriteToSavedPhotosAlbum(filteredImage, nil, nil, nil)
        } */
    }
    
    @IBAction func save(_ sender: Any) {
        //UIImageWriteToSavedPhotosAlbum(filteredImage, nil, nil, nil)

    }
    
    
} */


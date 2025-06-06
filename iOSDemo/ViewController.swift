import UIKit
import Lightbox
import SDWebImage

class ViewController: UIViewController {
  
    lazy var showButton: UIButton = { [unowned self] in
        let button = UIButton()
//        button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
        button.addTarget(self, action: #selector(showDragonAIImplementation), for: .touchUpInside)
        button.setTitle("Show me the lightbox", for: UIControl.State())
        button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
        button.frame = UIScreen.main.bounds
        button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        
        return button
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        view.backgroundColor = UIColor.white
        view.addSubview(showButton)
        title = "Lightbox"
        //    LightboxConfig.preload = 2
        LightboxConfig.loadImage = { imageView, url, completion in
            imageView.sd_setImage(with: url) { image, _, _ , _ in
//      imageView.sd_setImage(with: url, placeholderImage: nil, options: [.scaleDownLargeImages]) { image, _, _, _ in
                completion?(image)
            }
        }
        
        LightboxConfig.showLoader = false
    }
    
    var currentLightboxController: LightboxController?

  // MARK: - Action methods
    
    @objc func showDragonAIImplementation() {
//        let thumbURL = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/dragonai-app.appspot.com/o/users%2F4AB41269-8804-462F-A0E7-3C0CFFFDB476%2Fgallery%2Fgenerationimages%2F5B0982A6-FEEC-4D87-AA2B-6D3EC4A4E4B6.jpeg?alt=media&token=cf0eaf79-67be-4002-8ecb-ee38da868524")!
//        let thumbURL = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/dragonai-app.appspot.com/o/users%2F4AB41269-8804-462F-A0E7-3C0CFFFDB476%2Fgallery%2Fthumbnailimages%2F88A4E6FA-6A1D-4DAC-BA65-F265DDC84718.jpeg?alt=media&token=c1acf922-7073-4635-9de9-80c30447a4f3")!
//        let thumbURL = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/dragonai-app.appspot.com/o/users%2F4AB41269-8804-462F-A0E7-3C0CFFFDB476%2Fgallery%2Fimages%2FE1A2983B-81CF-4182-93D8-583327461662.jpeg?alt=media&token=cbb27e53-c5e1-4f14-9720-c7d7324bef3b")!
        let thumbURL = URL(string: "/Users/krushnamthoria/Library/Developer/CoreSimulator/Devices/895A3479-320F-46A2-8AF5-6E6A7533AB92/data/Containers/Data/Application/FA7FD2BB-6FC0-40F5-90B4-73868F37AF4B/Library/Caches/thumbnails/e9f2crdes1rme0cmt1nsm8ek38.jpeg")!
        let fullURL = URL(string: "/Users/krushnamthoria/Library/Developer/CoreSimulator/Devices/895A3479-320F-46A2-8AF5-6E6A7533AB92/data/Containers/Data/Application/FA7FD2BB-6FC0-40F5-90B4-73868F37AF4B/Library/Caches/originals/e9f2crdes1rme0cmt1nsm8ek38.jpeg")!
        
        let thumbnailImage = LightboxImage(imageURL: thumbURL)
        let controller = LightboxController(images: [thumbnailImage])
        controller.dynamicBackground = false
        controller.footerView.isHidden = true
        controller.headerView.isHidden = true
        
        self.currentLightboxController = controller
        
        present(controller, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let fullImage = LightboxImage(imageURL: fullURL)
                controller.updateCurrentImage(to: fullImage)
            }
        }
    }
  
    @objc func showLightbox() {
        let images = [
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/Ku65904QQe4yez448B/giphy.gif")!),
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/lQDLwWUMPaAHvh8pAG/giphy.gif")!),
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(
                image: UIImage(named: "photo1")!,
                text: "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film"
            ),
            
            LightboxImage(imageURL: URL(string: "https://via.placeholder.com/300.png/09f/fff")!),
            
            
            LightboxImage(
                image: UIImage(named: "photo2")!,
                text: "Emoji 😍 (/ɪˈmoʊdʒi/; singular emoji, plural emoji or emojis;[4] from the Japanese 絵文字えもじ, pronounced [emodʑi]) are ideograms and smileys used in electronic messages and web pages. Emoji are used much like emoticons and exist in various genres, including facial expressions, common objects, places and types of weather 🌅☔️💦, and animals 🐶🐱",
                videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            ),
            LightboxImage(
                image: UIImage(named: "photo3")!,
                text: "A lightbox is a translucent surface illuminated from behind, used for situations where a shape laid upon the surface needs to be seen with high contrast."
            ),
            LightboxImage(imageURL: URL(string: "https://c.tenor.com/kccsHXtdDn0AAAAC/alcohol-wine.gif")!)
        ]
        
        let controller = LightboxController(images: images)
        controller.dynamicBackground = true
        
        present(controller, animated: true, completion: nil)
    }
}


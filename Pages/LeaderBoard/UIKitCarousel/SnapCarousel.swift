//import UIKit
//import SwiftUI
//
//class SnapCarouselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    var images: [UIImage] = [] // This will be your images array.
//    private var collectionView: UICollectionView!
//    private let cellScaleFactor: CGFloat = 2 // Множитель для увеличения размера ячейки
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 80, height: 80) // Базовый размер ячеек
//        layout.minimumLineSpacing = 45 // Расстояние между ячейками
//        
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
//        collectionView.showsHorizontalScrollIndicator = false
//        
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
//            fatalError("Unable to dequeue ImageCell")
//        }
//        cell.imageView.image = images[indexPath.row]
//        return cell
//    }
//    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        let roundedIndex = round(index)
//        
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        for cell in collectionView.visibleCells {
//            let cellCenter = collectionView.convert(cell.center, to: nil) // Конвертация центра ячейки в систему координат view
//            let screenCenterX = scrollView.bounds.size.width / 2
//            let distanceFromCenter = abs(cellCenter.x - screenCenterX)
//            let scale = max(1, min(cellScaleFactor, 1 + (1 - distanceFromCenter / screenCenterX)))
//            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
//        }
//    }
//}
//
//class ImageCell: UICollectionViewCell {
//    static let identifier = "ImageCell"
//    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//struct SnapCarouselView: UIViewControllerRepresentable {
//    
//    var images: [UIImage]
//    
//    func makeUIViewController(context: Context) -> SnapCarouselViewController {
//        let carouselViewController = SnapCarouselViewController()
//        carouselViewController.images = images
//        return carouselViewController
//    }
//    
//    func updateUIViewController(_ uiViewController: SnapCarouselViewController, context: Context) {
//        uiViewController.images = images
//    }
//}
//
//
//
//#Preview {
//    let images = [UIImage(named: "Aqua Horizon"), UIImage(named: "Binary Sentinel"), UIImage(named: "Quantum Guardian"), UIImage(named: "Aqua Horizon"), UIImage(named: "Aqua Horizon"), UIImage(named: "Aqua Horizon")].compactMap { $0 }
//    
//    return SnapCarouselView(images: images)
//        .frame(height: 150)
//}

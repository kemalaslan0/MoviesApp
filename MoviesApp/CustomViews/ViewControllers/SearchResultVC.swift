//
//  SearchResultVC.swift
//  MoviesApp
//
//  Created by Kemal Aslan on 18.12.2022.
//

import UIKit

class SearchResultVC: WMDataLoadingVC {

    private var tableView: UITableView!
    
    private var contents: [SearchResult] = []
    private var query: String = ""
    
    init(contents: [SearchResult], query: String) {
        super.init(nibName: nil, bundle: nil)
        self.contents = contents
        self.query = query
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: .zero)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseID)
        tableView.showsVerticalScrollIndicator = false
        
        tableView.pinToEdges(of: view)
    }
    
    private func configureVC() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = query
        navigationItem.backButtonTitle = ""
    }
}

extension SearchResultVC {
    private func getContentDetail(urlString: String) {
        showLoadingView()
        NetworkingManager.shared.downloadContentDetail(urlString: urlString) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let contentDetail):
                
                guard let id = contentDetail.id?.description else { return }
                let urlString = contentDetail.isMovie ? ApiUrls.movieVideo(id: id) : ApiUrls.showVideo(id: id)
                
                self.getVideo(urlString: urlString) { [weak self] videoResult in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(ContentDetailVC(contentDetail: contentDetail, videoResult: videoResult), animated: true)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getVideo(urlString: String, completion: @escaping(VideoResult?) -> ()) {
        NetworkingManager.shared.downloadVideo(urlString: urlString) { [weak self] result in
            guard let _ = self else { completion(nil); return }
            
            completion(result)
        }
    }
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseID) as! SearchCell
        cell.set(content: contents[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = contents[indexPath.row].mediaType == .movie ? ApiUrls.movieDetail(id: contents[indexPath.row].id?.description ?? "") : ApiUrls.showDetail(id: contents[indexPath.row].id?.description ?? "")
        
        getContentDetail(urlString: urlString)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(110)
    }
}

//
//  ContentView.swift
//  Test_Map
//
//  Created by Erik Minasov on 08.07.2021.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
//    var coordinates : [[[[Double]]]] {
//        var cord : [[[[Double]]]] = []
//        var way2 = ""
//        getWay { way in
//            if let way = way {
//                cord = way.features[0].geometry.coordinates
//                way2 = "\(way.features[0].geometry.coordinates)"
//            }
//        }
//        print(way2)
//        return cord
//    }
//
//    func getWay(completion: @escaping (Way?) -> ()) {
//        guard let url = URL(string: "https://waadsu.com/api/russia.geo.json") else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//            let way = try? JSONDecoder().decode(Way.self, from: data)
//            completion(way)
//        }.resume()
//    }
    
    var body: some View {
        MapView()
//            .drawingGroup()
    }
    
    struct Way: Codable {
        let type: String
        let features: [Features]
        struct Features: Codable {
            let type: String
            //    let properties: Properties
            let geometry: Geometry
        }
        struct Properties: Codable {
            let scalerank: Int
            let featurecla: String
            let labelrank: Int
            let sovereignt: String
            let sov_a3: String
            let adm0_dif: Int
            let level: Int
            let type: String
            let admin: String
            let adm0_a3: String
            let geou_dif: Int
            let geounit: String
            let gu_a3: String
            let su_dif: Int
            let subunit: String
            let su_a3: String
            let brk_diff: Int
            let name: String
            let name_long: String
            let brk_a3: String
            let brk_name: String
            let brk_group: String?
            let abbrev: String
            let postal: String
            let formal_en: String
            let formal_fr: String?
            let note_adm0: String?
            let note_brk: String
            let name_sort:String
            let name_alt: String?
            let mapcolor7: Int
            let mapcolor8: Int
            let mapcolor9: Int
            let mapcolor13: Int
            let pop_est: Int
            let gdp_md_est: Int
            let pop_year: Int
            let lastcensus: Int
            let gdp_year: Int
            let economy: String
            let income_grp: String
            let wikipedia: Int
            let fips_10_: String
            let iso_a2: String
            let iso_a3: String
            let iso_n3: String
            let un_a3: String
            let wb_a2: String
            let wb_a3: String
            let woe_id: Int
            let woe_id_eh: Int
            let woe_note:String
            let adm0_a3_is: String
            let adm0_a3_us: String
            let adm0_a3_un: Int
            let adm0_a3_wb: Int
            let continent: String
            let region_un: String
            let subregion: String
            let region_wb: String
            let name_len: Int
            let long_len: Int
            let abbrev_len: Int
            let tiny: Int
            let homepart: Int
            let filename: String
            
        }
        struct Geometry: Codable {
            let type: String
            let coordinates: [[[[Double]]]]
        }
    }
}
// тк пока нет полноценного MapView на sui, то мы создадим его на UIKit, благодаря UIViewRepresentable (этот протокол позволяет вставлять UIKit View в SwiftUI
struct MapView: UIViewRepresentable {
    
    var coordinates : [[[[Double]]]] = [[[[132.44898522200018,42.845404364],[132.44988040500007,42.82811107000001],[132.4674585300002,42.81093984600007],[132.47771243600013,42.803900458],[132.47559655000012,42.80023834800015],[132.46713300900015,42.79682038000014],[132.458262566,42.798285223],[132.45337975400005,42.80097077000009],[132.44727623800017,42.80731842700011],[132.43946373800006,42.81753164300015],[132.4298608730002,42.82648346600017],[132.41749108200023,42.83002350500006],[132.4064233730002,42.82876211100013],[132.40154056100005,42.83197663],[132.4000757170002,42.84170156500015],[132.39966881600017,42.852118231000034],[132.40463300900004,42.8591169290001],[132.41325931100002,42.864447333],[132.41846764400023,42.87986888200011],[132.42750084700006,42.895900783000016],[132.439219597,42.892035223],[132.44727623800017,42.876776434000035],[132.45362389400012,42.860907294000114],[132.44898522200018,42.845404364]]],[[[131.87574303500003,43.05101146000011],[131.8922632170002,43.03583405200011],[131.92090905000006,43.02415599200013],[131.92009524800008,43.019517320000105],[131.9225366550002,43.00893789300015],[131.92400149800008,43.00584544500008],[131.92090905000006,42.99628327000009],[131.91504967500023,42.984279690000065],[131.88331139400006,42.96076080900009],[131.83725019600004,42.961127020000035],[131.79053795700023,42.97455475500003],[131.7570093110002,42.99005768400012],[131.7911889980002,42.99628327000009],[131.77458743600002,43.00531647300009],[131.76937910200004,43.01536692900005],[131.77344811300011,43.02118561400012],[131.78435306100008,43.01740143400009],[131.7911889980002,43.01740143400009],[131.78736412900017,43.03436920800006],[131.78386478000016,43.04010651200004],[131.77751712300008,43.044623114],[131.79883873800023,43.05263906500012],[131.81967207099999,43.049261786000116],[131.84009850400014,43.041693427000084],[131.85938561300011,43.0372582050001],[131.85938561300011,43.044623114],[131.82650800900004,43.06517161700005],[131.85499108200023,43.06134674700003],[131.87574303500003,43.05101146000011]]]]
    
    func makeUIView(context: Context) -> MKMapView { // создаём карту
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        // сначала мы видим Нью-Йорк
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 45.02, longitude: 38.95),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        mapView.setRegion(region, animated: true)
        
//        getWay { way in
//            if let way = way {
//                coordinates = way.features[0].geometry.coordinates
//            }
//        }
//        func getWay(completion: @escaping (Way?) -> ()) {
//            guard let url = URL(string: "https://waadsu.com/api/russia.geo.json") else {
//                completion(nil)
//                return
//            }
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    completion(nil)
//                    return
//                }
//                let way = try? JSONDecoder().decode(Way.self, from: data)
//                completion(way)
//            }.resume()
//        }
        
        var placemarks : [MKPlacemark] = []
        
        for state in coordinates { // страна
            for city in state { // город
                for district in city { // район
                    var latLong : [Double] = []
                    for place in district {
                        latLong.append(place)
                    }
                    let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latLong[1], longitude: latLong[0]))
                    placemarks.append(placemark)
//                    print("LangLong", latLong)
                    latLong = []
                }
            }
        }
        
        // первая точка
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 45.02, longitude: 38.95))
//
//        // вторая точка
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 56, longitude: 38))
//
//        // третья точка
//        let p3 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 59.57, longitude: 30.19))
//        let arr: [MKPlacemark] = [p1, p2]
        // создаём запрос на маршрут
        for placemark in placemarks {
            if placemark != placemarks.last {
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: placemark) // откуда
                print(placemark)
                let placemarkIndex = placemarks.firstIndex(of: placemark)!
                let nextPlacemark = placemarks[placemarkIndex <= placemarks.count - 1 ? placemarkIndex : placemarkIndex + 1]
                request.destination = MKMapItem(placemark: nextPlacemark) // куда
                request.transportType = .any // на чем будем добираться
//                let distanse = placemark.dis
                
                // создаём маршрут for coordinate in coordinates {}
                let directions = MKDirections(request: request)
                directions.calculate { response, error in
                    guard let route = response?.routes.first else {return}
                    // если получается создать маршрут, то обновляем карту
                    mapView.addAnnotations([placemark, nextPlacemark])
//                    mapView.addOverlay(route.polyline)
                    mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveLabels)
                    // делаем видимым наш путь
                    mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
                }
            }
        }
        
//        let request2 = MKDirections.Request()
//        request2.source = MKMapItem(placemark: p2) // откуда
//        request2.destination = MKMapItem(placemark: p3) // куда
//        request2.transportType = .automobile // на чем будем добираться
//
//        let directions2 = MKDirections(request: request2)
//        directions2.calculate { response, error in
//            guard let route = response?.routes.first else {return}
//            // если получается создать маршрут, то обновляем карту
//            mapView.addAnnotations([p2, p3])
//            mapView.addOverlay(route.polyline)
//            // делаем видимым наш путь
//            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
//        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    
    // рисуем маршрут
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .blue
            render.lineWidth = 3
            return render
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    struct Way: Codable {
        let type: String
        let features: [Features]
        struct Features: Codable {
            let type: String
            //    let properties: Properties
            let geometry: Geometry
        }
        struct Properties: Codable {
            let scalerank: Int
            let featurecla: String
            let labelrank: Int
            let sovereignt: String
            let sov_a3: String
            let adm0_dif: Int
            let level: Int
            let type: String
            let admin: String
            let adm0_a3: String
            let geou_dif: Int
            let geounit: String
            let gu_a3: String
            let su_dif: Int
            let subunit: String
            let su_a3: String
            let brk_diff: Int
            let name: String
            let name_long: String
            let brk_a3: String
            let brk_name: String
            let brk_group: String?
            let abbrev: String
            let postal: String
            let formal_en: String
            let formal_fr: String?
            let note_adm0: String?
            let note_brk: String
            let name_sort:String
            let name_alt: String?
            let mapcolor7: Int
            let mapcolor8: Int
            let mapcolor9: Int
            let mapcolor13: Int
            let pop_est: Int
            let gdp_md_est: Int
            let pop_year: Int
            let lastcensus: Int
            let gdp_year: Int
            let economy: String
            let income_grp: String
            let wikipedia: Int
            let fips_10_: String
            let iso_a2: String
            let iso_a3: String
            let iso_n3: String
            let un_a3: String
            let wb_a2: String
            let wb_a3: String
            let woe_id: Int
            let woe_id_eh: Int
            let woe_note:String
            let adm0_a3_is: String
            let adm0_a3_us: String
            let adm0_a3_un: Int
            let adm0_a3_wb: Int
            let continent: String
            let region_un: String
            let subregion: String
            let region_wb: String
            let name_len: Int
            let long_len: Int
            let abbrev_len: Int
            let tiny: Int
            let homepart: Int
            let filename: String
            
        }
        struct Geometry: Codable {
            let type: String
            let coordinates: [[[[Double]]]]
        }
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let russiaGeo = try? newJSONDecoder().decode(RussiaGeo.self, from: jsonData)

import Foundation

// MARK: - RussiaGeo
struct RussiaGeo: Codable {
    let type: String
    let features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let type: String
    let properties: Properties
    let geometry: Geometry
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [[[[Double]]]]
}

// MARK: - Properties
struct Properties: Codable {
    let scalerank: Int
    let featurecla: String
    let labelrank: Int
    let sovereignt, sovA3: String
    let adm0DIF, level: Int
    let type, admin, adm0A3: String
    let geouDIF: Int
    let geounit, guA3: String
    let suDIF: Int
    let subunit, suA3: String
    let brkDiff: Int
    let name, nameLong, brkA3, brkName: String
    let brkGroup: JSONNull?
    let abbrev, postal, formalEn: String
    let formalFr, noteAdm0, noteBrk: JSONNull?
    let nameSort: String
    let nameAlt: JSONNull?
    let mapcolor7, mapcolor8, mapcolor9, mapcolor13: Int
    let popEst, gdpMdEst, popYear, lastcensus: Int
    let gdpYear: Int
    let economy, incomeGrp: String
    let wikipedia: Int
    let fips10_, isoA2, isoA3, isoN3: String
    let unA3, wbA2, wbA3: String
    let woeID, woeIDEh: Int
    let woeNote, adm0A3Is, adm0A3Us: String
    let adm0A3Un, adm0A3Wb: Int
    let continent, regionUn, subregion, regionWb: String
    let nameLen, longLen, abbrevLen, tiny: Int
    let homepart: Int
    let filename: String

    enum CodingKeys: String, CodingKey {
        case scalerank, featurecla, labelrank, sovereignt
        case sovA3 = "sov_a3"
        case adm0DIF = "adm0_dif"
        case level, type, admin
        case adm0A3 = "adm0_a3"
        case geouDIF = "geou_dif"
        case geounit
        case guA3 = "gu_a3"
        case suDIF = "su_dif"
        case subunit
        case suA3 = "su_a3"
        case brkDiff = "brk_diff"
        case name
        case nameLong = "name_long"
        case brkA3 = "brk_a3"
        case brkName = "brk_name"
        case brkGroup = "brk_group"
        case abbrev, postal
        case formalEn = "formal_en"
        case formalFr = "formal_fr"
        case noteAdm0 = "note_adm0"
        case noteBrk = "note_brk"
        case nameSort = "name_sort"
        case nameAlt = "name_alt"
        case mapcolor7, mapcolor8, mapcolor9, mapcolor13
        case popEst = "pop_est"
        case gdpMdEst = "gdp_md_est"
        case popYear = "pop_year"
        case lastcensus
        case gdpYear = "gdp_year"
        case economy
        case incomeGrp = "income_grp"
        case wikipedia
        case fips10_ = "fips_10_"
        case isoA2 = "iso_a2"
        case isoA3 = "iso_a3"
        case isoN3 = "iso_n3"
        case unA3 = "un_a3"
        case wbA2 = "wb_a2"
        case wbA3 = "wb_a3"
        case woeID = "woe_id"
        case woeIDEh = "woe_id_eh"
        case woeNote = "woe_note"
        case adm0A3Is = "adm0_a3_is"
        case adm0A3Us = "adm0_a3_us"
        case adm0A3Un = "adm0_a3_un"
        case adm0A3Wb = "adm0_a3_wb"
        case continent
        case regionUn = "region_un"
        case subregion
        case regionWb = "region_wb"
        case nameLen = "name_len"
        case longLen = "long_len"
        case abbrevLen = "abbrev_len"
        case tiny, homepart, filename
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

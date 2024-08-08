import Foundation

@objc public class RustWrapper: NSObject {
    @objc public func searchAddressByName(_ text: String, lat: String, lon: String, appid: String, token: String) -> String? {
        guard let cString = search_address_by_name(text, lat, lon, appid, token) else { return nil }
        defer { free_string(cString) }
        return String(cString: cString)
    }

    @objc public func searchAddressByCoord(_ lat: String, lon: String, appid: String, token: String) -> String? {
        guard let cString = search_address_by_coord(lat, lon, appid, token) else { return nil }
        defer { free_string(cString) }
        return String(cString: cString)
    }

    @objc public func mapRoute(_ start: String, startLat: String, startLon: String, dest: String, destLat: String, destLon: String, appid: String, token: String) -> String? {
        guard let cString = map_route(start, startLat, startLon, dest, destLat, destLon, appid, token) else { return nil }
        defer { free_string(cString) }
        return String(cString: cString)
    }
}

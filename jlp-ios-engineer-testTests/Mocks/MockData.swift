import Foundation

class MockData {
    func loadMockJSONData() -> Data? {
        let jsonString = """
        {
          "showInStockOnly": true,
          "products": [
            {
              "productId": "1955287",
              "type": "product",
              "title": "Bosch Serie 2 SMV40C30GB Fully Integrated Dishwasher",
              "htmlTitle": "",
              "code": "88701207",
              "averageRating": 4.2,
              "reviews": 352,
              "price": {
                "was": "",
                "then1": "",
                "then2": "",
                "now": "379.00",
                "uom": "",
                "currency": "GBP"
              },
              "image": "//johnlewis.scene7.com/is/image/JohnLewis/234378764?",
              "alternativeImageUrls": [
                "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt1",
                "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt10",
                "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt2",
                "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt3",
                "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt9"
              ],
              "displaySpecialOffer": "",
              "promoMessages": {
                "reducedToClear": false,
                "priceMatched": "",
                "offer": "",
                "customPromotionalMessage": "",
                "bundleHeadline": "",
                "customSpecialOffer": {}
              },
              "nonPromoMessage": "",
              "defaultSkuId": "234378764",
              "brand": "Bosch",
              "ageRestriction": 0,
              "isInStoreOnly": false,
              "isMadeToMeasure": false,
              "isBundle": false,
              "isProductSet": false,
              "dynamicAttributes": {
                "noiselevelrating": "C",
                "automaticloadadjustment": "YES",
                "dryingsystem": "Residual Heat",
                "weightedenergyconsumptionper100cyclesforecocycle": "102kWh",
                "weightedwaterconsumptionfortheecocycle": "11.7L",
                "dishwashersize": "Full",
                "rinseaidindicator": "YES",
                "cutlerybasket": "Basket",
                "integratedorfreestanding": "Integrated",
                "energyratingoverall": "F",
                "timeremainingindicator": "NO",
                "noiselevel": "50dB",
                "childlock": "NO",
                "timerdelay": "YES",
                "delicatewash": "NO",
                "quickwash": "YES",
                "modelnamenumber": "SMV40C30GB Fully Integrated Dishwasher",
                "smarttechnology": "Via Manufacturer's App",
                "international": "NO",
                "brand": "Bosch",
                "cycledurationatratedcapacityfortheecocycle": "210 minutes",
                "manufacturerpartnumbermpn": "SMV40C30GB",
                "truecolour": "Black/Stainless Steel",
                "saltlevelindicator": "YES",
                "homeappliancefeatures": "Smart Technology",
                "homearea": "Laundry & Cleaning",
                "noofprograms": "4",
                "digitaldisplay": "NO",
                "floodprotection": "YES",
                "colour": "Silver",
                "adjustableracking": "YES",
                "homeappliancetype": "Dishwashers",
                "crediteligibilitystatus": "Core",
                "programsequenceindicator": "NO",
                "quietmark": "Not Accredited",
                "slimdepth": "NO",
                "dryingperformance": "A",
                "dimensions": "H81.5 x W59.8 x D55cm",
                "placesettings": "12"
              },
              "directorate": "Technology Director",
              "multiSku": false
            }
          ]
        }
        """
        return jsonString.data(using: .utf8)
    }
}

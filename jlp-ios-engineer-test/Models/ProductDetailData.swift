
import Foundation

// MARK: - ProductDetailData
struct ProductDetailData: Codable {
    let detailsData: [DetailsData]
}

// MARK: - DetailsDatum
struct DetailsData: Codable {
    let productID: String
    let details: Details
    let deliveries: [Delivery]
    let deliverySummary: [DeliverySummary]
    let emailMeWhenAvailable: Bool
    let skus: [Skus]
    let title, defaultSku: String
    let storeOnly: Bool
    let type: DetailsDatumType
    let ageRestriction: Int
    let seoURL: String
    let isFBL: Bool
    let averageRating: Double
    let numberOfReviews: Int
    let price: PriceData
    let code: String
    let specialOffers: SpecialOffers
    let displaySpecialOffer: String
    let setDetails: SetDetails
    let templateType: TemplateType
    let swatchCategoryType: String
    let deliveryFulfilledBy: DeliveryFulfilledBy
    let additionalServices: AdditionalServices
    let media: DetailsDatumMedia
    let promotionalFeatures: [PromotionalFeature]
    let setInformation: String
    let defaultCategory: TCategory
    let parentCategories: [TCategory]
    let releaseDateTimestamp: Int
    let isInTopNkuCategory: Bool
    let brand: Brand
    let madeToMeasureDetails: MadeToMeasureDetails
    let isAsafShape: Bool
    let dynamicAttributes: DetailsDatumDynamicAttributes
    let excludeFromLiveChat: Bool
    let webPIMProductType, nonPromoMessage: String
    let preorderable: Bool

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case details,
             deliveries,
             deliverySummary,
             emailMeWhenAvailable,
             skus,
             title,
             defaultSku,
             storeOnly,
             type,
             ageRestriction,
             seoURL,
             isFBL,
             averageRating,
             numberOfReviews,
             price,
             code,
             specialOffers,
             displaySpecialOffer,
             setDetails,
             templateType,
             swatchCategoryType,
             deliveryFulfilledBy,
             additionalServices,
             media,
             promotionalFeatures,
             setInformation,
             defaultCategory,
             parentCategories,
             releaseDateTimestamp,
             isInTopNkuCategory,
             brand,
             madeToMeasureDetails,
             isAsafShape,
             dynamicAttributes,
             excludeFromLiveChat
        case webPIMProductType = "webPimProductType"
        case nonPromoMessage, preorderable
    }
}

// MARK: - AdditionalServices
struct AdditionalServices: Codable {
    let includedServices: [IncludedService]
    let optionalServices: [OptionalService]
}

enum IncludedService: String, Codable {
    case the2YearGuaranteeIncluded = "2 year guarantee included"
}

// MARK: - OptionalService
struct OptionalService: Codable {
    let id, associatedProductID, title, description: String
    let price: String
    let currency: CurrencyData
    let orderOnSite: Int
    let type: OptionalServiceType
    let url: URLEnum
    let customProperties: CustomProperties

    enum CodingKeys: String, CodingKey {
        case id
        case associatedProductID = "associatedProductId"
        case title, description, price, currency, orderOnSite, type, url, customProperties
    }
}

enum CurrencyData: String, Codable {
    case gbp = "GBP"
}

// MARK: - CustomProperties
struct CustomProperties: Codable {
    let warrantyCustomGeneric, warrantyCustomTooltip, warrantyCustomDescription, warrantyCustomConfirm: String?
}

enum OptionalServiceType: String, Codable {
    case addedWarranty = "ADDED_WARRANTY"
    case dbs = "DBS"
}

enum URLEnum: String, Codable {
    case empty = ""
    case protectplus = "/protectplus"
}

// MARK: - Brand
struct Brand: Codable {
    let name, logo: String
}

// MARK: - Crumb
struct CrumbData: Codable {
    let type: CrumbType
    let displayName: Homeappliancetype
    let item, clickable: String
}

enum Homeappliancetype: String, Codable {
    case dishwashers = "Dishwashers"
    case electricals = "Electricals"
}

enum CrumbType: String, Codable {
    case catalogue = "CATALOGUE"
}

// MARK: - TCategory
struct TCategory: Codable {
    let id: String
    let name: Name
}

enum Name: String, Codable {
    case dishwasherOffers = "Dishwasher Offers"
    case dishwashers = "Dishwashers"
}

// MARK: - Delivery
struct Delivery: Codable {
    let deliveryType: DeliveryType
    let options: [Option]
}

enum DeliveryType: String, Codable {
    case uk = "UK"
}

// MARK: - Option
struct Option: Codable {
    let id, price: String
    let currency: Currency
    let shortDescription, standardDescription, date, dateMessage: String
    let trialMessage: String
    let isApprovedSupplier: Bool
    let leadTime, cutOffTime: Int
    let newShortDescription: New
    let newStandardDescription: String
    let newPriority: Int
}

enum New: String, Codable {
    case nextDayDelivery = "Next Day Delivery"
    case standardDelivery = "Standard Delivery"
}

enum DeliveryFulfilledBy: String, Codable {
    case greenVanFleet = "greenVanFleet"
}

// MARK: - DeliverySummary
struct DeliverySummary: Codable {
    let deliveryType: DeliveryType
    let title: Title
    let price: String
    let currency: Currency
    let summary, trialMessage: String
    let newTitle: New
    let newSummary: String
    let newPriority: Int
    let newOptionID: String

    enum CodingKeys: String, CodingKey {
        case deliveryType, title, price, currency, summary, trialMessage, newTitle, newSummary, newPriority
        case newOptionID = "newOptionId"
    }
}

enum Title: String, Codable {
    case ukDelivery = "UK delivery"
}

// MARK: - Details
struct Details: Codable {
    let returns, returnsHeadline, termsAndConditions, productInformation: String
    let features: [Feature]
    let careGuide: [JSONAny]
    let featuredArticles: [BuyingGuide]
    let editorsNotes: String
    let buyingGuides: [BuyingGuide]
    let sizeGuides: [JSONAny]
    let weLikeItBecause: String
}

// MARK: - BuyingGuide
struct BuyingGuide: Codable {
    let title: LinkText
    let image: Image
    let linkURL: String
    let linkText: LinkText
    let longDescription: String
    let pdfURL: String?

    enum CodingKeys: String, CodingKey {
        case title, image
        case linkURL = "linkUrl"
        case linkText, longDescription
        case pdfURL = "pdfUrl"
    }
}

enum Image: String, Codable {
    case johnlewisScene7COMIsImageJohnLewisElectricalMedIcon = "//johnlewis.scene7.com/is/image/JohnLewis/electrical_med_icon?"
}

enum LinkText: String, Codable {
    case builtInAppliancesBuyingGuide = "Built-in Appliances Buying Guide"
    case dishwashersBuyingGuide = "Dishwashers Buying Guide"
}

// MARK: - Feature
struct Feature: Codable {
    let groupName: String
    let attributes: [Attribute]
}

// MARK: - Attribute
struct Attribute: Codable {
    let value: String
    let values: [String]
    let multivalued: Bool
    let id, name, toolTip: String
    let uom: Uom
}

enum Uom: String, Codable {
    case empty = ""
    case m = "m"
}

// MARK: - DetailsDatumDynamicAttributes
struct DetailsDatumDynamicAttributes: Codable {
    let noiselevelrating: String?
    let timeremainingindicator: Autodose
    let weightedenergyconsumptionper100Cyclesforecocycle: String
    let integratedorfreestanding: Integratedorfreestanding
    let smarttechnology: Smarttechnology
    let cutlerybasket: Cutlerybasket
    let dishwashersize: Dishwashersize
    let saltlevelindicator, floodprotection: Autodose
    let dryingsystem: String?
    let automaticloadadjustment: Autodose
    let noiselevel: String
    let digitaldisplay: Autodose
    let delicatewash: Autodose?
    let quickwash: Autodose
    let homearea: Homearea
    let energyratingoverall: Energyratingoverall
    let onlineexclusive: String?
    let childlock: Autodose
    let timerdelay, dryingperformance: String?
    let homeappliancetype: Homeappliancetype
    let cycledurationatratedcapacityfortheecocycle, programsequenceindicator: String
    let adjustableracking: String?
    let homeappliancefeatures: [String]?
    let quietmark: Quietmark
    let noofprograms: String
    let guarantee: String?
    let placesettings: String
    let rinseaidindicator, slimdepth: Autodose
    let weightedwaterconsumptionfortheecocycle: String
    let energyconsumptionpercycle, international, amperage, weight: String?
    let invertermotor: Autodose?
    let installationrequired, quickwashcycletime, countryoforigin, widthbuiltinovens: String?
    let annualrunningcost: String?
    let autodose: Autodose?
    let estimatedannualwaterconsumption, watersupplyfilltype, fittingsincluded, waterconsumptionstandardcycle: String?
    let estimatedannualenergyconsumption: String?
    let halfloadoption: Autodose?
    let combinedaperturedimensions, adjustable: String?
    let drainagefacilityavailable: Autodose?
    let careinstructions: String?

    enum CodingKeys: String, CodingKey {
        case noiselevelrating, timeremainingindicator
        case weightedenergyconsumptionper100Cyclesforecocycle = "weightedenergyconsumptionper100cyclesforecocycle"
        case integratedorfreestanding, smarttechnology, cutlerybasket, dishwashersize, saltlevelindicator, floodprotection, dryingsystem, automaticloadadjustment, noiselevel, digitaldisplay, delicatewash, quickwash, homearea, energyratingoverall, onlineexclusive, childlock, timerdelay, dryingperformance, homeappliancetype, cycledurationatratedcapacityfortheecocycle, programsequenceindicator, adjustableracking, homeappliancefeatures, quietmark, noofprograms, guarantee, placesettings, rinseaidindicator, slimdepth, weightedwaterconsumptionfortheecocycle, energyconsumptionpercycle, international, amperage, weight, invertermotor, installationrequired, quickwashcycletime, countryoforigin, widthbuiltinovens, annualrunningcost, autodose, estimatedannualwaterconsumption, watersupplyfilltype, fittingsincluded, waterconsumptionstandardcycle, estimatedannualenergyconsumption, halfloadoption, combinedaperturedimensions, adjustable, drainagefacilityavailable, careinstructions
    }
}

enum Autodose: String, Codable {
    case no = "NO"
    case yes = "YES"
}

enum Cutlerybasket: String, Codable {
    case basket = "Basket"
    case basketTray = "Basket & Tray"
    case tray = "Tray"
}

enum Dishwashersize: String, Codable {
    case full = "Full"
    case slimline = "Slimline"
}

enum Energyratingoverall: String, Codable {
    case d = "D"
    case e = "E"
    case f = "F"
}

enum Homearea: String, Codable {
    case cook = "Cook"
    case laundryCleaning = "Laundry & Cleaning"
}

enum Integratedorfreestanding: String, Codable {
    case freestanding = "Freestanding"
    case integrated = "Integrated"
}

enum Quietmark: String, Codable {
    case notAccredited = "Not Accredited"
}

enum Smarttechnology: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Smarttechnology.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Smarttechnology"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - MadeToMeasureDetails
struct MadeToMeasureDetails: Codable {
    let type, styles: String
}

// MARK: - DetailsDatumMedia
struct DetailsDatumMedia: Codable {
    let images: Images
    let the360Images: The360Images
    let videos: Videos

    enum CodingKeys: String, CodingKey {
        case images
        case the360Images = "360images"
        case videos
    }
}

// MARK: - Images
struct Images: Codable {
    let altText: String
    let urls: [String]
}

// MARK: - The360Images
struct The360Images: Codable {
    let swfURL: SWFURL
    let urls: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case swfURL = "swfUrl"
        case urls
    }
}

enum SWFURL: String, Codable {
    case johnlewisScene7COMIsContentJohnLewis360DegreeView = "//johnlewis.scene7.com/is/content/JohnLewis/360-degree-view"
}

// MARK: - Videos
struct Videos: Codable {
    let videosList: [VideosList]?
    let videoHost, videoImagePath, prodVidThmb, videoHeight: String?
    let videoWidth, imgAltText: String?

    enum CodingKeys: String, CodingKey {
        case videosList, videoHost, videoImagePath
        case prodVidThmb = "prod_vid_thmb"
        case videoHeight, videoWidth, imgAltText
    }
}

// MARK: - VideosList
struct VideosList: Codable {
    let videoType, type, name, videoImageURL: String
    let url: String
}

// MARK: - Price
struct PriceData: Codable {
    let was, then1, then2, now: String
    let uom: String
    let currency: Currency
}

// MARK: - PromotionalFeature
struct PromotionalFeature: Codable {
    let title, iconURL: String
    let linkURL: String
    let description, longDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case iconURL = "iconUrl"
        case linkURL = "linkUrl"
        case description, longDescription
    }
}

// MARK: - SEOInformation
struct SEOInformationData: Codable {
    let title, description: String
}

// MARK: - SetDetails
struct SetDetails: Codable {
}

// MARK: - Skus
struct Skus: Codable {
    let id, skuTitle, shortSkuTitle, color: String
    let size, sizeHeadline, swatchURL: String
    let availability: Availability
    let price: Price
    let code, leadTime, d2CDeliveryLeadTime: String
    let media: SkusMedia
    let brandName: String
    let unitPriceInfo: SetDetails
    let priceBand: String
    let dynamicAttributes: SkusDynamicAttributes
    let ticketType: TicketType
    let mainframeProductID: String

    enum CodingKeys: String, CodingKey {
        case id, skuTitle, shortSkuTitle, color, size, sizeHeadline
        case swatchURL = "swatchUrl"
        case availability, price, code, leadTime
        case d2CDeliveryLeadTime = "d2cDeliveryLeadTime"
        case media, brandName, unitPriceInfo, priceBand, dynamicAttributes, ticketType
        case mainframeProductID = "mainframeProductId"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let stockLevel: Int
    let availabilityStatus: AvailabilityStatus
    let message: Message
}

enum AvailabilityStatus: String, Codable {
    case instock = "INSTOCK"
    case outofstock = "OUTOFSTOCK"
}

enum Message: String, Codable {
    case currentlyInStockOnline = "Currently in stock online"
    case only2InStockOnline = "Only 2 in stock online"
    case outOfStock = "Out of stock"
}

// MARK: - SkusDynamicAttributes
struct SkusDynamicAttributes: Codable {
    let manufacturerpartnumbermpn: String?
    let crediteligibilitystatus: Crediteligibilitystatus
    let modelnamenumber: String
    let range, creditofferingids: String?
}

enum Crediteligibilitystatus: String, Codable {
    case core = "Core"
}

// MARK: - SkusMedia
struct SkusMedia: Codable {
    let images: Images
    let the360Images: The360Images

    enum CodingKeys: String, CodingKey {
        case images
        case the360Images = "360images"
    }
}

enum TicketType: String, Codable {
    case t = "T"
}

// MARK: - SpecialOffers
struct SpecialOffers: Codable {
    let priceMatched, offer, customPromotionalMessage, bundleHeadline: String
    let customSpecialOffer: SetDetails
}

enum TemplateType: String, Codable {
    case mediaEpicProdtemplate = "media-epic-prodtemplate"
}

enum DetailsDatumType: String, Codable {
    case standard = "standard"
}

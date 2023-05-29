//
//  Stadiums.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 23.03.2023.
//

import UIKit

struct Stadiums {
    
    static var soccerStadiums = [
        StadiumInfo(name: "СитиФутбол",
                    address: "Улица Короленко, 1А, Москва, 107014",
                    openHours: "8:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.799305, longtitude: 37.687919),
                    phoneNumber: "8 (499) 460-06-34",
                    webSite: "https://cityfootball.ru",
                    photo: UIImage(named: "Soccer1")),
        
        StadiumInfo(name: "Футбольный манеж 'Феникс' ",
                    address: "Улица Щипок, 28, Москва, 115054",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.723521, longtitude: 37.635530),
                    phoneNumber: "8 (910) 463-92-60",
                    webSite: "http://fenixarena.ru",
                    photo: UIImage(named: "Soccer22")),
        
        StadiumInfo(name: "Пугачевская 8",
                    address: "Улица, 2-я Пугачевская, 8, Москва, 107061",
                    openHours: "6:30 - 22:00",
                    coordinates: Coordinates(latitude: 55.793374, longtitude: 37.725182),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer3")),
        
        StadiumInfo(name: "Адмирала Лазарева 17",
                    address: "Улица Адмирала Лазарева, 17, Москва, 117042",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.544020, longtitude: 37.537389),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer4")),
        
        StadiumInfo(name: "Удальцова",
                    address: "Улица Удальцова, Москва, 119454",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.679230, longtitude: 37.501618),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer5")),
        
        StadiumInfo(name: "Скобелевская",
                    address: "Скобелевская улица, 30, Москва, 117042",
                    openHours: "Open 24 hours",
                    coordinates: Coordinates(latitude: 55.544209, longtitude: 37.553055),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer6")),
        
        StadiumInfo(name: "Совхозная",
                    address: "Совхозная улица, Москва, 109382",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.671351, longtitude: 37.752508),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer7")),
        
        StadiumInfo(name: "КТС Новослободский",
                    address: "Новослободская улица 58/12 с.9, Москва, 127055",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.791967, longtitude: 37.597055),
                    phoneNumber: "8 (968) 078-38-63",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer8")),
        
        StadiumInfo(name: "Спортивная арена 'Футбол Тайм' ",
                    address: "Ходынский бульвар, 4, Москва, 125252",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.790231, longtitude: 37.531289),
                    phoneNumber: "8 (495) 150-10-72",
                    webSite: "Не указан",
                    photo: UIImage(named: "Soccer9")),
        
        StadiumInfo(name: "Стадион 'Олимп Арена' ",
                    address: "Минская 1г, к1, с3, Москва, 119285",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.713740, longtitude: 37.502804),
                    phoneNumber: "8 (495) 369-12-40",
                    webSite: "https://olimparena.pro",
                    photo: UIImage(named: "Soccer10"))
        ]
    
    static var hockeyStadiums = [
        StadiumInfo(name: "Ледовая Арена",
                    address: "Улица профсоюзная, 93, Москва, 117279",
                    openHours: "9:00 - 21:00",
                    coordinates: Coordinates(latitude: 55.638607, longtitude: 37.524722),
                    phoneNumber: "8 (495) 225-16-18",
                    webSite: "https://ledoarena.ru",
                    photo: UIImage(named: "Hockey1")),
        
        StadiumInfo(name: "Центр хоккейной подготовки 'СкиллСтик'",
                    address: "Ленинградское авеню, 37В, Москва, 125167",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.793773, longtitude: 37.546075),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Hockey2")),
        
        StadiumInfo(name: "Спартак - столичный профессиональный клуб",
                    address: "Автозаводская улица, 23А, с2, Москва, 101000",
                    openHours: "7:30 - 22:00",
                    coordinates: Coordinates(latitude: 55.702850, longtitude: 37.648474),
                    phoneNumber: "8 (499) 391-00-07",
                    webSite: "Не указан",
                    photo: UIImage(named: "Hockey3")),
        
        StadiumInfo(name: "Град - хоккейный клуб",
                    address: "Шоссе энтузиастов, 12, строение 2, Moscow, 111024",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.747368, longtitude: 37.707107),
                    phoneNumber: "8 (495) 663-83-06",
                    webSite: "https://hc-grad.ru",
                    photo: UIImage(named: "Hockey4")),
    
        StadiumInfo(name: "Ночная хоккейная лига",
                    address: "Комсомольский проспект, 42 стр.1, Москва, 119048",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.721300, longtitude: 37.573142),
                    phoneNumber: "8 (495) 748-62-10",
                    webSite: "https://nhliga.org",
                    photo: UIImage(named: "Hockey5")),
    
        StadiumInfo(name: "Дворец спорта - Крылья Советов",
                    address: "Улица Толбухина, 10/4, c.1, Москва, 121596",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.719673, longtitude: 37.405229),
                    phoneNumber: "8 (499) 658-00-58",
                    webSite: "https://hc-ks.ru",
                    photo: UIImage(named: "Hockey6")),
    
        StadiumInfo(name: "Хоккейный центр - 'Щелчок'",
                    address: "Алтуфьевское шоссе, 27А с. 1, Москва, 127106",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.857185, longtitude: 37.582520),
                    phoneNumber: "8 (916) 403-27-13",
                    webSite: "shelchok-msk.ru",
                    photo: UIImage(named: "Hockey7")),
    
        StadiumInfo(name: "Хоккей Блек",
                    address: "Автозаводская улица, 23а, Москва, 115280",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.701618, longtitude: 37.644773),
                    phoneNumber: "8 (985) 189-43-13",
                    webSite: "https://www.hockeyblack.com",
                    photo: UIImage(named: "Hockey8")),
        
        StadiumInfo(name: "Ледовая арена - 'Снежный Барс'",
                    address: "Большая Очаковская улица, д.2, с.23, Москва, 119361",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.691993, longtitude: 37.465739),
                    phoneNumber: "8 (495) 208-50-10",
                    webSite: "https://arenabars.ru",
                    photo: UIImage(named: "Hockey9")),
        
        StadiumInfo(name: "Айсмэн Хоккей",
                    address: "первый Сетунский проезд, д.10, с.2, Москва, 119136",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.733214, longtitude: 37.532143),
                    phoneNumber: "8 (909) 166-00-66",
                    webSite: "Не указан",
                    photo: UIImage(named: "Hockey10"))
        ]

    static var tennisStadiums = [
        StadiumInfo(name: "Крытые теннисные корты",
                    address: "Улица Твардовского, 26В, Москва, 123458",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.799092, longtitude: 37.408948),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Tennis1")),
        
        StadiumInfo(name: "Теннис Парк",
                    address: "Рязанский проспект, 4, Москва, 109202",
                    openHours: "9:00 - 23:30",
                    coordinates: Coordinates(latitude: 55.728368, longtitude: 37.745295),
                    phoneNumber: "8 (495) 287-39-00",
                    webSite: "https://tennis-park.ru",
                    photo: UIImage(named: "Tennis2")),
        
        StadiumInfo(name: "Спартак - теннисный корт",
                    address: "Майский проспект, 7, д.3, Москва, 107014",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.803899, longtitude: 37.681973),
                    phoneNumber: "8 (925) 278-79-03",
                    webSite: "https://tenniscentre-spartak.ru/#academy",
                    photo: UIImage(named: "Tennis3")),
        
        StadiumInfo(name: "Старая Басманная",
                    address: "Старая Басманная улица, 15, с. 19, Москва, 105064",
                    openHours: "9:00 - 20:00",
                    coordinates: Coordinates(latitude: 55.768800, longtitude: 37.659362),
                    phoneNumber: "8 (915) 405-33-22",
                    webSite: "http://sadbaumana.ru/life-in-the-garden/tennis-court",
                    photo: UIImage(named: "Tennis4")),
        
        StadiumInfo(name: "Планета Тенниса",
                    address: "Дубининская улица, 69, Москва, 115054",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.714926, longtitude: 37.634604),
                    phoneNumber: "8 (909) 954-90-90",
                    webSite: "https://the-tennis.ru",
                    photo: UIImage(named: "Tennis5")),
        
        StadiumInfo(name: "Академия Тенниса Шамиля Тарпичева, Стадион 'Юность'",
                    address: "Улица Зорге, 30а, Москва, 125252",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.794421, longtitude: 37.505328),
                    phoneNumber: "8 (495) 530-30-20",
                    webSite: " https://www.юность-спорт.рф",
                    photo: UIImage(named: "Tennis6")),
        
        StadiumInfo(name: "Теннисный центр Динамо",
                    address: "Петровка улица, 26с9, Москва, 127051",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.766157, longtitude: 37.617797),
                    phoneNumber: "8 (495) 625-58-38",
                    webSite: "https://dynamo-center.ru",
                    photo: UIImage(named: "Tennis7")),
        
        StadiumInfo(name: "Теннисный клуб - 'ТеннисВИП'",
                    address: "Центральный район, Лужники, с. 11 24, Москва, 119270",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.717523, longtitude: 37.559568),
                    phoneNumber: "8 (963) 639-71-37",
                    webSite: "https://www.tennisvip.ru",
                    photo: UIImage(named: "Tennis8")),
        
        StadiumInfo(name: "Премьер-Теннис",
                    address: "Петрово-Разумовский проспект, 29, Москва, 127287",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.804132, longtitude: 37.561553),
                    phoneNumber: "8 (495) 614-51-60",
                    webSite: "https://premier-tennis.ru",
                    photo: UIImage(named: "Tennis9")),
        
        StadiumInfo(name: "Национальный теннисный центр им. А. Самаранча",
                    address: "Ленинградское шоссе, 45-47, Москва, 125212",
                    openHours: "9:00 - 22:30",
                    coordinates: Coordinates(latitude: 55.845334, longtitude: 37.475162),
                    phoneNumber: "8 (499) 283-91-19",
                    webSite: "https://ntc-moscow.ru//",
                    photo: UIImage(named: "Tennis10"))
        ]
        
    static var basketballStadiums = [
        StadiumInfo(name: "Территория мяча",
                    address: "Шарикоподшипниковая улица, 13 с.24, Москва, 115088",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.718796, longtitude: 37.687686),
                    phoneNumber: "8 (495) 055-13-41",
                    webSite: "https://terball.ru/?utm_source=google-maps",
                    photo: UIImage(named: "Basketball1")),
        
        StadiumInfo(name: "Баскетбольный центр - 'Плейграунд'",
                    address: "Улица Складочная, д. 1, с.1, Москва, 127018",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.800453, longtitude: 37.594584),
                    phoneNumber: "8 (499) 490-09-23",
                    webSite: "https://playground.moscow",
                    photo: UIImage(named: "Basketball2")),
        
        StadiumInfo(name: "Рижка",
                    address: "Улица Суховский вал, 56, Москва, 129272",
                    openHours: "9:00 - 17:00",
                    coordinates: Coordinates(latitude: 55.791243, longtitude: 37.620752),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball3")),
        
        StadiumInfo(name: "Андропова",
                    address: "Андропова авеню, 1а, Москва, 115432",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.676590, longtitude: 37.663045),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball4")),
        
        StadiumInfo(name: "Горчакова",
                    address: "Улица Горчакова, 9, к.1, Москва, 117042",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.544754, longtitude: 37.532780),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball5")),
        
        StadiumInfo(name: "Почта",
                    address: "Почта, Москва, 117393",
                    openHours: "9:00 - 21:00",
                    coordinates: Coordinates(latitude: 55.668503, longtitude: 37.544108),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball6")),
        
        StadiumInfo(name: "Реутов",
                    address: "Реутов, Московская область, 143964",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.760515, longtitude: 37.855150),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball7")),
        
        StadiumInfo(name: "Маргелова",
                    address: "Улица Маргелова, 40А, строение 9, Москва, 123007",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.776537, longtitude: 37.540937),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball8")),
        
        StadiumInfo(name: "Касейный",
                    address: "Малый Касейный переулок, 5А, с.16",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.762728, longtitude: 37.655203),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball9")),
        
        StadiumInfo(name: "Крымский Вал",
                    address: "Улица Крымский Вал, 9Г",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.729285, longtitude: 37.598573),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Basketball10"))
        ]
    
    static var volleyballStadiums = [
        StadiumInfo(name: "Воллейбол Холл",
                    address: "Пятая Кожуховская улица, 26, Москва, 115193",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.704418, longtitude: 37.678811),
                    phoneNumber: "8 (926) 533-34-08",
                    webSite: "https://findsport.ru/playground/514",
                    photo: UIImage(named: "Volleyball1")),
        
        StadiumInfo(name: "Танковый проезд",
                    address: "Танковый проезд, 1, Москва, 111033",
                    openHours: "8:00 - 21:00",
                    coordinates: Coordinates(latitude: 55.757992, longtitude: 37.687291),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Volleyball2")),
        
        StadiumInfo(name: "СанВоллей",
                    address: "Измайловское шоссе, 73, Москва, 129366",
                    openHours: "9:00 - 0:00",
                    coordinates: Coordinates(latitude: 55.790170, longtitude: 37.754026),
                    phoneNumber: "8 (495) 664-52-51",
                    webSite: "https://sun-volley.ru",
                    photo: UIImage(named: "Volleyball3")),
        
        StadiumInfo(name: "Всероссийская федерация спорта",
                    address: "Лужники, 8, Москва, 119270",
                    openHours: "Open 24 hours",
                    coordinates: Coordinates(latitude: 55.714110, longtitude: 37.567222),
                    phoneNumber: "8 (495) 637-00-73",
                    webSite: "https://www.volley.ru",
                    photo: UIImage(named: "Volleyball4")),
        
        StadiumInfo(name: "Матч Поинт",
                    address: "Рязанский проспект, 4, Москва, 109202",
                    openHours: "9:00 - 23:00",
                    coordinates: Coordinates(latitude: 55.728368, longtitude: 37.745295),
                    phoneNumber: "8 (925) 216-99-92",
                    webSite: "https://matchpointmos.ru",
                    photo: UIImage(named: "Volleyball5")),
        
        StadiumInfo(name: "Расволлей",
                    address: "Вторая Луковская улица, Москва, 123458",
                    openHours: "9:00 - 22:00",
                    coordinates: Coordinates(latitude: 55.784693, longtitude: 37.395680),
                    phoneNumber: "8 (495) 268-12-68",
                    webSite: "https://rusvolley.ru",
                    photo: UIImage(named: "Volleyball6")),
        
        StadiumInfo(name: "Территория мяча",
                    address: "Шарикоподшипниковая улица, 13с.24, Москва, 115088",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.718796, longtitude: 37.687686),
                    phoneNumber: "8 (495) 055-13-41",
                    webSite: "https://terball.ru/?utm_source=google-maps",
                    photo: UIImage(named: "Volleyball7")),
        
        StadiumInfo(name: "Панда Воллейбол",
                    address: "Пятый Донской пассаж, 15, стр. 7, Москва, 119334",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.705422, longtitude: 37.600424),
                    phoneNumber: "8 (926) 338-85-96",
                    webSite: "http://pandavolleyhall.ru",
                    photo: UIImage(named: "Volleyball8")),
        
        StadiumInfo(name: "Заозерная",
                    address: "Заозерная улица, 8, Москва, 111621",
                    openHours: "Открыто 24 часа",
                    coordinates: Coordinates(latitude: 55.716671, longtitude: 37.850173),
                    phoneNumber: "Не указан",
                    webSite: "Не указан",
                    photo: UIImage(named: "Volleyball9")),
        
        StadiumInfo(name: "Всероссийская воллейбольная федерация",
                    address: "Лужники, 8, оффис: 447, 451, 452, 454, Москва, 119270",
                    openHours: "9:00 - 21:00",
                    coordinates: Coordinates(latitude: 55.722132, longtitude: 37.554439),
                    phoneNumber: "8 (495) 637-00-00",
                    webSite: "Не указан",
                    photo: UIImage(named: "Volleyball10"))
        ]
    
}


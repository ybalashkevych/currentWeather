//
//  Weather.h
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 01.05.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Weather : NSObject

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSString *mainInfo;
@property (strong, nonatomic) NSString *descriptionInfo;
@property (strong ,nonatomic) NSString *icon;

@property (assign, nonatomic) CLLocationCoordinate2D coords;

@property (assign, nonatomic) CGFloat currentTemperature;
@property (assign, nonatomic) CGFloat windSpeed;

@property (assign, nonatomic) NSInteger humidity;
@property (assign, nonatomic) NSInteger cloudsLevel;

- (instancetype)initWithParameters:(NSDictionary*)params;

@end

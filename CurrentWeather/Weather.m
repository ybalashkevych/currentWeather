//
//  Weather.m
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 01.05.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import "Weather.h"

@implementation Weather

#pragma mark - Designated Initializer

- (instancetype)initWithParameters:(NSDictionary *)params {
    
    if (self = [super init]) {
        
        NSDictionary *coords = [params objectForKey:@"coord"];
        self.coords             = CLLocationCoordinate2DMake([[coords objectForKey:@"lat"] doubleValue], [[coords objectForKey:@"lon"] doubleValue]);
        self.cityName           = [params objectForKey:@"name"];
        self.mainInfo           = [[params objectForKey:@"weather"][0] objectForKey:@"main"];
        self.descriptionInfo    = [[params objectForKey:@"weather"][0] objectForKey:@"description"];
        self.icon               = [[params objectForKey:@"weather"][0] objectForKey:@"icon"];
        self.currentTemperature = [[[params objectForKey:@"main"]   objectForKey:@"temp"]       floatValue] - 273.15;
        self.windSpeed          = [[[params objectForKey:@"wind"]   objectForKey:@"speed"]      floatValue];
        self.humidity           = [[[params objectForKey:@"main"]   objectForKey:@"humidity"]   integerValue];
        self.cloudsLevel        = [[[params objectForKey:@"clouds"] objectForKey:@"all"]        integerValue];
        
    }
    
    return self;
}

@end

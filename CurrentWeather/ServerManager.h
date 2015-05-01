//
//  ServerManager.h
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 30.04.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

+ (ServerManager*)sharedManager;

- (void)getWeatherWithParams:(NSDictionary*)params onSuccess:(void(^)(id weather))success andFailure:(void(^)(NSError *error,NSInteger statusCode))failure;

@end

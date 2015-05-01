//
//  ServerManager.m
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 30.04.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import "ServerManager.h"
#import "Weather.h"

@interface ServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *requestOperationManager;

@end

@implementation ServerManager

#pragma mark - Shared Manager

+ (ServerManager*)sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}







#pragma mark - API Requests

- (void)getWeatherWithParams:(NSDictionary *)params onSuccess:(void (^)(id))success andFailure:(void (^)(NSError *, NSInteger))failure {

    [self.requestOperationManager GET:@"data/2.5/weather/" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //NSLog(@"%@", [responseObject objectForKey:@"weather"]);
        Weather *weather = [[Weather alloc] initWithParameters:responseObject];
        
        if (success) {
            success(weather);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error, operation.response.statusCode);
        }
    }];
    
}







#pragma mark - Getters and Setters

- (AFHTTPRequestOperationManager*)requestOperationManager {
    
    if (!_requestOperationManager) {
        
        NSURL *baseURL = [NSURL URLWithString:@"http://api.openweathermap.org/"];
        _requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
        
    }
    
    return _requestOperationManager;
}

@end










































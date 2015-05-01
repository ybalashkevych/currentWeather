//
//  MapTableViewCell.h
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 01.05.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

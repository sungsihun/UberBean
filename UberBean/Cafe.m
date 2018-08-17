//
//  Cafe.m
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe

- (instancetype)initWithInfo:(NSDictionary*)info {
    if (self = [super init]) {
        _title = info[@"name"];
        _latitude = info[@"coordinates"][@"latitude"];
        _longitude = info[@"coordinates"][@"longitude"];
        _coordinate = CLLocationCoordinate2DMake([_latitude doubleValue],[_longitude doubleValue]);
        
    }
    return self;
}

@end

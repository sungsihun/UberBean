//
//  Cafe.h
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cafe : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;

- (instancetype)initWithInfo:(NSDictionary*)info;

@end

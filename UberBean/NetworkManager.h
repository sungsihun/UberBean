//
//  NetworkManager.h
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
+ (void)getCafes:(void (^)(NSArray* cafes))completion;
@end

//
//  Config.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

@property (strong, nonatomic) NSString *backendURL;

+ (instancetype)shared;
@end

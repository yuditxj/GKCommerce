//
//  Injection.m
//  GKCommerce
//
//  Created by 小悟空 on 11/25/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Dependency.h"
#import "CartService.h"
#import "ECCartService.h"

@implementation Dependency

- (id<CartBackend>)cartBackend
{
    return [[self factory] cartBackend];
}

- (id<CartService>)cartService
{
    return [[self factory] cartService];
}

- (id<UserBackend>)userBackend
{
    return [[self factory] userBackend];
}

- (id<UserService>)userService
{
    return [[self factory] userService];
}

- (id<GKProductBackend>)productBackend
{
    return [[self factory] productBackend];
}

- (id<GKProductService>)productService
{
    return [[self factory] productService];
}

- (id<FeatureService>)featureService
{
    return [[self factory] featureService];
}

- (id<FeatureBackend>)featureBackend
{
    return [[self factory] featureBackend];
}

- (id<AddressBackend>)addressBackend
{
    return [[self factory] addressBackend];
}

- (id<AddressService>)addressService
{
    return [[self factory] addressService];
}

+ (instancetype)shared
{
    static Dependency *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end

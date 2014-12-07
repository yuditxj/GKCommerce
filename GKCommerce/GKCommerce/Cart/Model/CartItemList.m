//
//  CartItemCollection.m
//  GKCommerce
//
//  Created by 小悟空 on 12/2/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartItemList.h"

@implementation CartItemList

- (id)init
{
    self = [super init];
    if (self) {
        self.selected = [[NSMutableArray alloc] init];
    }
    return self;
}

- (CartItem *)itemAtIndex:(NSInteger)index
{
    return [self.items objectAtIndex:index];
}

- (void)addItem:(CartItem *)item
{
    [item addObserver:self forKeyPath:@"quantity"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:nil];
    [self.items addObject:item];
    
    [RACObserve(item, selected) subscribeNext:^(id x) {
        BOOL selected = [x boolValue];
        if (selected)
            [self.selected addObject:item];
        else
            [self.selected removeObject:item];
        [self willChangeValueForKey:@"selected"];
        [self didChangeValueForKey:@"selected"];
    }];
    item.list = self;
}

- (void)addItems:(NSArray *)items
{
    for (CartItem *item in items) {
        [self addItem:item];
    }
}

- (void)removeItem:(CartItem *)item
{
    [item removeObserver:self forKeyPath:@"quantity"];
    [item removeObserver:self forKeyPath:@"selected"];
    [self willChangeValueForKey:@"items"];
    [self.items removeObject:item];
    [self didChangeValueForKey:@"items"];
}

- (void)removeItemWithID:(NSInteger)itemID
{
    [self.items removeObject:[self itemWithID:itemID]];
}

- (CartItem *)itemWithID:(NSInteger)itemID
{
    __block CartItem *found = nil;
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                                    BOOL *stop) {
        CartItem *item = (CartItem *)obj;
        if (item.itemID == itemID)
            found = item;
    }];
    
    return found;
}

// TODO: 观察CartItem的selected属性，维护selected集合

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([@"quantity" isEqualToString:keyPath] &&
        [object isKindOfClass: [CartItem class]] &&
        0 == ((CartItem *)object).quantity) {
        [self removeItem:object];
    }
}
@end
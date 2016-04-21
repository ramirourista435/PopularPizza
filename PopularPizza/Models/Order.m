//
//  Order.m
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import "Order.h"

@implementation Order

- (instancetype)initWithToppings: (NSArray *) toppings
{
    self = [super init];
    if (self) {
        self.toppings = toppings;
    }
    return self;
}

@end

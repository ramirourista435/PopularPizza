//
//  Order.h
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (nonatomic) NSArray *toppings;

- (instancetype)initWithToppings: (NSArray *) toppings;

@end

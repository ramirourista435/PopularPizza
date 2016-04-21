//
//  FrequencyCalculator.m
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import "FrequencyCalculator.h"
#import "Order.h"

@implementation FrequencyCalculator

- (void) getFrequencyOfOrders: (NSArray *) orders {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSDictionary *frequentOrders = [self getFrequency:orders];

        // Sort Orders
        NSArray *sortedArray = [self sortDictionaryKeys:frequentOrders];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.delegate frequencyCalculator:self didGenerateFrequency:frequentOrders withSortedKeys:sortedArray];
        
        });
        
    });
}

- (NSDictionary *) getFrequency:(NSArray *)orders {
    NSString *toppings;
    NSNumber *currentCount;
    NSMutableDictionary *frequentOrders = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    for (Order *order in orders) {
        
        toppings = [order.toppings componentsJoinedByString:@","];
        currentCount = @0;
        
        if (frequentOrders[toppings] == nil) {
            frequentOrders[toppings] = @1;
        } else {
            currentCount = frequentOrders[toppings];
            frequentOrders[toppings] = @([currentCount integerValue] + 1);
        }
    }
    return frequentOrders;
}

- (NSArray *) sortDictionaryKeys: (NSDictionary *) frequentOrders {
    NSArray *sortedArray = [frequentOrders keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult) NSOrderedDescending;
        }
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult) NSOrderedAscending;
        }
        return (NSComparisonResult) NSOrderedSame;
    }];
    
    return sortedArray;
}


@end

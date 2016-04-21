//
//  Parser.m
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import "Parser.h"
#import "Order.h"

static NSString *const TOPPINGS_KEY = @"toppings";

@implementation Parser

- (void) parsePizzaOrders {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        
        Order *order;
        NSError *error;
        NSArray *toppings;
        NSMutableArray *orders = [[NSMutableArray alloc] initWithCapacity:0];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pizzas" ofType:@"json"];
        NSData *fileContents = [NSData dataWithContentsOfFile:filePath];
        NSArray *orderArray = [NSJSONSerialization JSONObjectWithData:fileContents
                                                              options:NSJSONReadingMutableLeaves
                                                                error:&error];
        for (NSDictionary *toppingsDict in orderArray) {
            toppings = toppingsDict[TOPPINGS_KEY];
            order = [[Order alloc] initWithToppings:toppings];
            [orders addObject:order];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^(){
            [self.delegate parser:self didFinishParsingOrders:orders];
        });
    });
}


@end

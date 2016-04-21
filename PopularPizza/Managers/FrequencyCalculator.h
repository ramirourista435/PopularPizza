//
//  FrequencyCalculator.h
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FrequencyCalculator;

@protocol FrequencyCalculatorDelegate <NSObject>

- (void) frequencyCalculator: (FrequencyCalculator *) frequencyCalculator didGenerateFrequency: (NSDictionary *) frequency withSortedKeys: (NSArray *) sortedKeys;

@end


@interface FrequencyCalculator : NSObject

@property (nonatomic, weak) id<FrequencyCalculatorDelegate> delegate;

- (void) getFrequencyOfOrders: (NSArray *) orders;
- (NSDictionary *) getFrequency:(NSArray *)orders;

@end

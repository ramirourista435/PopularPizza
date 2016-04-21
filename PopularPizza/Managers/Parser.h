//
//  Parser.h
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parser;

@protocol ParserDelegate <NSObject>

- (void) parser: (Parser *)parser didFinishParsingOrders: (NSArray *) orders;

@end


@interface Parser : NSObject

@property (nonatomic, weak) id<ParserDelegate> delegate;

- (void) parsePizzaOrders;

@end

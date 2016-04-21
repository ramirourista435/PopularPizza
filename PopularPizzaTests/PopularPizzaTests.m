//
//  PopularPizzaTests.m
//  PopularPizzaTests
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FrequencyCalculator.h"
#import "Order.h"

@interface PopularPizzaTests : XCTestCase
@property (nonatomic, strong) FrequencyCalculator *freqCalc;
@property (nonatomic, strong) NSMutableArray *orders;
@end

@implementation PopularPizzaTests

- (void)setUp {
    [super setUp];
    self.freqCalc = [[FrequencyCalculator alloc] init];
    self.orders = [[NSMutableArray alloc] initWithCapacity:0];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni"]]];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni, bacon"]]];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni, bacon"]]];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni, bacon"]]];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni, bacon"]]];
    [self.orders addObject:[[Order alloc] initWithToppings:@[@"peperoni, bacon, sausage"]]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCalculateFrequency {
    
    NSDictionary *frequentOrders = [self.freqCalc getFrequency:self.orders];
    
    XCTAssertEqual([frequentOrders[@"peperoni"] integerValue], 1);
    XCTAssertEqual([frequentOrders[@"peperoni, bacon"] integerValue], 4);
    XCTAssertEqual([frequentOrders[@"peperoni, bacon, sausage"] integerValue], 1);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

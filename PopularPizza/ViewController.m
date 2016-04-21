//
//  ViewController.m
//  PopularPizza
//
//  Created by Ramiro on 4/21/16.
//  Copyright © 2016 Ramiro. All rights reserved.
//

#import "ViewController.h"
#import "Parser.h"
#import "Order.h"
#import "FrequencyCalculator.h"

@interface ViewController () <ParserDelegate, FrequencyCalculatorDelegate, UITableViewDataSource>

@property (nonatomic, strong) Parser *parser;
@property (nonatomic, strong) FrequencyCalculator *freqCalc;
@property (nonatomic, strong) NSArray *sortedKeys;
@property (nonatomic, strong) NSDictionary *frequentOrders;
@property (weak, nonatomic) IBOutlet UITableView *popularPizzaTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.freqCalc = [[FrequencyCalculator alloc] init];
    self.freqCalc.delegate = self;
    self.parser = [[Parser alloc] init];
    self.parser.delegate = self;
    [self.parser parsePizzaOrders];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark:- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"freqCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.sortedKeys[indexPath.row];
    NSNumber *frequency = self.frequentOrders[self.sortedKeys[indexPath.row]];
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%ld", [frequency integerValue]];
    
    return cell;
}


#pragma mark:- ParserDelegate
-(void)parser:(Parser *)parser didFinishParsingOrders:(NSArray *)orders {
    [self.freqCalc getFrequencyOfOrders: orders];
}

#pragma mark:- FrequencyCalculatorDelegate
-(void)frequencyCalculator:(FrequencyCalculator *)frequencyCalculator didGenerateFrequency:(NSDictionary *)frequency withSortedKeys:(NSArray *)sortedKeys {
    self.frequentOrders = frequency;
    self.sortedKeys = sortedKeys;
    
    [self.popularPizzaTable reloadData];
}


@end

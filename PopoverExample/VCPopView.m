//
//  VCPopView.m
//  PopoverExample
//
//  Created by Zaur Giyasov on 30/07/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "VCPopView.h"

@interface VCPopView ()
@property (nonatomic) UITableView *myTable;

@end

@implementation VCPopView

-(void)loading {
    [self createTable];
}

-(void)createTable {
    CGRect frame = self.view.bounds;
    self.myTable = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:self.myTable];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loading];
}

@end

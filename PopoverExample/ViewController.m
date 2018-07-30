//
//  ViewController.m
//  PopoverExample
//
//  Created by Zaur Giyasov on 30/07/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIView *customView;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loading];
}

-(void)loading {
    [self createMainView];
    [self createLocalNavibarButtons];
}

-(void)createMainView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    frame.origin.y = 40;
    self.customView = [[UIView alloc]initWithFrame:frame];
    self.customView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.customView];
}

-(void)createLocalNavibarButtons {
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
    UINavigationBar *naviBar = [[UINavigationBar alloc] initWithFrame:frame];
    
    // Items
    UINavigationItem *naviItem = [[UINavigationItem alloc] initWithTitle:@"example Title"];
    UIBarButtonItem *cancelBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonAction:)];
    naviItem.leftBarButtonItem = cancelBarBtn;
    
    UIBarButtonItem *showBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showButtonAction:)];
    naviItem.rightBarButtonItem = showBarItem;
    
    [naviBar setItems:@[naviItem]];
    [self.view addSubview:naviBar];
}

-(void)cancelButtonAction: (id)sender {
    // cancel action
}

-(void)showButtonAction: (id)sender {
    // show action
}

@end

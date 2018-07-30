//
//  VCPopView.m
//  PopoverExample
//
//  Created by Zaur Giyasov on 30/07/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "VCPopView.h"


static NSString *TableViewCellID = @"MyCell";

static NSString *Static1Numbers = @"First Group Numbers";
static NSString *Static2Numbers = @"Second Group Numbers";
static NSString *Static3Numbers = @"Threed Group Numbers";

static NSString *A1_Hiden = @"Hiden Group 1";
static NSString *A2_Hiden = @"Hiden Group 2";

@interface VCPopView () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic) UITableView *myTable;
@property (nonatomic) NSMutableDictionary *dictOfNumbers;
//@property (nonatomic) UINavigationController *navi;
@end

@implementation VCPopView

-(void)loading {
    [self createTable];
}

-(void)createTable {

    CGRect frame = self.view.bounds;
    self.myTable = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    [self.myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellID];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    self.myTable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.myTable];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loading];
}

-(NSMutableDictionary *)dictOfNumbers {
    
    if (_dictOfNumbers == nil) {
        
        NSMutableArray *arr001 = [[NSMutableArray alloc] initWithArray:@[@543765, @486543, @2764872, @11764642]];
        NSMutableArray *arr002 = [[NSMutableArray alloc] initWithArray:@[@678547, @445442, @77643876]];
        
        NSMutableArray *arr1 = [[NSMutableArray alloc] initWithArray:@[@0, @2, @4, @6]];
        NSMutableArray *arr2 = [[NSMutableArray alloc] initWithArray:@[@1, @5, @9, @11]];
        NSMutableArray *arr3 = [[NSMutableArray alloc] initWithArray:@[@88, @44, @22, @11]];
        
        _dictOfNumbers = [[NSMutableDictionary alloc] initWithDictionary:@{ A1_Hiden:arr001,
                                                                            A2_Hiden:arr002,
                                                                            Static1Numbers:arr1,
                                                                            Static2Numbers:arr2,
                                                                            Static3Numbers:arr3 }];
    }
    return _dictOfNumbers;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dictOfNumbers.allKeys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionNameInDict = self.dictOfNumbers.allKeys[section];
    NSArray *sectArray = self.dictOfNumbers[sectionNameInDict];
    
    return sectArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableViewCellID];
    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellID forIndexPath:indexPath];
    
    NSString *sectNameInDict = self.dictOfNumbers.allKeys[indexPath.section];
    NSArray *sectArray = self.dictOfNumbers[sectNameInDict];
    
    NSNumber *num = sectArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%lu - cell:%lu  section:%lu", (unsigned long)[num unsignedIntegerValue], indexPath.row, indexPath.section];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        return self.dictOfNumbers.allKeys[section];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        CGRect frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, 60);
        return [self createSearchViewWithFrame:frame];
    } else {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 25;
}

-(UIView *)createSearchViewWithFrame:(CGRect)frame {
    
    UIView *searh = [[UIView alloc] initWithFrame:frame];
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, frame.size.width - 30, frame.size.height)];
    textF.delegate = self;
    [textF setPlaceholder:@"Search text..."];
    [searh addSubview:textF];
    return searh;
}

@end

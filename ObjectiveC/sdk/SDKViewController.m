//
//  SDKViewController.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "SDKViewController.h"
#import "HUDViewController.h"
#import "MasonryVC.h"
#import "SDViewController.h"

#define CELLID "MyCell"

@interface SDKViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation SDKViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    SDViewController *sdVC = [SDViewController new];
    sdVC.title = @"SDAutoLayout使用事例";
    [self.dataArray addObject:sdVC];
    
    MasonryVC *masVC = [MasonryVC new];
    masVC.title = @"Masonry使用事例";
    [self.dataArray addObject:masVC];
    
    HUDViewController *hudVC = [[HUDViewController alloc] init];
    hudVC.title = [NSString stringWithFormat:@"MBProgressHUD"];
    [self.dataArray addObject:hudVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"All SDK";
    [self loadData];

    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@CELLID];
}

//Sections数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//Row数量
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@CELLID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@CELLID];
    }
    UIViewController *anyVC = _dataArray[indexPath.row];
    cell.textLabel.text = anyVC.title;
    return cell;
}
//点击cell事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *anyVC = _dataArray[indexPath.row];
    [self.navigationController pushViewController:anyVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
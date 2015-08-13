//
//  RootViewController.m
//  StartDemo
//
//  Created by anywhere on 15/8/12.
//  Copyright (c) 2015年 anywhere. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import "RootTableViewCell.h"
//#import "UIImageView+WebCache.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_startTableView;
    NSMutableArray *_iosArray;
    NSMutableArray *_gitHubArray;
    NSMutableArray *_cocoaChinaArray;
    NSMutableArray *_blogArray;
    NSMutableArray *_toolArray;
    DetailViewController *_detailVC;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS学习资料";
    [self readPlist];
    [self makeTableView];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)readPlist{
    _iosArray = [[NSMutableArray alloc] init];
    _gitHubArray = [[NSMutableArray alloc] init];
    _cocoaChinaArray = [[NSMutableArray alloc] init];
    _blogArray = [[NSMutableArray alloc] init];
    _toolArray = [[NSMutableArray alloc] init];
    NSString * pathPlist =  [[NSBundle mainBundle] pathForResource:@"StartPlist" ofType:@"plist"];
    NSDictionary *pistDic = [NSDictionary dictionaryWithContentsOfFile:pathPlist];
    
    _iosArray = pistDic[@"iOS"];
    _gitHubArray = pistDic[@"GitHub"];
    _cocoaChinaArray = pistDic[@"CocoaChina"];
    _blogArray = pistDic[@"Blog"];
    _toolArray = pistDic[@"Tools"];
    
    
}


-(void)makeTableView{
    _startTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _startTableView.dataSource = self;
    _startTableView.delegate = self;
    [self.view addSubview:_startTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _blogArray.count;
    }else if (section == 1){
        return _cocoaChinaArray.count;
    }else if (section == 2){
        return _gitHubArray.count;
    }else if (section == 3){
        return _iosArray.count;
    }else{
        return _toolArray.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 15;
    }else{
        return 15;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    static NSString *identifierCell = @"identifierCell";
    if (cell == nil) {
        cell = [[RootTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary * dic = nil;
    if (indexPath.section == 0) {
        dic = _blogArray[indexPath.row];
    }else if (indexPath.section == 1){
        dic = _cocoaChinaArray[indexPath.row];
    }else if (indexPath.section == 2){
        dic = _gitHubArray[indexPath.row];
    }else if (indexPath.section == 3) {
        dic = _iosArray[indexPath.row];
    }else{
        dic = _toolArray[indexPath.row];
    }
    
//    cell.imageView.layer.cornerRadius = 50;
//    cell.imageView.layer.masksToBounds = YES;
//    [cell.imageView setImageWithURL:[NSURL URLWithString:dic[@"imageurl"]]];
//    
//    cell.textLabel.text = dic[@"name"];
//    cell.textLabel.textColor = [UIColor brownColor];
//    cell.textLabel.font = [UIFont systemFontOfSize:22];
//    cell.detailTextLabel.text = dic[@"detailName"];
//    cell.detailTextLabel.textColor = [UIColor blueColor];
//    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    [(RootTableViewCell *)cell cellForDataFromDic:dic];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = nil;
    if (indexPath.section == 0) {
        dic = _blogArray[indexPath.row];
    }else if (indexPath.section == 1){
        dic = _cocoaChinaArray[indexPath.row];
    }else if (indexPath.section == 2){
        dic = _gitHubArray[indexPath.row];
    }else if (indexPath.section == 3) {
        dic = _iosArray[indexPath.row];
    }else{
        dic = _toolArray[indexPath.row];
    }
    _detailVC = [[DetailViewController alloc] init];
    _detailVC.urlStr = dic[@"url"];
    _detailVC.titleStr = dic[@"name"];
    [self.navigationController pushViewController:_detailVC animated:YES];

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

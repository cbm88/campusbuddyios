//
//  DormRoomViewController.m
//  CampusBuddy
//
//  Created by Mark Rustad on 11/27/16.
//  Copyright © 2016 Mark Rustad. All rights reserved.
//

#import "DormRoomViewController.h"

@interface DormRoomViewController ()

{
    NSArray *tableData;
    NSMutableArray *selectedRows;
}

@end

@implementation DormRoomViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = tableData[indexPath.row];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    NSNumber *obj = [NSNumber numberWithInteger:indexPath.row];
    if ([selectedRows containsObject:obj])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *obj = [NSNumber numberWithInteger:indexPath.row];
    if ([selectedRows containsObject:obj])
    {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [selectedRows removeObject:obj];
        [tableView reloadData];
    }else{
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [selectedRows addObject:obj];
        [tableView reloadData];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:selectedRows forKey:@"SelectedRows"];
    [defaults synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableData = [NSArray arrayWithObjects:@"Bedding",@"Textbooks",@"Lighting",@"Writing Supplies",@"Kitchenware",@"Storage",@"Laptop",@"Printer",@"TV/Games/Music",nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    selectedRows = [NSMutableArray arrayWithArray:[defaults objectForKey:@"SelectedRows"]];
    
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

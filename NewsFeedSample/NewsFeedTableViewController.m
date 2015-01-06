//
//  NewsFeedTableViewController.m
//  NewsFeedSample
//
//  Created by OnurMac on 03/01/15.
//  Copyright (c) 2015 com.pactera.iosteam. All rights reserved.
//

#import  "NewsFeedTableViewController.h"
#import  "CJSONDeserializer.h"
#import  "NewsFeedCell.h"
#include "NSDictionary_JSONExtensions.h"
#import "UIImageView+WebCache.h"

@interface NewsFeedTableViewController (){
    NSMutableArray *rows;
}

@end

@implementation NewsFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchAllData];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    // Reload issues button
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                               target:self
                               action:@selector(fetchAllData)];
    self.navigationItem.rightBarButtonItem = button;
    
    
    
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/746330/facts.json" ];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSDictionary *dictionary;
    NSString* newStr = [[NSString alloc] initWithData:jsonData encoding:NSWindowsCP1250StringEncoding];
    if(jsonData != nil)
    {
        NSError *error = nil;
        dictionary =  [NSDictionary dictionaryWithJSONString:newStr error:&error];
        
        if (error == nil)
        {
            self.navigationItem.title = [dictionary valueForKey:@"title"];
            rows = dictionary[@"rows"];
        }
    }

    [refreshControl endRefreshing];
}

-(void)fetchAllData{
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/746330/facts.json" ];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSDictionary *dictionary;
    NSString* newStr = [[NSString alloc] initWithData:jsonData encoding:NSWindowsCP1250StringEncoding];
    if(jsonData != nil)
    {
        NSError *error = nil;
        dictionary =  [NSDictionary dictionaryWithJSONString:newStr error:&error];
        
        if (error == nil)
        {
            self.navigationItem.title = [dictionary valueForKey:@"title"];
            rows = dictionary[@"rows"];
        }
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    return rows.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    if([[rows objectAtIndex:indexPath.row] objectForKey:@"description"] == [NSNull null]){
        return 140;
    }else{
        NSString *text = [[rows objectAtIndex:indexPath.row] objectForKey:@"description"];
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14]
                       constrainedToSize:CGSizeMake(207, CGFLOAT_MAX)];
        return 100 + size.height;
    }
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsFeedCell *cell = (NewsFeedCell *)[self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSMutableDictionary *d=(NSMutableDictionary*)[rows objectAtIndex:indexPath.row];
    
    if(cell == nil){
        cell = [[NewsFeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if(([d valueForKey:@"title"]!=[NSNull null]))
    {
        cell.Title.text =[d valueForKey:@"title"];
    }
    
    if(([d valueForKey:@"description"]!=[NSNull null]))
    {
        cell.Context.text =[d valueForKey:@"description"];
    }
    
    if(([d valueForKey:@"imageHref"]!=[NSNull null]))
    {
        [cell.imgNews setImageWithURL:[NSURL URLWithString:[d valueForKey:@"imageHref"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"] ];
    }
    
    return cell;
}


@end

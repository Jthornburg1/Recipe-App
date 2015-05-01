//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Monica Platt on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"
#import "RARecipes.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end


@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Daniel & Jon's recipes";

    self.dataSource = [RecipesTableViewDataSource new];
    
    // Initialize and add the tableView as a subview of the main view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];

    
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    RecipeDetailViewController *recipeDetailViewController = [RecipeDetailViewController new];
    recipeDetailViewController.recipeIndex = indexPath.row;
    [self.navigationController pushViewController:recipeDetailViewController animated:YES];
    
    
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

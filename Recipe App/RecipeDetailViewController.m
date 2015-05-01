//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by jonathan thornburg on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 20;

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];{
        
        self.title = [RARecipes titleAtIndex:self.recipeIndex];
        self.view.backgroundColor = [UIColor whiteColor];
        
        CGFloat topMargin = 20;
        
        
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:scroll];
        
        CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
        
        UILabel *description = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width - 2 * margin, heightForDescription)];
        self.view.backgroundColor = [UIColor redColor];
        description.text = [RARecipes descriptionAtIndex:self.recipeIndex];
        description.numberOfLines = 0;
        [scroll addSubview:description];
        
        
        
        CGFloat top = heightForDescription * 2;
        
        UILabel *ingredients = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
        ingredients.text = @"Ingredients";
        [scroll addSubview:ingredients];
        
        top += (20 + margin);
        
        
        for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i ++) {
            
            UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) / 4, 20)];
            volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
            [scroll addSubview:volume];
            
            UILabel *type = [[UILabel alloc]initWithFrame:CGRectMake(margin + (self.view.frame.size.width - 2 * margin) /4 , top, (self.view.frame.size.width - 2 * margin) * 3 / 4, 20)];
            type.numberOfLines = 0;
            type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
            [scroll addSubview:type];
            
            top += (20 + margin);
            
            
        }
        
        
        
        top += margin;
        
        UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20)];
        directions.text = @"Directions";
        [scroll addSubview:directions];
        
        top += (20 + margin);
        
        for (int i = 0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i ++) {
            CGFloat height = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
            
            UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
            count.text = [RARecipes directionsAtIndex:self.recipeIndex] [i];
            [scroll addSubview:count];
            
            UILabel *direction = [[UILabel alloc]initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
            direction.numberOfLines = 0;
            direction.text = [RARecipes directionsAtIndex:self.recipeIndex] [i];
            [scroll addSubview:direction];
            
            top += (margin + height);
        }
        
    
    
        
        
        scroll.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
        
        

        
        }
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
         - (CGFloat)heightForDescription:(NSString *)description {
             
             CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, CGFLOAT_MAX)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                         context:nil];
             
             return bounding.size.height;
             
         }
         
         - (CGFloat)heightForDirections:(NSString *)description {
             
             CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                         context:nil];
             
             return bounding.size.height;
             
         }
         


@end

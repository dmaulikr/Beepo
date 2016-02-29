//
//  Skin.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Skin.h"
#import "PhasesChoose.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@implementation Skin{
    BOOL primeira;
}

-(void)dealloc{
    NSLog(@"desalocou customskins");
}

-(void)viewDidLoad{
    [super viewDidLoad];
    primeira = true;
    self.player = [[Player alloc]init];
    self.player.gasperEscolhido = [UIImage imageNamed:@"fantasminha"];
    [[self.item1 layer] setBorderWidth:2.0f];
    [[self.item2 layer] setBorderWidth:2.0f];
    [[self.item3 layer] setBorderWidth:2.0f];
    [[self.item1 layer] setBorderColor:[UIColor colorWithRed:236.f green:65.f blue:72.f alpha:1.f].CGColor];
    [[self.item2 layer] setBorderColor:[UIColor colorWithRed:236.f green:65.f blue:72.f alpha:1.f].CGColor];
    [[self.item3 layer] setBorderColor:[UIColor colorWithRed:236.f green:65 blue:72 alpha:1].CGColor];
    [[self.item1 layer] setCornerRadius:5.0f];
    [[self.item2 layer] setCornerRadius:5.0f];
    [[self.item3 layer] setCornerRadius:5.0f];
}

-(IBAction)start:(id)sender{
        PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
}

-(IBAction)change:(id)sender{
    if (primeira == true) {
        primeira = false;
        self.item1.image = [UIImage imageNamed:@"custom05"];
        self.item2.image = [UIImage imageNamed:@"custom06"];
        self.item3.image = [UIImage imageNamed:@"custom04"];
    }
    else{
        primeira = true;
        self.item1.image = [UIImage imageNamed:@"custom01"];
        self.item2.image = [UIImage imageNamed:@"custom02"];
        self.item3.image = [UIImage imageNamed:@"custom03"];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGRect charFrame = self.gasper.frame;
    charFrame.origin.y = charFrame.origin.y - 45.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.sombra.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.gasper.frame = charFrame;
    self.sombra.frame = shadowFrame;
    [UIView commitAnimations];
}

-(IBAction)choosedFirst:(id)sender{
    if (primeira == true) {
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom15"];
        self.gasper.image = [UIImage imageNamed:@"custom15"];
        
    }
    else{
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom18"];
        self.gasper.image = [UIImage imageNamed:@"custom18"];
        
    }
}

-(IBAction)choosedSecond:(id)sender{
    if (primeira == true) {
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom16"];
        self.gasper.image = [UIImage imageNamed:@"custom16"];
        
    }
    else{
        
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom19"];
        self.gasper.image = [UIImage imageNamed:@"custom19"];
        
    }
}

-(IBAction)choosedThird:(id)sender{
    if (primeira == true) {
        self.gasper.image = [UIImage imageNamed:@"custom17"];
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom17"];
    }
    else{
        self.player.gasperEscolhido = [UIImage imageNamed:@"custom20"];
        self.gasper.image = [UIImage imageNamed:@"custom20"];
        
    
    }
    
}

    

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

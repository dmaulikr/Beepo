//
//  Skin.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Skin.h"
#import "Story1.h"
#import "Phase2.h"
#import "Phase3.h"
#import "Phase4.h"

#import "AppDelegate.h"

@implementation Skin{
    BOOL primeira;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    primeira = true;
    
}

-(IBAction)start:(id)sender{
    if ([self.faseClicada isEqualToString:@"casa"] && self.player.fase1) {
        Story1 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story1VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        game.gasperEscolhido = self.gasperEscolhido;
        [self presentViewController:game animated:YES completion:nil];
    }
    if ([self.faseClicada isEqualToString:@"parque"]) {
        Phase2 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story2VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        game.gasperEscolhido = self.gasperEscolhido;
        [self presentViewController:game animated:YES completion:nil];
    }
    if ([self.faseClicada isEqualToString:@"hospital"]) {
        Phase3 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase3VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
    if ([self.faseClicada isEqualToString:@"prefeitura"]) {
        Phase4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase4VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
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
        self.gasper.image = [UIImage imageNamed:@"custom15"];
        self.gasperEscolhido = @"gravata";
    }
    else{
        self.gasper.image = [UIImage imageNamed:@"custom18"];
        self.gasperEscolhido = @"chapeu";
    }
}

-(IBAction)choosedSecond:(id)sender{
    if (primeira == true) {
        self.gasper.image = [UIImage imageNamed:@"custom16"];
         self.gasperEscolhido = @"oculos";
    }
    else{
        
        self.gasper.image = [UIImage imageNamed:@"custom19"];
         self.gasperEscolhido = @"bolsa";
    }
}

-(IBAction)choosedThird:(id)sender{
    if (primeira == true) {
        
        self.gasper.image = [UIImage imageNamed:@"custom17"];
         self.gasperEscolhido = @"tapaolho";
    }
    else{
         self.gasperEscolhido = @"vibe";
        self.gasper.image = [UIImage imageNamed:@"custom20"];
    }
    
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  PhasesChoose.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "PhasesChoose.h"
#import "Player.h"
#import "Story1.h"
#import "Story2.h"
#import "Story3.h"
#import "Story4.h"
#import "AppDelegate.h"

@implementation PhasesChoose

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.fundo];
    
    if (self.player.fase1) {
        [self.fase1 setBackgroundImage:[UIImage imageNamed:@"atividades-casa-color"] forState:UIControlStateNormal];
    }
    if (self.player.medalha1fase1) {
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
    }
    if (self.player.medalha2fase1) {
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
    }
    #
    if (self.player.fase2) {
        [self.fase2 setBackgroundImage:[UIImage imageNamed:@"atividades-praca-color"] forState:UIControlStateNormal];
    }
    
    if (self.player.medalha1fase2) {
        self.medalha1fase2.image = [UIImage imageNamed:@"badge-lixo-color"];
    }
    if (self.player.medalha2fase2) {
        self.medalha2fase2.image = [UIImage imageNamed:@"badge-natureza-color"];
    }
    #
    if (self.player.fase3) {
        [self.fase3 setBackgroundImage:[UIImage imageNamed:@"atividades-hospital-color"] forState:UIControlStateNormal];
    }
    
    if (self.player.medalha1fase3) {
        self.medalha1fase3.image = [UIImage imageNamed:@"badge-idoso-color"];
    }
    if (self.player.medalha2fase3) {
        self.medalha2fase3.image = [UIImage imageNamed:@"badge-transito-color"];
    }
    #
    if (self.player.fase4) {
        [self.fase4 setBackgroundImage:[UIImage imageNamed:@"atividades-prefeitura-color"] forState:UIControlStateNormal];
    }
    
    if (self.player.medalha1fase4) {
        self.medalha1fase4.image = [UIImage imageNamed:@"badge-casa-color"];
    }
    if (self.player.medalha2fase4) {
        self.medalha2fase4.image = [UIImage imageNamed:@"badge-casa-color"];
    }
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)clicouCasa:(id)sender{
    if (self.player.fase1) {
        Story1 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story1VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
}

-(IBAction)clicouParque:(id)sender{
    if (self.player.fase2) {
        Story2 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story2VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
}

-(IBAction)clicouHospital:(id)sender{
    if (self.player.fase3) {
        Story3 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story3VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
}

-(IBAction)clicouPrefeitura:(id)sender{
    if (self.player.fase4) {
        Story4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Story4VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
}

@end

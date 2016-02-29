//
//  Votacao.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/22/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Votacao.h"
#import "Fim.h"
#import <AVFoundation/AVFoundation.h>

@interface Votacao (){
    BOOL opcao1;
    BOOL opcao2;
    BOOL opcao3;
}

@end

@implementation Votacao
AVAudioPlayer* _audioPlayer11;
NSString* path10;

-(void)dealloc{
    NSLog(@"desalocou votacao");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.player) {
        self.player = [[Player alloc]init];
    }
    opcao1 = false;
    opcao2 = false;
    opcao3 = false;
    
    path10 = [NSString stringWithFormat:@"%@/12_prefeitura-puzzlecaixa.mp3", [[NSBundle mainBundle] resourcePath]];
}

-(IBAction)opcao1:(id)sender{
    opcao1 = true;
    opcao2 = false;
    opcao3 = false;
    self.opcao1.selected = YES;
    self.opcao2.selected = NO;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = NO;
}

-(IBAction)opcao2:(id)sender{
    opcao1 = false;
    opcao2 = true;
    opcao3 = false;
    self.opcao1.selected = NO;
    self.opcao2.selected = YES;
    self.opcao3.selected = NO;
    self.btn1SelectedBorder.hidden = YES;
    self.btn2SelectedBorder.hidden = NO;
    self.btn3SelectedBorder.hidden = YES;
}

-(IBAction)opcao3:(id)sender{
    opcao1 = false;
    opcao2 = false;
    opcao3 = true;
    self.opcao1.selected = NO;
    self.opcao2.selected = NO;
    self.opcao3.selected = YES;
    self.btn1SelectedBorder.hidden = NO;
    self.btn2SelectedBorder.hidden = YES;
    self.btn3SelectedBorder.hidden = YES;
}

-(IBAction)confirmar:(id)sender{
    if (opcao1) {
        self.player.nomeEscolhido = @"Felizópolis";
    }
    else if (opcao2){
        self.player.nomeEscolhido = @"Maravilandia";
    }
    else{
        self.player.nomeEscolhido = @"Alegrolandia";
    }
    Fim *game = [self.storyboard instantiateViewControllerWithIdentifier:@"FimVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}

-(IBAction)cancelar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path10];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer11 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer11 play];
}

@end

//
//  Votacao.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/22/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Votacao.h"
#import "Fim.h"

@interface Votacao (){
    BOOL opcao1;
    BOOL opcao2;
    BOOL opcao3;
}

@end

@implementation Votacao

- (void)viewDidLoad {
    [super viewDidLoad];
    opcao1 = false;
    opcao2 = false;
    opcao3 = false;
}

-(IBAction)opcao1:(id)sender{
    opcao1 = true;
    opcao2 = false;
    opcao3 = false;
}

-(IBAction)opcao2:(id)sender{
    opcao1 = false;
    opcao2 = true;
    opcao3 = false;
}

-(IBAction)opcao3:(id)sender{
    opcao1 = false;
    opcao2 = false;
    opcao3 = true;
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
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

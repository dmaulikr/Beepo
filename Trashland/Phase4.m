//
//  Phase4.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/16/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase4.h"
#import "Puzzle4.h"
#import "Votacao.h"

@implementation Phase4

-(void)viewDidLoad{
 [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.fundo.frame.size.width, self.fundo.frame.size.height);
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.madeiraDoacao];
    [self.fundo addSubview:self.velhaDoacao];
    [self.fundo addSubview:self.botaoDoacao];
    [self.fundo addSubview:self.menino1];
    [self.fundo addSubview:self.menino2];
    [self.fundo addSubview:self.guarda];
    [self.fundo addSubview:self.prefeito];
    [self.fundo addSubview:self.bandeira];
    [self.fundo addSubview:self.zzzVagabundo];
    [self.fundo addSubview:self.vagabundo];
    [self.fundo addSubview:self.nomeFaixa];
    [self.fundo addSubview:self.botaoDoacao];
    [self.fundo addSubview:self.botaoEleicao];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.badgeDoacao];
    [self.fundo addSubview:self.badgeVoto];
}

-(IBAction)votar:(id)sender{
    Votacao *game = [self.storyboard instantiateViewControllerWithIdentifier:@"VotacaoVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}
-(IBAction)doar:(id)sender{
    Puzzle4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Puzzle4VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:NO completion:nil];
}

@end

//
//  Fim.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/22/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Fim.h"

@interface Fim ()

@end

@implementation Fim

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.player.nomeEscolhido isEqualToString:@"Felizópolis"]) {
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-11"];
        }else if([self.player.nomeEscolhido isEqualToString:@"Maravilandia"]){
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-12"];
        }else{
            self.flagImageView.image = [UIImage imageNamed:@"prefeitura-10"];
        }
     });
}




@end

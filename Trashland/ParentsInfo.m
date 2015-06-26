//
//  ParentsInfo.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/26/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "ParentsInfo.h"
#import "Extras.h"
#import "Pais.h"

@interface ParentsInfo ()

@end

@implementation ParentsInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.buttonCreditos];
    [self.view addSubview:self.buttonPai];
    [self.view addSubview:self.buttonVoltar];
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)creditos:(id)sender{
        Extras *game = [self.storyboard instantiateViewControllerWithIdentifier:@"ExtrasVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:game animated:YES completion:nil];
}
-(IBAction)pais:(id)sender{
        Pais *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PaisVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:game animated:YES completion:nil];
}

@end

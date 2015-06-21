//
//  Story4.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/19/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story4.h"

@interface Story4 ()

@end

@implementation Story4

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.fundo];
    self.fundo.image = [UIImage imageNamed:@"historia-prefeitura"];
}

@end

//
//  Story4.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/19/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story4.h"
#import "Phase4.h"

@interface Story4 ()

@end

@implementation Story4


-(void)dealloc{
    NSLog(@"desalocou story4");
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.fundo];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        Phase4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase4VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight)
    {
        
    }
}


@end

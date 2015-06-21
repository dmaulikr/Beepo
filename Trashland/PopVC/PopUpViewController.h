//
//  PopUpViewController.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 21/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PopUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *popUpView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeImageView;
- (void)showInView:(UIView *)aView animated:(BOOL)animated;
- (void)setImageNamed:(NSString *)imageName;
@end

//
//  DraggableView.h
//  AnimationTests
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraggableView : UIView
@property (weak, nonatomic) UIImageView* charImgView;
@property   (weak,nonatomic) UIViewController* delegate;
@end

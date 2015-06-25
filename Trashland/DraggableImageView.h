//
//  DraggableImageView.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraggableImageView : UIImageView <UIDynamicItem>

@property   (weak,nonatomic) UIViewController* delegate;
@property (nonatomic) BOOL podeX;
@property (nonatomic) BOOL podeY;
-(void) morre;
@end

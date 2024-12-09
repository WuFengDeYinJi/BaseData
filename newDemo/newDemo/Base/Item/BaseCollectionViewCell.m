//
//  BaseCollectionViewCell.m
//  BaseToolSystem
//
//  Created by 靳建南 on 2018/11/6.
//  Copyright © 2018年 靳建南. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

@end

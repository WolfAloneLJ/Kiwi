//
//  KWGenericMatcher.m
//  Kiwi
//
//  Created by Luke Redpath on 24/01/2011.
//  Copyright 2011 Allen Ding. All rights reserved.
//

#import "KWGenericMatcher.h"
#import "KWGenericMatchEvaluator.h"

@interface KWGenericMatcher ()

#pragma mark - Properties

@property (nonatomic, strong) id matcher;

@end

@implementation KWGenericMatcher

@synthesize matcher;


#pragma mark - Matching

- (BOOL)evaluate {
    return [KWGenericMatchEvaluator genericMatcher:self.matcher matches:self.subject];
}

- (NSString *)failureMessageForShould {
  return [NSString stringWithFormat:@"expected subject to match %@", self.matcher];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"match %@", [self.matcher description]];
}

#pragma mark - Getting Matcher Strings

+ (NSArray *)matcherStrings {
  return @[@"match:"];
}

#pragma mark - Configuring Matchers

- (void)match:(id)aMatcher;
{
    self.matcher = aMatcher;
}

@end

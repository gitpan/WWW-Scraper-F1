
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Scrape f1.com for next race en championship.",
  "AUTHOR" => "Freek Kalter <freek\@kalteronline.org>",
  "BUILD_REQUIRES" => {
    "FindBin" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WWW-Scraper-F1",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WWW::Scraper::F1",
  "PREREQ_PM" => {
    "Data::Dumper" => 0,
    "DateTime::Format::Duration" => 0,
    "DateTime::Format::Natural" => 0,
    "Exporter" => 0,
    "HTML::TreeBuilder" => 0,
    "LWP" => 0,
    "Storable" => 0,
    "Time::Piece" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




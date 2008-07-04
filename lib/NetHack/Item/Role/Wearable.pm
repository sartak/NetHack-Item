#!/usr/bin/env perl
package NetHack::Item::Role::Wearable;
use Moose::Role;
use MooseX::AttributeHelpers;

has worn => (
    metaclass => 'Bool',
    is        => 'rw',
    isa       => 'Bool',
    provides  => {
        set   => 'wear',
        unset => 'remove',
    },
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->worn($stats->{worn} ? 1 : 0);
};

no Moose::Role;

1;


<?php

/**
 * The RealSubject contains some core business logic. Usually, RealSubjects are
 * capable of doing some useful work which may also be very slow or sensitive -
 * e.g. correcting input data. A Proxy can solve these issues without any
 * changes to the RealSubject's code.
 */
class RealSubject implements SubjectInterface
{
    public function request(): void
    {
        echo "RealSubject: Handling request.\n";
    }
}

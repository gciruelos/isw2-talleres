//  http://spinroot.com/spin/Man/1_Exercises.html


mtype = { a0, a1, b0, b1, err }  // file ex_2.pml

chan a2b = [0] of { mtype }	 // a rendezvous channel for messages from A to B
chan b2a = [0] of { mtype }	 // a second channel for the reverse direction

active proctype A()
{
S1:	a2b!a1
S2:	if
	:: b2a?b1  -> goto S1
	:: b2a?b0  -> goto S3
	:: b2a?err -> goto S5
	fi
S3:	a2b!a1  -> goto S2
S4:	b2a?err -> goto S5
S5:	a2b!a0  -> goto S4
}

active proctype B()
{
	goto S2
//S1:	b2a!b1  // aca deberia poder devolver error
S1:
	do
		:: b2a!b1; break;
		:: b2a!err; break;
	od
S2:	if
	:: a2b?a0  -> goto S3
	:: a2b?a1  -> goto S1
	:: a2b?err -> goto S5
	fi
S3:	b2a!b0 -> goto S2
S4:	a2b?_  -> goto S1
S5:	b2a!b0 -> goto S4
}

// a) Hay estados inalcanzables. Para A: a2b!a1, b2a?err, a2b!a0.
//                               Para B: b2a!b0, a2b?_, b2a!b0.
//
// b) En S1 B deberia poder fallar, lo arregle (la linea vieja quedo en //S1: 

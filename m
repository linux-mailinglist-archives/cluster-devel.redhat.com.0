Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 394EF17F61
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 19:55:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB51D7813;
	Wed,  8 May 2019 17:55:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CAFE5782;
	Wed,  8 May 2019 17:55:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E92BF18089C8;
	Wed,  8 May 2019 17:55:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48HtSI7003429 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 13:55:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21BA510027D4; Wed,  8 May 2019 17:55:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C3D610027D3
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 17:55:25 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC8B9308795F
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 17:55:24 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s7so12838233ljh.1
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tB0dEg1LRdoWuwbFpIiC/qOnD5MiJ0Og2mGu9A6NlQo=;
	b=JCVzPV7zayA3wH6+Io+L76NQ2XQ8WUGer5LQj7CW69X+OplpDh3FykX8GJcnSmmntK
	OTIZ8qaVdAmxkZOd5IR6LTfpT5e2bXYmZv/WbMNYfhuZMvs+AgjkFhVxMk5XVgorcaF0
	GMeaq61fFXW9McmxexkVjLBG42BxtDDsoVj1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tB0dEg1LRdoWuwbFpIiC/qOnD5MiJ0Og2mGu9A6NlQo=;
	b=pIWxgbjR7o+N2sMODONIl7j6evoCdyv2UP7spkrwNMmZ+2WZRSRiEuyTwBut4rpMu8
	/H3RDlvR88uweMDv4I/TZ/Bb5lmlqyAS14OwWTujyXubt/pU7GFcApq09Qg2Vx4wsLvX
	TrrN/4/dF9FWuArr9Ppxsm17PJ3vFN2+CFzu6TJ3TjLOIxhR6Q2YyPRvVMnMW/9cZakI
	MZ0Ka4MvIHEKQHCTyP/PHBDE9aDMXKrtegKwHOQtQ0lqjcOVHm6r8ubbIfmxyZk1bJwO
	gmqgGFdKFvdx5RaUle3yUjef6YNBHvy9+Mip/wSev44doo/i80SCoLvIASSgIwP/F0L7
	Xljg==
X-Gm-Message-State: APjAAAVPZsx3edPbe32tQ+VZlo9rhdKub+2+G6DVSxotxaWmMc25Hpn1
	X5eGb8YupNxZyWinN+NlC1CoM9IQthk=
X-Google-Smtp-Source: APXvYqwWyju/Z0d6QUOGpxT2pDIGGsZCUmNox29GBwiZFXXcrZc1sz6Ff6NU3GgwPM3HwaOqM9UPsA==
X-Received: by 2002:a2e:9141:: with SMTP id q1mr6517622ljg.84.1557338122096;
	Wed, 08 May 2019 10:55:22 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46]) by smtp.gmail.com with ESMTPSA id
	w19sm4242857lfk.56.2019.05.08.10.55.20 for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 10:55:21 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id u27so14927237lfg.10
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 10:55:20 -0700 (PDT)
X-Received: by 2002:a19:ca02:: with SMTP id a2mr20978222lfg.88.1557338120579; 
	Wed, 08 May 2019 10:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
In-Reply-To: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2019 10:55:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
Message-ID: <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 08 May 2019 17:55:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 08 May 2019 17:55:25 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com' HELO:'mail-lj1-f194.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.017  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] GFS2: Pull Request
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 08 May 2019 17:55:56 +0000 (UTC)

On Wed, May 8, 2019 at 4:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> There was a conflict with commit 2b070cfe582b ("block: remove the i
> argument to bio_for_each_segment_all") on Jens's block layer changes
> which you've already merged. I've resolved that by merging those block
> layer changes; please let me know if you want this done differently.

PLEASE.

I say this to somebody pretty much every single merge window: don't do
merges for me.

You are actually just hurting, not helping. I want to know what the
conflicts are, not by being told after-the-fact, but by just seeing
them and resolving them.

Yes, I like being _warned_ ahead of time - partly just as a heads up
to me, but partly also to show that the maintainers are aware of the
notifications from linux-next, and that linux-next is working as
intended, and people aren't just ignoring what it reports.

But I do *NOT* want to see maintainers cross-merging each others trees.

It can cause nasty problems, ranging from simply mis-merges to causing
me to not pull a tree at all because one side of the development
effort had done something wrong.

And yes, mis-merges happen - and they happen to me too. It's fairly
rare, but it can be subtle and painful when it does happen.

But (a) I do a _lot_ of merges, so I'm pretty good at them, and (b) if
_I_ do the merge, at least I know about the conflict and am not as
taken by surprise by possible problems due to a mis-merge.

And that kind of thing is really really important to me as an upstream
maintainer. I *need* to know when different subtrees step on each
others toes.

As a result, even when there's a conflict and a merge is perfectly
fine, I want to know about it and see it, and I want to have the
option to pull the maintainer trees in different orders (or not pull
one tree at all), which means that maintainers *MUST NOT* do
cross-tree merges. See?

And I don't want to see back-merges (ie merges from my upstream tree,
as opposed to merges between different maintainer trees) either, even
as a "let me help Linus, he's already merged the other tree, I'll do
the merge for him". That's not helping, that's just hiding the issue.

Now, very very occasionally I will hit a merge that is so hard that I
will go "Hmm, I really need the involved parties to sort this out".
Honestly, I can't remember the last time that happened, but it _has_
happened.

Much more commonly, I'll do the merge, but ask for verification,
saying "ok, this looked more subtle than I like, and I can't test any
of it, so can you check out my merge". Even that isn't all that
common, but it definitely happens.

There is _one_ very special kind of merge that I like maintainers
doing: the "test merge".

That test merge wouldn't be sent to me in the pull request as the
primary signed pull, but it's useful for the maintainer to do to do a
final *check* before doing the pull request, so that you as a
maintainer know what's going on, and perhaps to warn me about
conflicts.

If you do a test merge, and you think the test merge was complex, you
might then point to your resolution in the pull request as a "this is
how I would do it". But you should not make that merge be *the* pull
request.

One additional advantage of a test merge is that it actually gives a
"more correct" diffstat for the pull request. Particularly if the pull
request is for something with complex history (ie you as a maintainer
have sub-maintainers, and have pulled other peoples work), a
test-merge can get a much better diffstat. I don't _require_ that
better diffstat, though - I can see how you got the "odd" diffstat if
you don't do a test merge - but it's can be a "quality of pull
request" thing.

See what I'm saying? You would ask me to pull the un-merged state, but
then say "I noticed a few merge conflicts when I did my test merge,
and this is what I did" kind of aside.

                     Linus

